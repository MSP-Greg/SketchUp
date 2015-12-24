# [native_ruby_syms.txt]:https://github.com/MSP-Greg/SketchUp/blob/master/su_info_txt/native_ruby_syms.txt
# [Template_Symbols.md]:file/docs/Template_Symbols.md
# [su??\_constants_tab_md.txt]:https://github.com/MSP-Greg/SketchUp/tree/master/su_info_txt
# ## Purpose:
#
# Creates an md file of most of the symbols defined in SketchUp.  Root constants
# are not listed, but can be found in the 'Constants List'.
#
# ## Required files:
#
# | File name                               |  Information / Notes                     |
# |:----------------------------------------|:-----------------------------------------|
# | [Template_Symbols.md]                   | markdown template                        |
# | [native_ruby_syms.txt]                  | contains symbols native to Ruby          |
# | [su??\_constants_tab_md.txt]<br/>&#160; | used to remove some constants<br/>from the symbols list. |
#
module SUMD_Symbols
#{ Class variables

  @version = 2.0.to_f

  @rb_dir = File.dirname(__FILE__)

  unless ( defined?(SUMD) && SUMD.respond_to?(:sumd_file_write) )
    load "#{@rb_dir}#{File::SEPARATOR}sumd_common.rb"
  end

  @empty = "<tr class='e'><td colspan='3'></td></tr>\n"
  
  @b_l_3 = "<tr class='t'><td></td><td></td><td></td></tr>\n" \
           "<tr class='b1'><td></td><td class='b'></td><td></td></tr>\n"

  @b_h_3 = "<tr class='t' ><td colspan='3'></td></tr>\n" \
           "<tr class='b2'><td colspan='3'></td></tr>\n"

  @text    = ''

  @text_md = ''

  # used in file names, which are also shown in the 'finished' messagebox
  @su_major = Sketchup.version.split('.')[0].rjust(2, '0')

#} Class variables

  # Main entry point
  def self.sumd__run
    return unless ( @text_md   = SUMD.sumd_file_read('Template_Symbols.md') )
    return unless ( @constants = SUMD.sumd_file_read("su#{@su_major}_constants_tab_md.txt") )

    # get hash from file of native Ruby symbols
    @h_native = {}
    return unless SUMD::sumd_get_ruby_hash(@h_native, true)

    @constants.gsub!(/[\s]{2,}/, "\n")

    # load @rt_cnsts hash with root constant names
    @rt_cnsts = {}
    while (sumd_match = @constants.slice!(/^[^\t]+/) ) do
      @rt_cnsts[sumd_match] = nil unless (/::/ === sumd_match)
    end
    @constants = nil

    @sym_attr  = []
    @sym_up    = []
    @sym_f_up  = []
    @sym_f_lwr = []
    @sym_glbl  = []

    Symbol.all_symbols.each { |x|
      s = x.to_s
      next if @h_native.key?(s) || @rt_cnsts.key?(s) || (/^sumd/i === s)
      next if s == ''
      if    (/^[a-z0-9_]/ =~ s)  ;  @sym_f_lwr << ":#{s}"
      elsif (s.upcase     == s)  ;  @sym_up    << ":#{s}"
      elsif (/^[^@$]/     =~ s)  ;  @sym_f_up  << ":#{s}"
      elsif (/^\$/        =~ s)  ;  @sym_glbl  << "#{s}"
      end
    }
    @sym_f_lwr.sort!
    @sym_f_up.sort!
    @sym_up.sort!
    @sym_glbl.sort!

