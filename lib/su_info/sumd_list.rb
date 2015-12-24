# [native_ruby_cnsts.txt]:https://raw.githubusercontent.com/MSP-Greg/SketchUp/master/su_info_txt/native_ruby_cnsts.txt
# [Template_List.md]:file/docs/Template_List.md
#
# ## Purpose:
#
# Note - variable, parameter, and method names in this Module are done such that
# they do not add any new symbol names that aren't already used, otherwise it
# prefixes them with sumd_.
#
# Creates three files (?? is two digit SketchUp version):
#
# | File name                              | Information / Notes                              |
# |----------------------------------------|:-------------------------------------------------|
# | SketchUp_??\_Constants\_List.md        | Markdown 'List' file                             |
# | su??\_constants\_tab.txt               | Tab Delimited text                               |
# | su??\_constants\_tab_md.txt<br/>&#160; | Tab Delimited text, used<br/>to make 'Guide' md file |
#
# The three files list all classes, modules, and constants defined by SketchUp.
#
# ## File layout:
#
# * Root (or un-namespaced) constants defined by the SketchUp environment
# * 'Namespaced' constants defined in SketchUp, starting with SketchUp
# * List of SketchUp modules / classes that have no constants defined
#
# ## Required files:
#
# | File name               |  Information / Notes                     |
# |:------------------------|:-----------------------------------------|
# | [Template_List.md]      | markdown template                        |
# | [native_ruby_cnsts.txt] | contains 'root' constants native to Ruby |
#
# ## Code Process:
#
# 1. Creates array of root constants
# 2. Loop thru array
#   1. Removes constants that exist in native Ruby (h_native)
#   2. Splits constants into constants and objects
# 3. Adds constants to file text
# 4. Calls [.sumd_find_nested](#sumd_find_nested-class_method) and
#      processes namespaced constants
#
# **Lastly, remember to unload all of your extensions / plug-ins before runnning this.**
#
module SUMD_List
#{ Variables

  @version = 2.0.to_f

  @rb_dir = File.dirname(__FILE__)

  unless ( defined?(SUMD) && SUMD.respond_to?(:sumd_file_write) )
    load "#{@rb_dir}#{File::SEPARATOR}sumd_common.rb"
  end

  @empty = "<tr class='e'><td></td></tr>"

  @b_l_3 = "<tr class='t' ><td colspan='3'></td></tr>\n" \
           "<tr class='b1'><td colspan='3'></td></tr>\n"

  @b_h_3 = "<tr class='t' ><td colspan='3'></td></tr>\n" \
           "<tr class='b2'><td colspan='3'></td></tr>\n"

  @b_l_5 = "<tr class='t' ><td colspan='5'></td></tr>\n" \
           "<tr class='b1'><td colspan='5'></td></tr>\n"

  @b_h_5 = "<tr class='t' ><td colspan='5'></td></tr>\n" \
           "<tr class='b2'><td colspan='5'></td></tr>\n"

  @b_l_5_split = "<tr class='t' >#{ '<td></td>' * 5 }</tr>\n" \
    "<tr class='b1'>#{ '<td></td>' * 2 }<td class='b'></td>#{ '<td></td>' * 2 }</tr>\n"

  @su_docs = "http://www.sketchup.com/intl/en/developer/docs/ourdoc/"

  # table text for md file
  @text         = ''
  # text from Template_list.md file
  @text_md      = ''

  # text of tab delimited file
  @text_tab     = ''

  # text of tab delimited file used for creating the
  # SketchUp_??_Constants_Guide.md file
  @text_tab_md  = ''

  # text of file section that listed 'no constants' objects, md file
  @no_const     = "<tbody><tr><td><strong>SketchUp Object</strong></td>" \
                       "<td><strong>superclass</strong></td>" \
                       "<td><strong>is_a?</strong></td></tr>\n#{@b_h_3}"

  # text of file section that listed 'no constants' objects, tab delimited file
  @no_const_tab = ''

  # counter for root constants
  @ctr_root   = 0
  # counter for constants in SketchUp classes / modules
  @ctr_su     = 0
  # counter for classes in SketchUp classes / modules
  @ctr_su_cls = 0
  # counter for SketchUp classes / modules that have no constants
  @ctr_su_no  = 0

