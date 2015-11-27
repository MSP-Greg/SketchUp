# Contains code snippets that are loaded into Template_Guide, and a few other
# methods.  Note there are special comments that allow 'create_su_constants_guide.rb'
# to parse the code.
#
# methods can be run from the console.
#
module CTCode

# load "D:/rb/lib/su_info/Template_Guide_Code.rb"

#{ face_1
def CTCode.face_1()
  # must have a model open with at least one face!
  cns = Sketchup::Face
  face = Sketchup.active_model.entities.grep(cns)[0]
  t = ''
  if (face)
    pt_location = face.classify_point(ORIGIN)
    t = case pt_location
      when cns::PointInside                     then 'pt is inside'
      when cns::PointNotOnPlane                 then 'pt not on plane'
      when cns::PointOnEdge, cns::PointOnVertex then 'pt on perimeter'
      when cns::PointOutside                    then 'pt is outside'
      when cns::PointUnknown                    then 'pt error?'
      else 'not trapped by case statement'
    end
  else
    t = 'no face found'
  end
  puts t
end
#} face_1

#{ len_1
def CTCode.len_1()
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
#} len_1

#{ ro_1
def CTCode.ro_1()
  cns = Sketchup::RenderingOptions

  # hash @@roc = RenderingOptions constants
  #   key is constant value, value is constant name
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
  @@roc.sort.each { |r| puts "#{r[0].to_s.rjust(3)}  #{r[1]}" }

  # create a RenderingOptionsObserver instance & create callback method
  @@obs_ro = Sketchup::RenderingOptionsObserver.new

  def @@obs_ro.onRenderingOptionsChanged(ro, type)
    puts "#{type.to_s.rjust(3)}  #{@@roc[type]}"
  end
  
  # attach the observer
  Sketchup.active_model.rendering_options.add_observer(@@obs_ro)
end
#} ro_1

#{ ro_2
def CTCode.ro_2()
  # create an observer
  obs_ro = Sketchup::RenderingOptionsObserver.new
  # add callback method
  
  def @@obs_ro.onRenderingOptionsChanged(ro, type)
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

  # attach it to the Rendering_options of the model
  Sketchup.active_model.rendering_options.add_observer(obs_ro)
end
#} ro_2

# load "D:/rb/lib/su_info/constant_template_code.rb"

#{ tool_1
def CTCode.tool_1()
  @@tool = Object.new
  def @@tool.onLButtonDown(flags, x, y, view)
            CTCode.mouse(flags, x, y, view, 'Down') ; end
  def @@tool.onMButtonDown(flags, x, y, view)
            CTCode.mouse(flags, x, y, view, 'Down') ; end
  def @@tool.onRButtonDown(flags, x, y, view)
            CTCode.mouse(flags, x, y, view, 'Down') ; end

  def @@tool.onLButtonUp(flags, x, y, view)
          CTCode.mouse(flags, x, y, view, 'Up') ; end
  def @@tool.onMButtonUp(flags, x, y, view)
          CTCode.mouse(flags, x, y, view, 'Up') ; end
  def @@tool.onRButtonUp(flags, x, y, view)
          CTCode.mouse(flags, x, y, view, 'Up') ; end

  def @@tool.onLButtonDoubleClick(flags, x, y, view)
                   CTCode.mouse(flags, x, y, view, 'DblClk') ; end
  def @@tool.onMButtonDoubleClick(flags, x, y, view)
                   CTCode.mouse(flags, x, y, view, 'DblClk') ; end
  def @@tool.onRButtonDoubleClick(flags, x, y, view)
                   CTCode.mouse(flags, x, y, view, 'DblClk') ; end

  def @@tool.onKeyDown(key, repeat, flags, view)
#    Some binary fun for testing
#    t = flags.to_s(2).rjust(16)
#    tBin = "#{t[-16,4]} #{ t[-12,4]} #{ t[-8,4]} #{t[-4,4]}".rjust(18)
#    puts "#{key.to_s.ljust(4)}\t#{flags.to_s.ljust(5)}\t#{tBin}"

    alt =  (ALT_MODIFIER_MASK & key != 0).to_s.ljust(5)
    cons = (CONSTRAIN_MODIFIER_MASK & key != 0).to_s.ljust(5)
    copy = (COPY_MODIFIER_MASK & key != 0).to_s.ljust(5)
    puts "alt = #{alt}   cons = #{cons}   copy = #{copy}"
  end
  Sketchup.active_model.select_tool(@@tool)
end
#} tool_1

def CTCode.ro_1stub()
  cnsl = '-----------------------------------------'
  puts cnsl + '  CTCode.ro_1()'
  CTCode.ro_1()
  console
end

#{ mouse
def CTCode.mouse(flags, x, y, view, up_down_dbl)
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
end
#} mouse

# load "D:/rb/lib/su_info/Template_Guide_Code.rb"
end
