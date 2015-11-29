# Contains code snippets that are loaded into Template_Guide, and a few other
# methods.  The snippets **must be indented 2 spaces**, otherwise the code will
# not parse them.
#
# Methods can be run from the console, eg GuideCode.new.ro_1.
#
class GuideCode

  # @return [this]
  def initialize()
  end

  # An example showing use of the Face constants
  # @return [nil]
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
  # @return [nil]
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
  # @return [nil]
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
      if    ( text.match(/^ROPSet/) ) ; text.sub!(/^ROPSet/, 'ROPSet  ')
      elsif ( text.match(/^ROP/) )    ; text.sub!(/^ROP/   , 'ROP     ')
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

    # create a RenderingOptionsObserver instance & create callback method
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
  # @return [nil]
  def ro_2
    # create an observer & add callback method
    @obs_ro2 = Sketchup::RenderingOptionsObserver.new
    @obs_ro2.instance_eval {
      def onRenderingOptionsChanged(ro, type)
        cns = ro.class
        suffix = case type
          when cns::ROPDrawHidden                  then 'DrawHidden'
          when cns::ROPSetDisplayColorByLayer      then 'DisplayColorByLayer'
          when cns::ROPSetDisplaySketchAxes        then 'DisplaySketchAxes'
          when cns::ROPSetHideConstructionGeometry then 'HideConstructionGeometry'
          when cns::ROPSetModelTransparency        then 'ModelTransparency'
          when cns::ROPSetRenderMode               then 'RenderMode'
          when cns::ROPSetSectionDisplayMode       then 'SectionDisplayMode'
          when cns::ROPSetTexture                  then 'Texture'
          else "Not caught by case statement"
          end
        puts suffix
      end
    }
    # attach it to the Rendering_options of the model
    Sketchup.active_model.rendering_options.add_observer(@obs_ro2)
  end

  # Creates a tool and and callbacks for mouse and KeyDown events
  # @return [nil]
  def tool_1
    @@mouse = Proc.new { |up_down_dbl, flags, x, y, view|
      button  = []
      key_mod = []
      if (MK_LBUTTON & flags != 0) then button.push 'Left'   end
      if (MK_MBUTTON & flags != 0) then button.push 'Middle' end
      if (MK_RBUTTON & flags != 0) then button.push 'Right'  end

      if (MK_SHIFT   & flags != 0) then key_mod.push 'Shift' end
      if (MK_CONTROL & flags != 0) then key_mod.push 'Ctrl'  end
      if (MK_ALT     & flags != 0) then key_mod.push 'Alt'   end
      s1 = up_down_dbl.ljust(7)
      s2 = button.join(", ").ljust(20)
      s3 = key_mod.join(", ")
      puts "Mouse Button #{s1} button = #{s2} keys = #{s3}"
    }
    @tool = Object.new
    @tool.instance_eval {
      def onLButtonDown(*args)        ; @@mouse.call('Down', *args) ; end
      def onMButtonDown(*args)        ; @@mouse.call('Down', *args) ; end
      def onRButtonDown(*args)        ; @@mouse.call('Down', *args) ; end

      def onLButtonUp(*args)          ; @@mouse.call('Up', *args) ; end
      def onMButtonUp(*args)          ; @@mouse.call('Up', *args) ; end
      def onRButtonUp(*args)          ; @@mouse.call('Up', *args) ; end

      def onLButtonDoubleClick(*args) ; @@mouse.call('DblClk', *args) ; end
      def onMButtonDoubleClick(*args) ; @@mouse.call('DblClk', *args) ; end
      def onRButtonDoubleClick(*args) ; @@mouse.call('DblClk', *args) ; end

      def onKeyDown(key, repeat, flags, view)
        # Some binary fun for testing
        #   t = flags.to_s(2).rjust(16)
        #   tBin = "#{t[-16,4]} #{ t[-12,4]} #{ t[-8,4]} #{t[-4,4]}".rjust(18)
        #   puts "#{key.to_s.ljust(4)}\t#{flags.to_s.ljust(5)}\t#{tBin}"

        k   = key.to_s.rjust(3)
        alt =  (ALT_MODIFIER_MASK & key != 0).to_s.ljust(5)
        cons = (CONSTRAIN_MODIFIER_MASK & key != 0).to_s.ljust(5)
        copy = (COPY_MODIFIER_MASK & key != 0).to_s.ljust(5)
        puts "key = #{k}  alt = #{alt}  cons = #{cons}  copy = #{copy}"
      end
    }
    Sketchup.active_model.select_tool(@tool)
  end

end
