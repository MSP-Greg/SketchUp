# Contains code snippets that are loaded into Template_Guide, and a few other
# methods.  The snippets **must be indented 2 spaces**, otherwise the code will
# not parse them.
#
# Methods can be run from the console, eg SUMD_TC.new.ro_1.
#
class SUMD_TC

  # An example showing use of the Face constants
  #
  def face_1
    # must have a model open with at least one face!
    cns = Sketchup::Face
    face = Sketchup.active_model.entities.grep(cns)[0]
    if (face)
      pt_location = face.classify_point(ORIGIN)
      t = case pt_location
        when cns::PointInside      then 'pt is inside'
        when cns::PointNotOnPlane  then 'pt not on plane'
        when cns::PointOnEdge,
             cns::PointOnVertex    then 'pt on perimeter'
        when cns::PointOutside     then 'pt is outside'
        when cns::PointUnknown     then 'pt error?'
        else 'not trapped by case statement'
      end
    else
      t = 'no face found'
    end
    puts t
  end

  # An example showing use of the Length constants
  #
  def len_1
    cns = Length
    h_units  = Hash.new('Unit Unknown')
    h_format = Hash.new('Format Unknown')

    h_units[cns::Centimeter] = 'cm'
    h_units[cns::Feet]       = 'ft'
    h_units[cns::Inches]     = 'in'
    h_units[cns::Meter]      = 'm'
    h_units[cns::Millimeter] = 'mm'

    h_format[cns::Architectural] = 'Architectural'
    h_format[cns::Decimal]       = 'Decimal'
    h_format[cns::Engineering]   = 'Engineering'
    h_format[cns::Fractional]    = 'Fractional'

    om = Sketchup.active_model.options # OptionManager
    op = om['UnitsOptions']            # OptionsProvider
    units =  h_units[  op['LengthUnit']   ]
    format = h_format[ op['LengthFormat'] ]
    puts "Current model units are #{units}"
    puts "Current model format is #{format}"
  end

  # Loads RenderingOptions constants, dumps value and name to the console,
  # then hooks up an observer and outputs info about the callback and what
  # ro's have changes
  #
  def ro_1
    am = Sketchup.active_model
    cns = Sketchup::RenderingOptions

    # create a hash of ro keys
    @@h_ro = {}
    am.rendering_options.each { |k,v|
      val = v.kind_of?(Sketchup::Color) ? v.to_s.slice(-20,20) : v
      @@h_ro[k] = val
    }

    # hash @@roc = RenderingOptions constants
    #   key   is constant value
    #   value is constant name, with some spacing added by RegEx
    @@roc = Hash.new("** No Constant! **")
    # get all the constants, parse names, add to hash
    cns.constants.each { |c|
      text = c.to_s.dup
      if    ( text =~ /^ROPSet/ ) ; text.sub!(/^ROPSet/, 'ROPSet  ')
      elsif ( text =~ /^ROP/    ) ; text.sub!(/^ROP/   , 'ROP     ')
      end
      @@roc[cns.const_get(c)] = text
    }

    # dump hash to console
    cnsl = '-----------------------------------------'
    puts cnsl + '  ro_1()'
    prev = -1
    @@roc.sort.each { |r|
      num = r[0].to_s.rjust(3) + ((prev + 1 != r[0]) ? "*" : " ")
      puts "#{num} #{r[1]}"
      prev = r[0]
    }
    puts cnsl

    # create a RenderingOptionsObserver instance & add callback method
    @obs_ro1 = Sketchup::RenderingOptionsObserver.new
    @obs_ro1.instance_eval {
      @tmr_stopped = true
      def onRenderingOptionsChanged(ro, type)
        # timer puts line breaks between ro changes when multiple ocurr
        if (@tmr_stopped)
          @tmr_stopped = false
          UI.start_timer(0.100) { @tmr_stopped = true ; puts }
        end

        # Loop thru ro's and find changes, load into s_val
        s_val = ''
        ro.each { |k,v|
          val =  v.kind_of?(Sketchup::Color) ? v.to_s.slice(-20,20) : v
          if (@@h_ro[k] != val)
            @@h_ro[k] = val
            val = "%e" % v if (v.class == Float)
            s_val << "#{val.to_s.rjust(20)} #{k}"
          end
        }
        # finally put info to console
        puts "#{type.to_s.rjust(2)} #{@@roc[type].ljust(32)}  #{s_val}"
      end
    }
    # attach the observer
    am.rendering_options.add_observer(@obs_ro1)
  end

  # An example using the ROP constants
  #
  def ro_2
    # create an observer & add callback method
    @obs_ro2 = Sketchup::RenderingOptionsObserver.new
    @obs_ro2.instance_eval {
      def onRenderingOptionsChanged(ro, type)
        cns = ro.class
        suffix = case type
          when cns::ROPDrawHidden
                      'DrawHidden'
          when cns::ROPSetDisplayColorByLayer
                         'DisplayColorByLayer'
          when cns::ROPSetDisplaySketchAxes
                         'DisplaySketchAxes'
          when cns::ROPSetHideConstructionGeometry
                         'HideConstructionGeometry'
          when cns::ROPSetModelTransparency
                         'ModelTransparency'
          when cns::ROPSetRenderMode
                         'RenderMode'
          when cns::ROPSetSectionDisplayMode
                         'SectionDisplayMode'
          when cns::ROPSetTexture
                         'Texture'
          else "Not caught by case statement"
          end
        puts suffix
      end
    }
    # attach it to the Rendering_options of the model
    Sketchup.active_model.rendering_options.add_observer(@obs_ro2)
  end

  # Creates a tool and and callbacks for mouse and KeyDown events
  #
  def tool_1
    @@mse = Proc.new { |up_down_dbl, flags, x, y, view|
      button  = ''
      key_mod = ''
      if (MK_LBUTTON & flags != 0) then button << ', Left'   end
      if (MK_MBUTTON & flags != 0) then button << ', Middle' end
      if (MK_RBUTTON & flags != 0) then button << ', Right'  end

      if (MK_SHIFT   & flags != 0) then key_mod << ', Shift' end
      if (MK_CONTROL & flags != 0) then key_mod << ', Ctrl'  end
      if (MK_ALT     & flags != 0) then key_mod << ', Alt'   end
      s1 = up_down_dbl.ljust(7)
      s2 =  button.sub(/^, /, '').ljust(20)
      s3 = key_mod.sub(/^, /, '')
      puts "Mouse Button #{s1} button = #{s2} keys = #{s3}"
    }
    @tool = Object.new
    @tool.instance_eval {
      def onLButtonDown(*a)        ; @@mse.call('Down'  , *a) ; end
      def onMButtonDown(*a)        ; @@mse.call('Down'  , *a) ; end
      def onRButtonDown(*a)        ; @@mse.call('Down'  , *a) ; end

      def onLButtonUp(*a)          ; @@mse.call('Up'    , *a) ; end
      def onMButtonUp(*a)          ; @@mse.call('Up'    , *a) ; end
      def onRButtonUp(*a)          ; @@mse.call('Up'    , *a) ; end

      def onLButtonDoubleClick(*a) ; @@mse.call('DblClk', *a) ; end
      def onMButtonDoubleClick(*a) ; @@mse.call('DblClk', *a) ; end
      def onRButtonDoubleClick(*a) ; @@mse.call('DblClk', *a) ; end

      def onKeyDown(key, repeat, flags, view)
        # Some binary fun for testing
        t = flags.to_s(2).rjust(16)
        bin = "#{ t[-16,4]} #{ t[-12,4]} " \
              "#{ t[ -8,4]} #{ t[ -4,4]}".rjust(19)
        puts "#{key.to_s.ljust(4)}\t#{flags.to_s.ljust(5)}\t#{bin}"

        k    = key.to_s.rjust(3)
        alt  = (ALT_MODIFIER_MASK       & key != 0).to_s.ljust(5)
        cons = (CONSTRAIN_MODIFIER_MASK & key != 0).to_s.ljust(5)
        copy = (COPY_MODIFIER_MASK      & key != 0).to_s.ljust(5)
        puts "key = #{k}  alt = #{alt}  cons = #{cons}  copy = #{copy}"
      end
    }
    Sketchup.active_model.select_tool(@tool)
  end

  # Code used in Template_Collections
  def coll_1
    am_ents = Sketchup.active_model.entities
    s = 300
    f1 = [ 0, 0, 0 ] , [ 0, s, 0 ] , [ s, s, 0 ] , [ s, 0, 0 ]
    f2 = [ 0, 0, s ] , [ 0, s, s ] , [ s, s, s ] , [ s, 0, s ]
    puts "am_ents.length = #{am_ents.length}"
    am_ents.add_face( f1 )
    puts "am_ents.length = #{am_ents.length}"
    am_ents.add_face( f2 )
    puts "am_ents.length = #{am_ents.length}"
  end

end
