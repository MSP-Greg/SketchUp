# Creates the 'Guide' md file from the following files --
#
# | File name                           |  Information / Notes                                                       |
# |:------------------------------------|:---------------------------------------------------------------------------|
# | Template\_Guide.md                  | markdown template                                                          |
# | Template\_Guide\_Code.rb<br/>&#160; | contains long code snippets shown in md file.<br/>Note: special formatting in comments |
# | su??\_constants\_tab\_md.txt        | contains constant list that is inserted into md file.                      |
# | send_action.txt<br/>&#160;          | contains list of send_action text paramters<br/>scraped from SketchUp.com. |
#
# Code Process Notes:
#
# The first thing the code does is load an array with RenderingOptions keys.
# It then starts a UI timer and loops thru the keys, changing the respective
# key's value.  This generates a RenderingOptionsObserver callback.  This allows
# the code to map RenderingOptions keys to the RenderingOptionsObserver callback
# 'type' parameter.  This takes a litle while.
#
# Loaded and chained to by CreateSUConstants (file: create_su_constants.rb).
# All files need to be located in the hiearchy used in at
# https://github.com/MSP-Greg/SketchUp
#
module CreateSUConstantsGuide

#{ Class variables
  # version number, listed in file headers
  @@version = '1.20'

  # cur dir
  @@dir = File.dirname(__FILE__)
  Dir.chdir(@@dir)

  # text of template file
  @@text_md   = Object.new
  # text of constants file
  @@constants = Object.new
  # runnable code samples file
  @@text_code = Object.new

  # used in file names, which are also shown in the 'finished' messagebox
  @@su_major = Sketchup.version.split('.')[0].rjust(2, '0')
  if ( @@su_major.to_i >= 10 )
    @@toc_su = "20#{@@su_major}"
    @@title_su = @@toc_su
  else
    @@toc_su = @@su_major.to_i.to_s
    @@title_su = @@toc_su.to_s.rjust(5, '_')
  end

#} Class variables

  # Main entry point
  # @return [Void]
  def self._run()
    return unless (@@text_md   = self.file_get_str('Template_Guide.md'))
    return unless (@@text_code = self.file_get_str('Template_Guide_Code.rb'))
    return unless (@@constants = self.file_get_str("su#{@@su_major}_constants_tab_md.txt", "../../su_info_txt"))

    self.insert_code_sample('face_1')
    self.insert_code_sample('len_1')
    self.insert_code_sample('ro_1')
    self.insert_code_sample('ro_2')
    self.insert_code_sample('mouse')

    self.rendering_options_poke()
