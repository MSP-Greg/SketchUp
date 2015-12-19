# [Template_Guide.md]:file/docs/Template_Guide.md
# [template_code.rb]:SUMD_TC
# [send_action.txt]:https://raw.githubusercontent.com/MSP-Greg/SketchUp/master/su_info_txt/send_action.txt
# [su??\_constants_tab_md.txt]:https://github.com/MSP-Greg/SketchUp/tree/master/su_info_txt
#
# ## Purpose:
#
# Creates the 'Constants Guide' md file.
#
# ## Required files:
#
# | File name                     | Information / Notes                                                        |
# |:------------------------------|:---------------------------------------------------------------------------|
# | [Template_Guide.md]           | markdown template                                                          |
# | [template_code.rb]            | contains long code snippets shown in md file.                              |
# | [send_action.txt]<br/>&#160;  | contains list of send_action text parameters<br/>scraped from SketchUp.com.|
# | [su??\_constants_tab_md.txt]<br/>&#160; | contains the constant list that is parsed and<br/>inserted into md template file. |
#
# ## Code Process:
#
# 1. _run:
#   1. Loads text data from the files listed above.
#   2. Loads code samples into md template.  When finished --
# 2. rendering_options_poke:
#   1. Load an array with RenderingOptions keys.
#   2. Starts a UI timer and loops thru the keys, changing the respective
#     key's value.  This generates a RenderingOptionsObserver callback.
#     This allows the code to map RenderingOptions keys to the RenderingOptionsObserver
#     callback 'type' parameter.  This takes a litle while. When finished --
# 3. rendering_options_done:
#   1. Processes data and places it in the md template.  When finished --
# 4. _run2:
#   1. Mostly pulls data from the constants file, there is some special code for the
#      send_action section, which has its own method.
#
# All files need to be located in the hiearchy used at https://github.com/MSP-Greg/SketchUp
#
module SUMD_Guide

#{ Class variables
  @version = 2.0.to_f

  @rb_dir = File.dirname(__FILE__)

  unless ( defined?(SUMD) && SUMD.respond_to?(:sumd_file_write) )
    load "#{@rb_dir}#{File::SEPARATOR}common.rb"
  end

  # text of template file
  @text_md   = Object.new
  # text of constants file
  @constants = Object.new
  # runnable code samples file
  @text_code = Object.new

  @@i = -1
  
  # used to retrieve su#{@su_major}_constants_tab_md.txt
  @su_major = Sketchup.version.split('.')[0].rjust(2, '0')

