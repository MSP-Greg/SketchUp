# [Template_Collections.md]:file/docs/Template_Collections.md
# [native_ruby_cnsts.txt]:https://raw.githubusercontent.com/MSP-Greg/SketchUp/master/su_info_txt/native_ruby_cnsts.txt
# ## Purpose:
#
# Creates an md file of the collections defined in SketchUp classes
#
# ## Required files:
#
# | File name                 |  Information / Notes                     |
# |:--------------------------|:-----------------------------------------|
# | [Template_Collections.md] | markdown template                        |
# | [native_ruby_cnsts.txt]   | contains 'root' constants native to Ruby |
#
#
# ## Code Process:
#
# 1. Loop thru `Object.constants`, creating an array of module / class obects
#    defined by SketchUp.  Requires the file native_ruby_cnsts.txt to determine
#    what constants are native to Ruby.
# 2. Adds collections to file text [Template_Collections.md].
# 3. Calls [.find_nested](#find_nested-class_method) and
#    processes namespaced collections.
#
# **Lastly, remember to unload all of your extensions / plug-ins before runnning
#  this.**
#
module SUMD_Collections
#{ Class variables

  @version = 2.0.to_f

  @rb_dir = File.dirname(__FILE__)

  unless ( defined?(SUMD) && SUMD.respond_to?(:sumd_file_write) )
    load "#{@rb_dir}#{File::SEPARATOR}sumd_common.rb"
  end

  @empty_row = "<tr class='t' ><td colspan='7'></td></tr>\n" \
               "<tr class='b1'><td colspan='7'></tr>\n"

  @su_docs = "http://www.sketchup.com/intl/en/developer/docs/ourdoc/"

  # table text for md file
  @text = "<thead><tr>"                    \
           "<th>Object</th>"               \
           "<th class='c'>Enum</th>"       \
           "<th class='c'>#each</th>"      \
           "<th class='c'>#[]</th>"        \
           "<th class='c'>#[]=</th>"       \
           "<th class='c'>#each_pair</th>" \
           "<th>Super</th>"                \
           "</tr></thead><tbody>\n"

  @ctr  = 0

#} Class variables

  # Main entry point
  #
  def self._run()
    # get template
    return unless (@text_md = SUMD.sumd_file_read('Template_Collections.md'))

    # get hash from file of native Ruby objects
    h_native = {}
    return unless SUMD.sumd_get_ruby_hash(h_native)

    # find objects and process
    objects = []
    Object.constants.sort.each { |c|
      o = Object.const_get(c)
      c_to_s = c.to_s
      next if ( /^SUMD/ =~ c_to_s || h_native.key?(c_to_s) )
      objects << o if ( o.is_a?(Module) )
    }

    # process root modules / classes
    if (objects.length > 0)
      # sort with Sketchup first
      objects.delete(Object)
      objects.delete(Sketchup)
      objects.sort! { |a,b| a.to_s <=> b.to_s }
      objects.insert(0, Sketchup)
      # now find info on modules / classes
      objects.each { |o| find_nested(o) }
    end
    done()
  end

  # Finds all collections in object namespace, reentrant.
  # Adds the info to file text string @text
  # @param obj [Object]
  #
	def self.find_nested(obj)
    objects   = []
    isCls = obj.is_a?(Class)
    # get constants, divide into object & constants
    obj.constants.each { |c|
      next if (isCls && obj.superclass.const_defined?(c) )
      o = obj.const_get(c)
      objects << o if o.is_a?(Module)
    }

    add_row(obj, isCls) if obj.public_method_defined?(:each)

    # run child object constants of obj thru this
    if (objects.length > 0)
      objects.sort! { |a,b| a.to_s <=> b.to_s }
      objects.each { |o| find_nested(o) }
    end
	end

  # Adds a row to the table / list
  # @param obj [Object]
  # @param isCls [Boolean] true if object is_a Class
  #
  def self.add_row(obj, isCls)
    super_cls = isCls ? obj.superclass : "not defined"

    obj_str = obj.to_s
    if (/(::)?([^:]+)$/ === obj_str)
      obj_str = "<a href='#{@su_docs}#{$2.downcase}'>#{obj_str}</a>" if $2
    end

    _enum        = obj.include?(Enumerable)
    _each        = obj.public_method_defined?(:each)
    _brackets    = obj.public_method_defined?(:[])
    _brackets_eq = obj.public_method_defined?(:[]=)
    _each_pair   = obj.public_method_defined?(:each_pair)

    # cascades
    _each_pair   = (_each_pair   && _brackets_eq) ? 'Y' : ( _each_pair   ? 'Yes' : ' ')
    _brackets_eq = (_brackets_eq && _brackets   ) ? 'Y' : ( _brackets_eq ? 'Yes' : ' ')
    _brackets    = (_brackets    && _each       ) ? 'Y' : ( _brackets    ? 'Yes' : ' ')
    _each        = (_each        && _enum       ) ? 'Y' : ( _each        ? 'Yes' : ' ')
    _enum        = (_enum ? 'Yes' : ' ')

    @text << "<tr><td>#{obj_str}</td>" \
                  "<td class='c'>#{_enum}</td>" \
                  "<td class='c'>#{_each}</td>" \
                  "<td class='c'>#{_brackets}</td>" \
                  "<td class='c'>#{_brackets_eq}</td>" \
                  "<td class='c'>#{_each_pair}</td>" \
                  "<td>#{super_cls}</td></tr>\n"
    @ctr += 1
    @text << @empty_row if (@ctr % 5 == 0)
  end

  # Inserts data into md template, writes file
  #
  def self.done()
    @text << '</tbody>'

    # add content to md string
    @text_md.sub!( /<%= collection %>/, @text )
    @text_md.sub!(/<%= hdr %>/, SUMD.sumd_generated_by(name, @version))

    # write file, show done message box
    files = []
    files << SUMD.sumd_file_write('Collections.md', @text_md)
    puts "-------------------------------------------------\n" \
         "#{name} wrote the following files:\n#{files.join(10.chr)}\n"
  end

end
SUMD_Collections._run()