#} Class variables

  # Main entry point
  #
  def self.sumd_run()
    return unless (@text_md = SUMD.sumd_file_read('Template_List.md'))

    # get hash from file of native Ruby objects
    sumd_ruby_c_hash = {}
    return unless SUMD.sumd_get_ruby_hash(sumd_ruby_c_hash)

    sumd_re_incld = /^(Array|Numeric|String|RUBY_)/
    objs = []
    constants = []

    # sort root constants into two arrays, constants and module objects
    Object.constants.sort.each { |c|
      str = c.to_s
      next if ( str =~ /^SUMD/ || (sumd_ruby_c_hash.key?(str) && !(str =~ sumd_re_incld)) )
      o = Object.const_get(c)
      if ( o.is_a?(Module) )
        next if (o.name =~ /^(Continuation|MatchData|Precision)/)
        objs << o
      else
        constants << [str, o, o.class]
      end
    }
    @ctr_root = constants.length

    # process root constants
    sumd_root(constants, /^CMD_/)      if ( constants.length > 0)
    sumd_root(constants, /^GL_/)       if ( constants.length > 0)
    sumd_root(constants, /^LAYER_/, 1) if ( constants.length > 0)
    if ( constants.length > 0)
      sumd_root(constants, /^RUBY_/, 1)
    end
    sumd_root(constants, /^VK_/)       if ( constants.length > 0)
    sumd_root(constants)               if ( constants.length > 0)

    @text_md.sub!(/<%= gc %>/, "<tbody>\n#{@text}</tbody>\n")
    @text = ''

    # process root modules / classes, sort SketchUp on top
    # then call sumd_find_nested
    if (objs.length > 0)
      objs.delete(Object)
      objs.delete(Sketchup)
      objs.sort! { |a,b| a.to_s <=> b.to_s }
      objs.insert(0, Sketchup)
      objs.each { |o| sumd_find_nested(o) }
    end

    @text_md.sub!(/<%= nsc %>/, "<tbody>\n#{@text}</tbody>\n")
    @text_md.sub!(/<%= noc %>/, "#{@no_const}</tbody>\n")
    @text = ''

    # write info on modules / classes with no constants
    @text_tab << "\n"
    @text_tab    << @no_const_tab
    @text_tab_md << @no_const_tab

    sumd_done()
  end

  # Parses constants, determines grouping and one or two layout,
  #   writes data to md file
  # @param constants [Array<String, val, val.class>] array of row info
  # @param ref   [RegEx, nil] Regex for search , eg /^CMD_/
  # @param cols [Fixnum,nil] if nil, uses 2 column layout for match, if 1,
  #   uses single column.  Only used for RUBY_ and LAYER_
  #
  def self.sumd_root(constants, ref = nil, cols = 2)
    found = false
    idx = 0

    # find first item that matches
    if ref
      constants.each_with_index { |r,i|
        if (r[0] =~ ref)
          found = true
          idx = i
          break
        end
      }
    else
      found = true
      idx = constants.length
    end

    if found
      # write items before 1st match
      sub = constants.slice!(0, idx)
      @ctr = 0
      while (sub.length > 0) do
        len = sub.length - 1
        if sub[0][2] == Fixnum
          1.upto(len) { |i|
            if sub[i][2] != Fixnum
              s = sub.slice!(0, i)
              sumd_write_2(s, Object)
              @text << @empty + @b_h_5
              @ctr = -1
              break
            else
              @ctr = i
            end
          }
          if @ctr == len
            s = sub.slice!(0, @ctr + 1)
            sumd_write_2(s, Object)
            @text << @empty + @b_h_5
          end

        else
          1.upto(len) { |i|
            if sub[i][2] == Fixnum
              s = sub.slice!(0, i)
              sumd_write_1(s, Object)
              @text << @empty + @b_h_5
              @ctr = -1
              break
            else
              @ctr = i
            end
          }
          if @ctr == len
            s = sub.slice!(0, @ctr + 1)
            sumd_write_1(s, Object)
            @text << @empty + @b_h_5
          end
        end
        if sub.length == 1
          if sub[0][2] == Fixnum
            sumd_write_2(sub, Object)
          else
            sumd_write_1(sub, Object)
          end
          @text << @empty + @b_h_5
          sub = []
        end
      end

      # find last index that matches
      found = false
      idx = 0

      constants.each_with_index { |r,i|
        if (r[0] =~ ref)
          found = true
          idx = i
        end
      }
      # write all matching items
      if found
        sub = constants.slice!(0, idx + 1)
        if cols == 2
          sumd_write_2(sub, Object)
          @text << @empty + @b_h_5
        else
          sumd_write_1(sub, Object)
          @text << @empty + @b_h_5
        end
      end
    end
  end

  # Finds all constants in object namespace, reentrant.
  #
  # Adds the info to file text strings by calling
  #   [.write_constants](#write_constants-class_method)
  #
  # @param obj [Object]
  #
	def self.sumd_find_nested(obj)
    constants = []
    objs   = []

    sumd_bsc = obj.respond_to?(:superclass)
    sumd_sc  = sumd_bsc ? obj.superclass : "na"

    # show as Class, then Module, then Object, then ???
    sumd_type = if obj.is_a?(Class)  ; "Class"
             elsif obj.is_a?(Module) ; "Module"
             elsif obj.is_a?(Object) ; "Object"
             else                       ; "???"
             end

    sumd_obj_str  = obj.to_s

    # get constants, divide into object & constants
    obj.constants.sort.each { |c|
      next if (sumd_bsc && obj.superclass.const_defined?(c) )
      o = obj.const_get(c)
      # note: assignment
      if o.is_a?(Module)
        objs << o
      else
        constants << [c.to_s, o, o.class]
      end
    }

    len = constants.length
    @ctr_su += len

    if (/(::)*([^:]+)$/ === sumd_obj_str)
      sumd_link = "<a href='#{@su_docs}#{$2.downcase}'>#{sumd_obj_str}" if $2
    end

    if (len != 0)
      constants.sort! { |a,b| a[1] <=> b[1] } if obj == Sketchup::Model

      if @ctr_su_cls > 0
        @text << @empty
        @text << @b_h_5
      end
      # add object row
			@text << "<tr><td colspan='2'><strong>#{sumd_link}::</a></strong></td>" \
                   "<td colspan='2'><strong>#{sumd_sc}</strong></td>" \
                   "<td><strong>#{sumd_type}</strong></td></tr>\n"
      @text << @b_l_5
      sumd_write_2(constants, obj)
      @ctr_su_cls += 1

      @text_tab << "\n#{sumd_obj_str}::\t\t#{sumd_sc}\n"
      @text_tab << "\n"
		else
      # add information about object to no_constants strings
      @no_const     << "<tr><td>#{sumd_link}</a></td><td>#{sumd_sc}" \
                       "</td><td>#{sumd_type}</td></tr>\n"
      @no_const_tab << "#{sumd_obj_str}\tno constants\t#{sumd_sc}\t#{sumd_type}\n"
      @ctr_su_no += 1
      @no_const << @b_l_3 if (@ctr_su_no % 5 == 0)
    end

    # run child object constants of obj thru this
    objs.each { |o| sumd_find_nested(o) } if (objs.length > 0)
	end

  # One column layout in the markdown file
  #
  # Writes an array of constants to the three output files
  #
  # @param constants  [Array< Array<String, String, String> >]
  # @param obj        [Object] namespace object
  #
  def self.sumd_write_1(constants, obj)
    # cl = class text
    len = constants.length
    f = (obj == Object) ? '' : "#{obj.to_s}::"
    n = ''
    val = ''
    cl = ''
    constants.each { |c|
      n   << "#{c[0]}<br/>"
      val << "#{c[1]}<br/>"
      cl << "#{c[2]}<br/>"
      t = "#{c[0]}\t#{c[1]}\t#{c[2]}\n"
      @text_tab << t
      @text_tab_md << "#{f}#{t}"
    }
    s = ( (constants[0][0] =~ /^RUBY_/) ? 'r' : 'n')
    @text << "<tr><td colspan='5'>" \
               "<span class='#{s}'>#{n}</span>" \
               "<span class='v'>#{val}</span>" \
               "<span class='c'>#{cl}</span></td></tr>"
  end

  # Two column layout in the markdown file
  #
  # Writes an array of constants to the three output files
  #
  # @param constants [Array< Array<String, String, String> >]
  # @param obj       [Object] namespace object
  #
  def self.sumd_write_2(constants, obj)
    #  c = counter   c1 = col 1
    #  f = fqn       c2 = col 2
    # sumd_tt1 = col 1  _tab.txt      sumd_tmd1 = col 1  _tab_md.txt
    # sumd_tt2 = col 2  _tab.txt      sumd_tmd2 = col 2  _tab_md.txt
    c = 0
    f = (obj == Object) ? '' : "#{obj.to_s}::"
    len = constants.length
    split = ( 0.5 * (len + 1) ).floor

    sumd_tt1 = '' ; sumd_tt2 = '' ; sumd_tmd1 = '' ; sumd_tmd2 = ''

    0.upto(split - 1) { |i|
      c1 = constants[i]
      t = "#{c1[0]}\t#{c1[1]}\t#{c1[2]}\n"
      sumd_tt1  << t
      sumd_tmd1 << "#{f}#{t}"
      if i + split < len
        c2 = constants[i + split]
        t = "#{c2[0]}\t#{c2[1]}\t#{c2[2]}\n"
        sumd_tt2  << t
        sumd_tmd2 << "#{f}#{t}"
      else
        c2 = ['&#160;', '&#160;', '&#160;']
      end
      @text << "<tr><td>#{c1[0]}</td><td>#{c1[1]}</td><td></td>" \
                   "<td>#{c2[0]}</td><td>#{c2[1]}</td></tr>"
      c += 1
      if (c % 5 == 0 && c != split)
        @text << @b_l_5_split
      end
    }
    @text_tab << sumd_tt1 + sumd_tt2
    @text_tab_md << sumd_tmd1 + sumd_tmd2
  end

  # Final processing, writes files, chains to SUMD_ConstantsGuide
  def self.sumd_done()
    # create header and add to text
    h = SUMD.sumd_generated_by(name, @version)
    @text_md.sub!(/<%= hdr %>/, h)

    f = sumd_found_txt()
    @text_md.sub!(/<%= found %>/, f)
    @text_tab = "#{h}\n\n#{f.gsub(/&#8196;&#8197;/, ' ')}#{@text_tab}"

    # write files, show done message box
    files = []
    files << SUMD.sumd_file_write('Constants List.md'    , @text_md)
    files << SUMD.sumd_file_write('constants_tab.txt'    , @text_tab)
    files << SUMD.sumd_file_write('constants_tab_md.txt' , @text_tab_md)

    puts "-------------------------------------------------\n" \
         "#{name} wrote the following files:\n#{files.join(10.chr)}\n"
  end

  # Returns the info about what was found
  # @return   [String]
  #
  def self.sumd_found_txt()
     n = '&#8196;&#8197;'

     r =  @ctr_root.to_s.rjust(3).gsub(/ /, n)
     s =    @ctr_su.to_s.rjust(3).gsub(/ /, n)
    no = @ctr_su_no.to_s.rjust(3).gsub(/ /, n)

    t = (@ctr_root + @ctr_su).to_s
    t.gsub!(/(\d)(?=(\d{3})+(?!\d))/, "\\1,")

    "Found #{t} constants, as follows:\n\n" \
    "* #{r } constants defined in Object (global)\n" \
    "* #{s } constants defined in SketchUp objects (namespaced)\n" \
    "* #{no} SketchUp objects with no defined constants\n\n"
  end

end
SUMD_List.sumd_run()