#    puts @sym_glbl.join("\n")
#    puts "@sym_up.join"
#    puts @sym_up.join("\n")

    @ctr_attr = 0

    sumd_lwr_attr()
    sumd_md__attr() if @attrs.length > 0

    @text_md.sub!(/<%= found %>/, sumd_found_txt() )

    sumd_txt_list(@sym_f_lwr)
    sumd_md__list(@sym_f_lwr , '_method'  )

    sumd_txt_list(@sym_f_up)
    sumd_md__list(@sym_f_up  , '_class'   )

    sumd_txt_list(@sym_up)
    sumd_md__list(@sym_up    , '_constant')

    @text_md.sub!(/<%= hdr %>/, SUMD.sumd_generated_by(name, @version))

    files = []

    files << SUMD.sumd_file_write('Symbols.md' , @text_md)
    files << SUMD.sumd_file_write('symbols.txt', @text)

    puts "-------------------------------------------------\n" \
         "#{name} wrote the following files:\n#{files.join(10.chr)}\n"

  end

  # Loads @attrs, removes items from @sym_f_lwr
  #
  def self.sumd_lwr_attr()
    @attrs = []
    a = @sym_f_lwr
    a << ''
    a << ''
    line = 0
    i = 0
    while (a[i] != '') do
      v = a[i]
      s = nil
      break if (v == '')
      del = false
      if (/#{v}[\?\=]/ === a[i+1] )
        y = a[i+1]
        z = a[i+2]
        del = true
        if (/\?$/ === y )
          s = ['?', '&#160;', "#{v}"]
          @text << "#{v}\t\t#{y}"
          @ctr_attr += 2
        else
          s = ['&#160;', '=', "#{v}"]
          @text << "#{v}\t#{y}"
          @ctr_attr += 2
          if (/#{v}\?/ === z )
            s[0] = '?'
            @text << "\t#{z}"
            @ctr_attr += 1
            a.delete_at(i+2)
          end
        end
      else
        if (/\?$/ === v )
          s = ['&#160;', '&#160;', "#{v}"]
          @text << "#{v}"
          @ctr_attr += 1
          a.delete_at(i)
        @text << "\n"
        i -= 1
        line += 1
        @text << "\n" if line % 5 == 0
        end
      end
      if (del)
        a.delete_at(i+1)
        a.delete_at(i)
        @text << "\n"
        i -= 1
        line += 1
        @text << "\n" if line % 5 == 0
      end
      i += 1
      @attrs << s if s
    end
    @text << "\n"
    a.pop
    a.pop
  end

  # Adds blank lines for alpha splits, returns 2 column split info
  # @param a [Array<String>, Array<Array<String>>]
  # @param idx [Integer] index of sort item, -1 if param a is array of strings
  # @param r [String, Array<String>] empty item
  # @return [Array<Integer,Integer>] ret[0] is upper loop idx, ret[1]
  #   is start idx of 2nd column
  #
  def self.sumd_split_list(a, idx, r)
    # add blank 'lines' for alphabet grouping
    len = a.length - 2
    len.downto(0) { |i|
      if (idx >= 0)
        if  a[i][idx].slice(1,1) != a[i+1][idx].slice(1,1)
          a.insert(i+1, r)
        end
      else
        if  a[i].slice(1,1) != a[i+1].slice(1,1)
          a.insert(i+1, r)
        end
      end
    }
    # find split info
    len = a.length
    split = ( 0.5 * (a.length + 1) ).floor
    upto = len
    downto = 0

    split.upto(len) { |i|
      if (idx >= 0)
        if a[i][idx] == '&#160;'
          upto = i
          break
        end
      else
        if a[i] == '&#160;'
          upto = i
          break
        end
      end
    }

    split.downto(0) { |i|
      if (idx >= 0)
        if a[i][idx] == '&#160;'
          downto = i
          break
        end
      else
        if a[i] == '&#160;'
          downto = i
          break
        end
      end
    }
#    puts "downto = #{downto}    upto = #{upto}  split = #{split}"

    if (split - downto) > (upto - split)
      # use upto, second column shorter
      a.delete_at(upto)
      length = [upto - 1, upto]
    else
      # use downto, second column longer
      a.delete_at(downto)
      len = a.length
      length = [len - downto - 1, downto]
    end
    length
  end

  # Loads 'atrribute' table data into md text
  #
  def self.sumd_md__attr()
    # add blank 'lines' for alphabet grouping, find split
    length = sumd_split_list(@attrs, 2, ['&#160;', '&#160;', '&#160;'])
    len = @attrs.length
    tt = "<thead><tr>\n" \
         "<th class='c'>B</th><th class='c'>W</th><th>&#160;Attribute</th><th></th>" \
         "<th class='c'>B</th><th class='c'>W</th><th>&#160;Attribute</th>" \
         "</tr><tbody>\n"
    b = ['&#160;', '&#160;', '&#160;']
    0.upto(length[0]) { |i|
      e1 = ( i < length[1]       ? @attrs[i]             : b )
      e2 = ( i + length[1] < len ? @attrs[i + length[1]] : b )

      tt << "<tr><td class='c'>#{e1[0]}</td><td class='c'>#{e1[1]}</td>" \
            "<td>#{e1[2]}</td><td>&#160;</td><td class='c'>#{e2[0]}</td>" \
            "<td class='c'>#{e2[1]}</td><td>#{e2[2]}</td></tr>\n"
    }
    tt << "</tbody>\n"
    @text_md.sub!(/<%= _attribute %>/, tt)
  end

  # Loads lists / arrays into md @text_md
  # @param list      [Array<String>]
  # @param sumd_name [String] name of 'erb' variable in @text_md
  #
  def self.sumd_md__list(list, sumd_name)
    # add blank 'lines' for alphabet grouping, find split
    t = sumd_split_list(list, -1, '&#160;')
    list.insert(t[1], '&#160;')

    tt = ''
    tt << @b_h_3
    sub = []

    while (list.length > 0) do
      a1 = 0
      a2 = 0
      0.upto(list.length - 1) { |i|
        a1 = a2
        a2 = i if list[i] == '&#160;'
        if (a1 > 20) && (a2 - a1) > 30
          # send a1 to text
          sub = list.slice!(0, a1)
          list.slice!(0)
          break
        elsif a2 > 50
          sub = list.slice!(0, a2)
          list.slice!(0)
          break
        elsif i == list.length - 1
          sub = list.slice!(0, list.length)
        end
      }
      break if sub.length == 0
      len = sub.length
      split = ( 0.5 * (len + 1) ).floor
      0.upto(split - 1) { |i|
        e1 = sub[i]
        e2 = ( i + split < len ? sub[i + split] : '&#160;' )
        tt << "<tr><td>#{e1}</td><td>&#160;</td><td>#{e2}</td></tr>\n"
        tt << @b_l_3 if ( (i+1) % 5 == 0 && (i != split - 1) )
      }
      tt << @empty + @empty + @b_h_3 + @empty
    end
    tt << "</tbody>\n"
    @text_md.sub!(/<%= #{sumd_name} %>/, tt)
  end

  # Returns a string with the quantities of constant types found.
  # @return [String]
  #
  def self.sumd_found_txt()
    n = '&#8196;&#8197;'

         a = @ctr_attr
       low = @sym_f_lwr.length
        up = @sym_f_up.length
    upcase = @sym_up.length

    t = (a + low + up + upcase).to_s.gsub(/(\d)(?=(\d{3})+(?!\d))/, "\\1,")

         a =      a.to_s.rjust(3).gsub(/ /, n)
       low =    low.to_s.rjust(3).gsub(/ /, n)
        up =     up.to_s.rjust(3).gsub(/ /, n)
    upcase = upcase.to_s.rjust(3).gsub(/ /, n)

    "Found #{t} symbols, listed as follows:\n\n" \
    "* #{a      } as attribute names\n" \
    "* #{low    } with lower case 1st letter\n" \
    "* #{up     } with upper case 1st letter\n" \
    "* #{upcase } with all upper case lettering"
  end

  # Loads lists / arrays into text @text
  # @param list [Array<String>]
  #
  def self.sumd_txt_list(list)
    count = 0
    list.each { |s|
      @text << "#{s}\n"
      count += 1
      @text << "\n" if count % 5 == 0
    }
    @text << "\n"
  end
end
SUMD_Symbols.sumd__run()