#} Class variables

  # Main entry point
  #
  # Loads files, inserts code samples, starts rendering_options_poke
  #
  def self._run()
    # get required files
    return unless ( @text_md   = SUMD.sumd_file_read('Template_Guide.md') )
    return unless ( @text_code = SUMD.sumd_file_read('template_code.rb') )
    return unless ( @constants =
              SUMD.sumd_file_read("su#{@su_major}_constants_tab_md.txt") )

    insert_code_sample('face_1')
    insert_code_sample('len_1')
    insert_code_sample('ro_1')
    insert_code_sample('ro_2')
    insert_code_sample('tool_1')
    puts "-------------------------------------------------\n" \
         "#{name} starting rendering_options loops"
    rendering_options_poke()
  end

  # Runs after rendering_options timer finishes
  #
  def self._run2()
    #
    length_constants()

    #
    send_action()

    # Geom:: constants
    find_regex('[^\r\n\f]+?Geom::', 'geometry')

    # UI.messagebox type
    find_regex('MB_', 'ui_mb_type', '<br/>type parameter')

    # UI.messagebox return
    find_regex('ID', 'ui_mb_ret', 'status<br/>return')

    # UI.layer.page_behavior
    find_regex('LAYER_', 'layer_page_behavior') { |a,b|
      (a[1].rjust(3, '0') + a[0]) <=> (b[1].rjust(3, '0') + b[0]) }

    # Command.set_validation
    find_regex('MF_', 'command_set_validation_proc', 'cmd_status<br/>return')

    # Behavior # snap_to
    find_regex('SnapTo_', 'snap_to', '<br/>snap_to')

    # Dimension #arrow_type #arrow_type=
    find_regex('Sketchup::Dimension::ARROW_', 'dim_arrow', '<br/>arrow_type')

    # Dimension #aligned_text_position
    find_regex('Sketchup::DimensionLinear::ALIGNED_', 'dim_aligned_text', '<br/>at_pos')

    # Dimension #text_position
    find_regex('Sketchup::DimensionLinear::TEXT_', 'dim_text_pos', '<br/>text_pos')

    # Entities add_faces_from_mesh
    find_regex('Geom::PolygonMesh::', 'from_mesh', '<br/>smooth_flags')

    # Page#update Pages#add
    find_regex('(PAGE_USE_|PAGE_NO_)', 'page_use', '<br/>flag parameter')

    # Sketchup::Face::
    find_regex('Sketchup::Face::', 'face_classify_point', 'pt_location<br/>return')

    # Sketchup::Importer::
    find_regex('Sketchup::Importer::', 'importer', 'status_code<br/>return')

    # Sketchup::Model::
    find_regex('Sketchup::Model::', 'model_save', '@version<br/>parameter') { |a, b|
      a[1].to_i <=> b[1].to_i }

    # .set_status_text
    find_regex('SB_', 'status_text', 'position<br/>parameter')

    # Text #leader_type
    find_regex('ALeader', 'leader_type', '<br/>leader')

    # Texturewriter.write
    find_regex('FILE_WRITE_', 'texture_writer_write', '<br/>status return')

    # Tool Keyboard
    find_regex('VK_', 'tool_key', 'key<br/>parameter')

    # Tool Mouse
    find_regex('MK_', 'tool_mse', 'flags<br/>parameter')

    # Toolbar
    find_regex('TB_', 'toolbar', 'state<br/>return')

    # View.draw(mode, pts)
    find_regex('GL_', 'view_draw', "<br/>mode parameter")

    # Vew.draw_text
    find_regex('TextAlign', 'view_draw_text', ":align<br/>hash value")

    # RUBY_
    find_regex('(RUBY_|PLATFORM|RELEASE_DATE|VERSION)', 'RUBY_')

    # Other Object
    find_regex('SKETCHUP_CONSOLE', 'other_object')

    # Old key constants
    find_regex('(ALT_MODIFIER|CONSTRAIN_MODIFIER|COPY_MODIFIER)','depreciated_constants_1')

    # now namespaced
    find_regex('DimensionArrow','depreciated_constants_2')

    unclassified_constants()

    @text_md.sub!(/<%= hdr %>/, SUMD.sumd_generated_by(name, @version))

    files = []
    files << SUMD.sumd_file_write('Constants Guide.md', @text_md)
    puts "-------------------------------------------------\n" \
         "#{name} wrote the following files:\n#{files.join(10.chr)}\n"
    
    UI.messagebox('Finished!')
  end

  # Called for constants that can be found with a RegEx match
  #
  # If re_md is nil, array will be returned
  # @param re_con    [String] used to create RegEx for constant match
  # @param re_md     [String] used to create RegEx for table insertion in md
  # @param cnst_name [String] optional column name for constant name column
  # @return [Array<String>, nil]
  #
  def self.find_regex(re_con, re_md = nil, cnst_name = nil)
    re_full = /^#{re_con}.+?$/
    if (/^[A-Z]/ =~ re_con)
      re_trim = re_con.sub(/[^:]*$/,'')
      trim = (re_trim != '')
    end
    array = []
    while (match = @constants.slice!(re_full)) do
      array << match.split(/\t/)
    end
    if (array.length > 0)
      # trim namespace from constant name
      array.each { |row| row[0].sub!(re_trim, '') } if trim

      array.sort! { |a,b| yield(a,b) } if block_given?
      if (re_md)
        standard_table(array, re_md, cnst_name)
      else
        array
      end
    else
      re_find_text = /<%= #{re_md} %>/
      @text_md.sub!(re_find_text, "<strong>** Constants not defined in SketchUp #{@toc_su} **</strong><br/><br/>") if re_md
      array
    end
  end

  # Loads code snippets from Template_Guide_Code.rb into md string
  # @param c_name [String] name of section in file, also replacement
  #   string in template
  #
  def self.insert_code_sample(c_name)
    code = @text_code.slice!(/^  def #{c_name}[\s\S]+?(^  end)/m)
    if (code)
      code.sub!(/^  def[^\r\n\f]+[\r\n\f]+/, '') # remove def line
      code.sub!(/  end\Z/, '')                  # remove end and comment marker
      code.gsub!(/^  / , '')                     # remove 2 spaces of indent
      code.gsub!(/^  /m, '')                     # remove 2 spaces of indent
      code.sub!(/[ \t\r\n\f]+\z/, '')            # extra blank lines at end
      @text_md.sub!(/<%= code_#{c_name} %>/, code)
    else
      puts "#{c_name} code snippet is missing or incorrectly formatted!"
    end
  end

  # Creates the table with all of the OptionsManager & OptionsProvider keys
  #
  def self.length_constants()
    options_manager = Sketchup.active_model.options
    array = []
    options_manager.each { |op|
      op_name = op.name
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
    alignment = %w[L L C L]
    table = create_table(array, hdr_row, alignment)
    @text_md.sub!(/<%= opts_mgr %>/, table)
    find_regex('Length::', '_length')
  end

  # This loops thru rendering options, then waits for the observer to fire.
  #
  # Attaches a RenderingOptionsObserver, then pokes rendering_options using
  # a UI timer, loads an array (@a_ro) from the keys of a rendering_options
  # instance.
  #
  def self.rendering_options_poke()
    @am = Sketchup.active_model
    @am_ro = @am.rendering_options

    # array holds table columns
    @@a_ro = []

    # load array with 1st 2 columns from @am_ro 'hash'
    @am_ro.each_pair { |key, value|
      tCls = value.class
      if (tCls == TrueClass || tCls == FalseClass)
        tCls = 'Boolean'
      else
        tCls = tCls.to_s
      end
      @@a_ro << [ key , tCls, 0]
    }
    @len_a_ro = @@a_ro.length

    # create constants array
    ro = Sketchup::RenderingOptions
    @@h_ro_c = {}
    ro.constants.each { |c|
      @@h_ro_c[ro.const_get(c)] = c.to_s
    }
    @@a_ro_table = []
    @obs_ro = Sketchup::RenderingOptionsObserver.new
    @obs_ro.instance_eval {
      def onRenderingOptionsChanged(rendering_options, type)
        # increment counter in @@a_ro, which shows that an observer
        # callback occurs when it is changed
        @@a_ro[@@i][2] += 1
        # create the callback name for the md table
        ro_c_name = @@h_ro_c[type] ||
          "<strong style='color:blue'>** Missing, type = #{type}</strong>"
        # add a row to the table
        @@a_ro_table << [@@a_ro[@@i][0], @@a_ro[@@i][1], ro_c_name]
      end
    }
    @am_ro.add_observer( @obs_ro )

    # Start timer to loop thru RenderingOptions
    @am.start_operation('Create Constants md', true)
    @@i = -1
    @timer = UI.start_timer(0.20, true) {
      @@i += 1
      if (@@i < @len_a_ro)
        ro_loop(@@i)
      else
        UI.stop_timer(@timer)
        @am.abort_operation
        rendering_options_done()
      end
    }
  end

  # Used to delete RenderingOptions constants in @constants string
  #
  def self.rendering_options_del()
    cns = 'Sketchup::RenderingOptions::'
    @@a_ro_table.each { |row|
      next if row[2].match(/[^A-Za-z0-9_]/)
      @constants.sub!(/^#{cns}#{row[2]}.+?$/, '')
    }
  end

  # Writes data to md file after poke is finished,
  # when this finishes, it runs _run2
  #
  def self.rendering_options_done()
    @am_ro.remove_observer( @obs_ro )
    # remove found options from @constants string
    rendering_options_del()
    @@a_ro_table.sort! { |a,b|
      aa = "#{a[1].ljust(25)}#{a[0].ljust(30)}#{a[2].ljust(30)}"
      bb = "#{b[1].ljust(25)}#{b[0].ljust(30)}#{b[2].ljust(30)}"
      aa <=> bb
    }
    # bold duplicates
    h0 = Hash.new(0)
    h2 = Hash.new(0)
    @@a_ro_table.each { |row|
      h0[row[0]] += 1
      h2[row[2]] += 1
    }
    @@a_ro_table.each { |row|
      row[0] =  "<strong>#{row[0]}</strong>" if h0[row[0]] > 1
      row[2] =  "<strong>#{row[2]}</strong>" if h2[row[2]] > 1
    }

    hdr_row = ['RenderingOptions<br/>key', 'RenderingOptions<br/>value.class', '<br/>Observer constant (type)']
    alignment = %w[L L L]
    table = create_table(@@a_ro_table, hdr_row, alignment)
    @text_md.sub!(/<%= rendering_opts %>/, table)
    # check if any RenderingOption keys did not fire an observer event
    @a_no_fire = []
    @@a_ro.each { |r|
      if (r[2] == 0)
        @a_no_fire << r
      end
    }
    if (@a_no_fire.length > 0)
      hdr_row = ['RenderingOptions<br/>key', 'RenderingOptions<br/>value.class']
      alignment = %w[L L]
      table = create_table(@a_no_fire, hdr_row, alignment)
      t =  "The following table lists [RenderingOptions] keys that do not" \
           " fire the [onRenderingOptionsChanged] callback.\n\n#{table}"
      @text_md.sub!(/<%= rendering_opts_no_fire %>/, t)
    else
      @text_md.sub!(/<%= rendering_opts_no_fire %>[\r\n\f]{2}/, '')
    end
    array = find_regex('Sketchup::RenderingOptions::', nil)
    if (array.length > 0)
      hdr_row = ['Observer<br/>constant (type)', 'value']
      alignment = %w[L C]
      table = create_table(array, hdr_row, alignment)
      t = "The following RenderingOptions constants are not fired by any keys" \
          " in [RenderingOptions].  They may be returned for UI changes that" \
          " do not have API control.\n\n#{table}"
      @text_md.sub!(/<%= rendering_opts_no_cb %>/, t)
    else
      @text_md.sub!(/<%= rendering_opts_no_cb %>/, '')
    end
    # continue with the rest of md assembly
    _run2
  end

  # Code to creates table that links send_action text with constants
  #
  def self.send_action()
    return unless (sa_text = SUMD.sumd_file_read('send_action.txt'))

    # array of text commands
    a_text = sa_text.split(/\n/)
    a_text.sort!

    # array for constants / numeric commands
    a_number = []
    re_full = /^CMD_.+?$/
    while (match = @constants.slice!(re_full)) do
      a_number << match.split(/\t/)
    end

    #create hash from constant 'suffix names'
    h_number = {}
    a_number.each { |row|
      key = row[0].sub(/^CMD_/, '').gsub(/_/, '')
      h_number[key] = row
    }
    a_table = []
    a_text.each { |a|
      t = a.sub(/^(edit|render|select)/i, '').sub(/(Tool)?\:$/,'')
      # do a few matches that RegEx doesn't catch
      t = case t
        when  'FieldOfView'         then 'DisplayFOV'
        when  'openDocument'        then 'Open'
        when  'pageAdd'             then 'PageNew'
        when  'printDocument'       then 'Print'
        when  'SectionPlane'        then 'Section'

        when  'Selection'           then 'Select'
        when  'showRubyPanel'       then 'RubyConsole'
        when  'Textures'            then 'Textured'
        when  'Turn'                then 'Pan'
        when  'viewShowAxes'        then 'SketchAxes'

        when  'viewShowGuides'      then 'ShowGuides'
        when  'viewShowHidden'      then 'ShowHidden'
        when  'viewZoomExtents'     then 'ZoomExtents'
        when  'viewZoomToSelection' then 'SelectionZoomExt'
        else t
        end
      t.upcase!
      if h_number.key?(t)
        a_table << [a, h_number[t][0], h_number[t][1]]
        h_number.delete(t)
      else
        a_table << [a, '', '']
      end
    }
    hdr_row = ['action parameter<br/>String',
               'action parameter<br/>Constant',
               'action<br/>Fixnum']
    alignment = %w[L L C]
    table = create_table(a_table, hdr_row, alignment)
    @text_md.sub!(/<%= cmd_alpha %>/, table)

    # now add remaining numberic constants
    array = []
    h_number.each { |k,v| array << v }
    if (array.length > 0)
      array.sort! { |a,b| a[0] <=> b[0] }
      sub = "The following constants do not have string equivalents.\n\n<%= cmd_numeric %>"
      @text_md.sub!(/<%= cmd_numeric %>/, sub)
      table = standard_table(array, 'cmd_numeric', 'action parameter<br/>Constant')
    end
  end

  # Creates a table based on constant 3 column array, adds to md
  # @param array [array <array <String, String, String> >]
  # @param re_md [String] string to find in md template
  # @param col1  [String] name of column 1 header
  #
  def self.standard_table(array, re_md, col1 = nil)
    re_find_text = /<%= #{re_md} %>/
    if array.length > 0
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
      if (len > 1)
        cls = array[0][2]
        1.upto(len) { |row|
          if cls != array[row][2]
            col3_remove = false
            break
          end
        }
      end
      if (col3_remove)
        hdr_row[0] = "constant<br/>name" unless col1
        hdr_row[1] = "value<br/>#{cls}"
        hdr_row.pop()
      end
      alignment = %w[L C L]
      table = create_table(array, hdr_row, alignment)
    else
      table = "No matching constants!"
    end
    @text_md.sub!(re_find_text, table)
  end

  # Adds a table to the md file with what's left of the@constants string.
  #
  def self.unclassified_constants()
    a_temp = @constants.split(/[\r\n\f]+/)
    if (a_temp && a_temp.length > 0)
      a_unclassified = []
      a_temp.each { |r|
        row = r.split(/\t/)
        a_unclassified << row if (row.length == 3)
      }
      standard_table(a_unclassified, 'yet_to_be_added')
    end
  end

  # Creates an html table from an array
  # @param array     [Array<String>]
  # @param hdr_row   [Array<String>] table row 1
  # @param alignment [Array<String>]
  # @return [string]
  #
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
    table = "<table class='sumd'><thead><tr>\n"
    0.upto(columns) { |j| table << "<th#{al[j]}#{hdr_row[j]}</th>" }
    table << "\n</tr></thead><tbody>\n"
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

  # Creates a markdown table text from an array
  # @param array     [Array<String>] array to load into table
  # @param hdr_row   [Array<String>] table row 1
  # @param alignment [Array<String>]
  # @return [String] the html table
  #
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
      table << case alignment[j]
               when 'L' then ":#{dash.slice(0, col_widths[j])}-|"
               when 'C' then ":#{dash.slice(0, col_widths[j])}:|"
               when 'R' then "-#{dash.slice(0, col_widths[j])}:|"
               end
    }
    table << "\n"
    # create md table
    0.upto(rows) { |i|
      table << '| '
      0.upto(columns) { |j|
        table << if (array[i][j] == '')
                                 "".ljust(col_widths[j]) + ' | '
                 else
                   array[i][j].to_s.ljust(col_widths[j]) + ' | '
                 end
      }
      table << "\n"
    }
    table << "\n<br/>"
    table.gsub!(/[ \t]+$/, '')
    table
  end

  # Changes a Rendering Option
  # @param i [Integer] loop counter that UI has processed
  #
  def self.ro_loop(i)
    ro_str = @@a_ro[i][0]
    case @@a_ro[i][1]
    when 'Boolean'
      @am_ro[ro_str] = !@am_ro[@@a_ro[i][0]]
    when 'Sketchup::Color'
      color = @am_ro[ro_str].to_a
      color[2] = case color[2]
                 when 255 then 128
                 when 128 then 192
                 else          255
                 end
      @am_ro[ro_str] = Sketchup::Color.new(color)
    when 'Fixnum'
      @am_ro[ro_str] = case @am_ro[ro_str]
                        when 1 then 2
                        when 2 then 1
                        else        1
                        end
    when 'Float'
      @am_ro[ro_str] = case @am_ro[ro_str]
                        when 0.5 then 0.6
                        else          0.5
                        end
    end
  end

end
SUMD_Guide._run()