#    self._run2()
  end

  # runs after rendering_options timer finishes
  def self._run2()
    #
    self.length_constants()

    #
    self.send_action()

    # Geom:: constants
    self.find_regex('[^\r\n\f]+?Geom::', 'Geometry')

    # UI.messagebox type
    self.find_regex('MB_', 'ui_mb_type', '<br/>type parameter')

    # UI.messagebox return
    self.find_regex('ID', 'ui_mb_ret', 'status<br/>return')

    # UI.layer.page_behavior
    self.find_regex('LAYER_', 'layer_page_behavior') { |a,b|
      (a[1].rjust(3, '0') + a[0]) <=> (b[1].rjust(3, '0') + b[0]) }

    # Command.set_validation
    self.find_regex('MF_', 'command_set_validation_proc', 'cmd_status<br/>return')

    # Behavior # snap_to
    self.find_regex('SnapTo_', 'SnapTo_', '<br/>snap_to')
    
    # Dimension #arrow_type #arrow_type=
    self.find_regex('Sketchup::Dimension::ARROW_', 'DimensionArrow', '<br/>arrow_type')

    # Dimension #aligned_text_position
    self.find_regex('Sketchup::DimensionLinear::ALIGNED_', 'Dim_aligned_text', '<br/>')

    # Dimension #text_position
    self.find_regex('Sketchup::DimensionLinear::TEXT_', 'Dim_text_pos', '<br/>text_pos')
    
    # Entities add_faces_from_mesh
    self.find_regex('Geom::PolygonMesh::', 'from_mesh', '<br/>smooth_flags')
    
    # Page#update Pages#add
    self.find_regex('(PAGE_USE_|PAGE_NO_)', 'page_use', '<br/>flag parameter')
    
    # Sketchup::Face::
    self.find_regex('Sketchup::Face::', 'face_classify_point', 'pt_location<br/>return')

    # Sketchup::Importer::
    self.find_regex('Sketchup::Importer::', 'importer', 'status_code<br/>return')

    # Sketchup::Model::
    self.find_regex('Sketchup::Model::', 'model_save', 'version<br/>parameter') { |a, b|
      a[1].to_i <=> b[1].to_i }

    # .set_status_text
    self.find_regex('SB_', 'SB_', 'position<br/>parameter')

    # Text #leader_type
    self.find_regex('ALeader', 'ALeader', '<br/>leader')
    
    # Texturewriter.write
    self.find_regex('FILE_WRITE_', 'texture_writer_write', '<br/>status return')

    # Tool Keyboard
    self.find_regex('VK_', 'tool_key', 'key<br/>parameter')

    # Tool Mouse
    self.find_regex('MK_', 'tool_mse', 'flags<br/>parameter')
    
    # Toolbar
    self.find_regex('TB_', 'TB_', 'state<br/>return')
    
    # View.draw(mode, pts)
    self.find_regex('GL_', 'view_draw', "<br/>mode parameter")
    
    # Vew.draw_text
    self.find_regex('TextAlign', 'view_draw_text', ":align<br/>hash value")
      
    # RUBY_
    self.find_regex('(RUBY_|PLATFORM|RELEASE_DATE|VERSION)', 'RUBY_')

    # Other Object
    self.find_regex('SKETCHUP_CONSOLE', 'other_object')

    # Old key constants
    self.find_regex('(ALT_MODIFIER|CONSTRAIN_MODIFIER|COPY_MODIFIER)','depreciated_constants_1')
    
    # now namespaced
    self.find_regex('DimensionArrow','depreciated_constants_2')
    
    self.unclassified_constants()

    @@text_md.gsub!(/Guide_TOC/, "SketchUp #{@@toc_su} Constants Guide")
    @@text_md.gsub!(/Guide_Title/, "#{@@title_su} Constants Guide")

    self.file_write("SketchUp_#{@@su_major}_Constants_Guide.md", @@text_md, "../../docs/")

    UI.messagebox('Finished!')

  end

  # called for constants that can be found with a RegEx match
  # if re_md is nil, array will be returned
  # @param re_con    [String] used to create RegEx for constant match
  # @param re_md     [String] used to create RegEx for table insertion in md
  # @param cnst_name [String] optional column name for constant name column
  def self.find_regex(re_con, re_md = nil, cnst_name = nil)
    re_full = /^#{re_con}.+?$/
    if (/^[A-Z]/ =~ re_con)
      re_trim = re_con.sub(/[^:]*$/,'')
      trim = (re_trim != '')
    end
    array = []
    while (match = @@constants.slice!(re_full)) do
      array << match.split(/\t/)
    end
    if (array.length > 0)
      # trim namespace from constant name
      array.each { |row| row[0].sub!(re_trim, '') } if trim

      array.sort! { |a,b| yield(a,b) } if block_given?
      if (re_md)
        self.standard_table(array, re_md, cnst_name)
      else
        array
      end
    else
      re_find_text = /<< #{re_md} >>/
      @@text_md.sub!(re_find_text, "<strong>** Constants not defined in SketchUp #{@@toc_su} **</strong><br/><br/>") if re_md
      array
    end
  end

  def self.insert_code_sample(c_name)
    code = @@text_code.slice!(/^\#\{ #{c_name}[\r\n][\s\S]+\#\} #{c_name}/)
    code.sub!(/^\#\{[^\r\n\f]+[\r\n]+/, '')     # remove opening comment marker
    code.sub!(/^def[^\)]+\)[\r\n]+/, '')        # remove def line
    code.sub!(/^end[\r\n]+\#\} #{c_name}/, '')  # remove end and comment marker
    code.sub!(/[ \t\r\n\f]+\z/, '')              # extra blank lines at end
    code.gsub!(/^  /m, '')                      # remove 2 spaces of indent
    @@text_md.sub!(/<< code_#{c_name} >>/, code)
  end

  def self.length_constants()
    options_manager = Sketchup.active_model.options
    array = []
    options_manager.each { |op|
      op_name = op.name
      ctr = 0
      len = op.to_a.length
      op.each { |k, v|
        cls = v.class
        cls = (cls == TrueClass || cls == FalseClass) ? 'Boolean' : cls.to_s
        array << [op_name, k, v.to_s, cls]
      }
    }
    array.pop()
    len = array.length
    if (len > 0)
      array.sort! { |a,b| "#{a[0].ljust(40)}#{a[1]}" <=> "#{b[0].ljust(40)}#{b[1]}" }
      # remove dupicate 1st column
      (len-1).downto(1) { |i| array[i][0] = '' if array[i][0] == array[i-1][0] }
      # insert blank rows
      (len-1).downto(1) { |i| array.insert(i, ['&#160;', '', '', '']) if (array[i][0] != "") }
    end
    hdr_row = ['OptionsManager<br/>key', 'OptionsProvider<br/>key', 'OptionsProvider<br/>value', '<br/>class']
    alignment = ['L' , 'L' , 'C', 'L']
    table = self.create_table(array, hdr_row, alignment)
    @@text_md.sub!(/<< OptionsManager >>/, table)
    self.find_regex('Length::', 'Length::', cnst_name = nil)
  end

  # This loops thru rendering options, then waits for the obeserver to fire.
  #
  # attached a RenderingOptionsObserver, then pokes rendering_options using
  # a UI timer
  # loads an array (@@a_ro) from the keys of a rendering_options instance,
  #
  def self.rendering_options_poke()
    @@am = Sketchup.active_model
    @@am_ro = @@am.rendering_options

    # array holds table columns
    @@a_ro = []

    # load array with 1st 2 columns from @@am_ro 'hash'
    @@am_ro.each_pair { |key, value|
      tCls = value.class
      if (tCls == TrueClass || tCls == FalseClass)
        tCls = 'Boolean'
      else
        tCls = tCls.to_s
      end
      @@a_ro << [ key , tCls, 0]
    }
    @@len_a_ro = @@a_ro.length

    # create constants array
    ro = Sketchup::RenderingOptions
    @@h_ro_c = {}
    ro.constants.each { |c|
      @@h_ro_c[ro.const_get(c)] = c.to_s
    }
    @@a_ro_table = []
    @@obs_ro = Sketchup::RenderingOptionsObserver.new

    def @@obs_ro.onRenderingOptionsChanged(rendering_options, type)
      # increment counter in @@a_ro, which shows that an observer
      # callback occurs when it is changed
      @@a_ro[@@i][2] += 1
      # create the callback name for the md table
      ro_c_name = @@h_ro_c[type] || "<strong>** Missing, type = #{type}</strong>"
      # add a row to the table
      @@a_ro_table << [@@a_ro[@@i][0], @@a_ro[@@i][1], ro_c_name]
    end
    @@am_ro.add_observer( @@obs_ro )

    # Start timer to loop thru RenderingOptions
    @@am.start_operation('Create Constants md', true)
    @@i = -1
    @@timer = UI.start_timer(0.20, true) {
      @@i += 1
      if (@@i < @@len_a_ro)
        self.ro_loop(@@i)
      else
        UI.stop_timer(@@timer)
        @@am.abort_operation
        self.rendering_options_done()
      end
    }
  end

  # used to delete RenderingOptions constants in @@constants string
  def self.rendering_options_del()
    cns = 'Sketchup::RenderingOptions::'
    @@a_ro_table.each { |row|
      next if row[2].match(/[^A-Za-z0-9_]/)
      t = /^#{cns}#{row[2]}.+?$/
      @@constants.sub!(/^#{cns}#{row[2]}.+?$/, '')
    }
  end

  # Writes data to md file after poke is finished
  # when this finishes, it runs _run2
  def self.rendering_options_done()
    @@am_ro.remove_observer( @@obs_ro )
    # remove found options from @@constants string
    self.rendering_options_del()
    @@a_ro_table.sort! { |a,b|
      aa = "#{a[1].ljust(25)}#{a[0].ljust(30)}#{a[2].ljust(30)}"
      bb = "#{b[1].ljust(25)}#{b[0].ljust(30)}#{b[2].ljust(30)}"
      aa <=> bb
    }
    hdr_row = ['RenderingOptions<br/>key', 'RenderingOptions<br/>value.class', '<br/>Observer constant (type)']
    alignment = ['L', 'L', 'L']
    table = self.create_table(@@a_ro_table, hdr_row, alignment)
    @@text_md.sub!(/<< RenderingOptions >>/, table)
    # check if any RenderingOption keys did not fire an observer event
    @@a_no_fire = []
    @@a_ro.each { |r|
      if (r[2] == 0)
        @@a_no_fire << r
      end
    }
    if (@@a_no_fire.length > 0)
      hdr_row = ['RenderingOptions<br/>key', 'RenderingOptions<br/>value.class']
      alignment = ['L', 'L']
      table = self.create_table(@@a_no_fire, hdr_row, alignment)
      t =  "The following table lists [RenderingOptions] keys that do not fire "
      t << "the [onRenderingOptionsChanged] callback.\n\n#{table}"
      @@text_md.sub!(/<< RenderingOptions_no_fire >>/, t)
    else
      @@text_md.sub!(/<< RenderingOptions_no_fire >>[\r\n\f]{2}/, '')
    end
    array = self.find_regex('Sketchup::RenderingOptions::', nil)
    if (array.length > 0)
      hdr_row = ['Observer<br/>constant (type)', 'value']
      alignment = ['L', 'C']
      table = self.create_table(array, hdr_row, alignment)
      t = "The following RenderingOptions constants are not fired by any keys "
      t << "in [RenderingOptions].  They may be returned for UI changes that "
      t << "do not have API control.\n\n#{table}"
      @@text_md.sub!(/<< RenderingOptions_no_cb >>/, t)
    else
      @@text_md.sub!(/<< RenderingOptions_no_cb >>/, '')
    end
    # continue with the rest of md assembly
    self._run2
  end

  def self.send_action()
    return unless (sa_text = self.file_get_str('send_action.txt', "../../su_info_txt"))
    # array of text commands
    a_text = sa_text.split(/\n/)
    a_text.sort!
    # array for constants / numeric commands
    a_number = []
    re_full = /^CMD_.+?$/
    while (match = @@constants.slice!(re_full)) do
      a_number << match.split(/\t/)
    end
    h_number = {}
    a_number.each { |row|
      key = row[0].sub(/^CMD_/, '').gsub(/_/, '')
      h_number[key] = row
    }
    a_table = []
    a_text.each { |a|
      t = a.sub(/^(edit|render|select)/i, '').sub(/(Tool)?\:$/,'')
# odd cases  showRubyPanel
      case t
      when  'FieldOfView'
        t = 'DisplayFOV'
      when  'openDocument'
        t = 'Open'
      when  'pageAdd'
        t = 'PageNew'
      when  'printDocument'
        t = 'Print'
      when  'SectionPlane'
        t = 'Section'
      when  'Selection'
        t = 'Select'
      when  'showRubyPanel'
        t = 'RubyConsole'
      when  'Textures'
        t = 'Textured'
      when  'Turn'
        t = 'Pan'
      when  'viewShowAxes'
        t = 'SketchAxes'
      when  'viewShowGuides'
        t = 'ShowGuides'
      when  'viewShowHidden'
        t = 'ShowHidden'
      when  'viewZoomExtents'
        t = 'ZoomExtents'
      when  'viewZoomToSelection'
        t = 'SelectionZoomExt'
      end
      t.upcase!
      if h_number.key?(t)
        a_table << [a, h_number[t][0], h_number[t][1]]
        h_number.delete(t)
      else
        a_table << [a, '', '']
      end
    }
    hdr_row = ['action parameter<br/>String', 'action parameter<br/>Constant', 'action<br/>Fixnum']
    alignment = ['L', 'L', 'C']
    table = self.create_table(a_table, hdr_row, alignment)
    @@text_md.sub!(/<< cmd_alpha >>/, table)

    # now add remaining numberic constants
    array = []
    h_number.each { |k,v| array << v }
    if (array.length > 0)
      array.sort! { |a,b| a[0] <=> b[0] }
      @@text_md.sub!(/<< cmd_numeric >>/, "The following constants do not have string equivalents.\n\n<< cmd_numeric >>")
      table = self.standard_table(array, 'cmd_numeric', 'action parameter<br/>Constant')
    end
  end

  # creates a table based on constant 3 column array, adds to md
  # @param array [array<array,String, String, String>>
  # @param re_md [String] string to find in md template
  # @param col1  [String] name of column 1 header
  def self.standard_table(array, re_md, col1 = nil)
    # if col1 change 1st column heading
    if (col1)
      hdr_row =  ["#{col1}", 'value', 'class']
    else
      hdr_row =  ['constant name', 'value', 'class']
    end

    # check to see if all constants are of the same class, if so,
    # change 2nd column heading, remove 3rd column
    len = array.length - 1
    col3_remove = true
    if (len >= 1)
      cls = array[0][2]
      1.upto(len) { |row|
        if cls != array[row][2]
          col3_remove = false
          break
        end
      }
    else
      col3_remove = true
    end
    if (col3_remove)
      hdr_row[0] = "constant<br/>name" unless col1
      hdr_row[1] = "value<br/>(#{cls})"
      hdr_row.pop()
    end
    alignment = ['L', 'C', 'L']
    table = self.create_table(array, hdr_row, alignment)
    re_find_text = /<< #{re_md} >>/
    @@text_md.sub!(re_find_text, table)
  end

  def self.unclassified_constants()
    a_temp = @@constants.split(/[\r\n\f]+/)
    if (a_temp && a_temp.length > 0)
      a_unclassified = []
      a_temp.each { |r|
        row = r.split(/\t/)
        a_unclassified << row if (row.length == 3)
      }
      self.standard_table(a_unclassified, 'yet_to_be_added')
    end
  end

  # creates html table from an array
  # @param array     [Array<String>]
  # @param hdr_row   [Array<String>] table row 1
  # @param alignment [Array<String>]
  # @return [string]
  # &#160;
  def self.create_table(array, hdr_row, alignment)
    rows = array.length - 1
    columns = hdr_row.length - 1
    al = []
    0.upto(columns) { |j|
      case alignment[j]
      when "L" then al[j] = ">"
      when "C" then al[j] = " class='c'>"
      when "R" then al[j] = " class='r'>"
      end
    }
    # create md header row
    table = "<table class='gjl15'><thead>\n"
    0.upto(columns) { |j| table << "<th#{al[j]}#{hdr_row[j]}</th>" }
    table << "\n</thead><tbody>\n"
    # create table
    0.upto(rows) { |i|
      table << "<tr>"
      0.upto(columns) { |j|
        table << "<td#{al[j]}#{array[i][j]}</td>"
      }
      table << "</tr>\n"
    }
    table << "</tbody></table>\n"
  end

  # creates standard markdown table text from an array
  # @param array     [Array<String>]
  # @param hdr_row   [Array<String>] table row 1
  # @param alignment [Array<String>]
  # @return [string]
  # &#160;
  def self.create_md_table(array, hdr_row, alignment)
    rows = array.length - 1
    columns = hdr_row.length - 1
    # column widths of header row
    col_widths = []
    0.upto(columns) { |j| col_widths[j] = hdr_row[j].length }

    # determine column widths of table
    0.upto(rows) { |i|
      0.upto(columns) { |j|
        col_widths[j] = [col_widths[j], array[i][j].length].max
      }
    }

    # create md header row
    table = '| '
    0.upto(columns) { |j| table << hdr_row[j].ljust(col_widths[j]) << ' | ' }
    table << "\n|"
    # create md justification row
    dash = '-'
    7.times { |k| dash += dash }
    0.upto(columns) { |j|
      case alignment[j]
      when 'L'
        table << ":#{dash.slice(0, col_widths[j])}-|"
      when 'C'
        table << ":#{dash.slice(0, col_widths[j])}:|"
      when 'R'
        table << "-#{dash.slice(0, col_widths[j])}:|"
      end
    }
    table << "\n"
    # create md table
    0.upto(rows) { |i|
      table << '| '
      0.upto(columns) { |j|
        if (array[i][j] == '')
          table <<               "".ljust(col_widths[j]) + ' | '
        else
          table << array[i][j].to_s.ljust(col_widths[j]) + ' | '
        end
      }
      table << "\n"
    }
    table << "\n<br/>"
    table.gsub!(/[ \t]+$/, '')
    table
  end

  # changes a RenderOption
  def self.ro_loop(i)
    ro_str = @@a_ro[i][0]
    case @@a_ro[i][1]
    when 'Boolean'
      @@am_ro[ro_str] = !@@am_ro[@@a_ro[i][0]]
    when 'Sketchup::Color'
      color = @@am_ro[ro_str].to_a
      if (color[2] == 255)
        color[2] = 128
      elsif (color[2] == 128)
        color[2] = 192
      else
        color[2] = 255
      end
      @@am_ro[ro_str] = Sketchup::Color.new(color)
    when 'Fixnum'
      case @@am_ro[ro_str]
      when 1
        @@am_ro[ro_str] = 2
      when 2
        @@am_ro[ro_str] = 1
      else
        @@am_ro[ro_str] = 1
      end
    when 'Float'
      case @@am_ro[ro_str]
      when 0.5
        @@am_ro[ro_str] = 0.6
      else
        @@am_ro[ro_str] = 0.5
      end
    end
  end

  # Returns a file as a String, location is `ENV['TMP'] || ENV['TEMP']`
  # @param file [String]
  # @param path [String,nil]
  # @return [String,nil]
  #
  def self.file_get_str(file, path = nil )
  ret = nil
  dir = path || @@dir ||ENV['TMP'] || ENV['TEMP']
    if File.directory?(dir)
      f_name = "#{dir}#{File::SEPARATOR}#{file}"
      if File.exists?(f_name)
        ret = File.read(f_name)
      else
        UI.messagebox("File #{f_name} does not exist\n\nExiting!")
      end
    else
      UI.messagebox("Directory #{f_name} does not exist\n\nExiting!")
    end
    ret
  end

  # Writes output file
  # @param f_name [String] name of output file with extention
  # @param string [String] file contents
  #
  def self.file_write(f_name, string, dir_md = nil)
    dir = dir_md || ENV['TMP'] || ENV['TEMP']
    if (File.directory?(dir))
      file = File.open("#{dir}#{File::SEPARATOR}#{f_name}", "w")
      if (file)
        file.write(string)
        file.close
      end
    end
  end

end