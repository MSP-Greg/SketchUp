# @title SketchUp 2014 Constants Guide
[Sketchup::Console]:http://www.sketchup.com/intl/en/developer/docs/ourdoc/console
[Sketchup::Dimension]:http://www.sketchup.com/intl/en/developer/docs/ourdoc/dimension
[Sketchup::DimensionLinear]:http://www.sketchup.com/intl/en/developer/docs/ourdoc/dimensionlinear
[Sketchup::Face]:http://www.sketchup.com/intl/en/developer/docs/ourdoc/face
[Sketchup::Importer]:http://www.sketchup.com/intl/en/developer/docs/ourdoc/importer
[Sketchup::Model]:http://www.sketchup.com/intl/en/developer/docs/ourdoc/model
[Sketchup::RenderingOptions]:http://www.sketchup.com/intl/en/developer/docs/ourdoc/renderingoptions
[Geom::PolygonMesh]:http://www.sketchup.com/intl/en/developer/docs/ourdoc/polygonmesh
[Length]:http://www.sketchup.com/intl/en/developer/docs/ourdoc/length
[DimensionLinear]:http://www.sketchup.com/intl/en/developer/docs/ourdoc/dimensionlinear
[DimensionRadial]:http://www.sketchup.com/intl/en/developer/docs/ourdoc/dimensionradial
[DimensionLinear#text_position]:http://www.sketchup.com/intl/en/developer/docs/ourdoc/dimensionlinear#text_position
[Entities#add_faces_from_mesh]:http://www.sketchup.com/intl/en/developer/docs/ourdoc/entities#add_faces_from_mesh
[Behavior#snapto]:http://www.sketchup.com/intl/en/developer/docs/ourdoc/behavior#snapto
[Command#set_validation_proc]:http://www.sketchup.com/intl/en/developer/docs/ourdoc/command#set_validation_proc
[Dimension#arrow_type]:http://www.sketchup.com/intl/en/developer/docs/ourdoc/dimension#arrow_type
[DimensionLinear#aligned_text_position]:http://www.sketchup.com/intl/en/developer/docs/ourdoc/dimensionlinear#aligned_text_position
[Face#classify_point]:http://www.sketchup.com/intl/en/developer/docs/ourdoc/face#classify_point
[Geom]:http://www.sketchup.com/intl/en/developer/docs/ourdoc/geom
[Model#options]:http://www.sketchup.com/intl/en/developer/docs/ourdoc/model#options
[OptionsManager]:http://www.sketchup.com/intl/en/developer/docs/ourdoc/optionsmanager
[OptionsManager#&#91;&#93;]:http://www.sketchup.com/intl/en/developer/docs/ourdoc/optionsmanager#[]
[OptionsProvider]:http://www.sketchup.com/intl/en/developer/docs/ourdoc/optionsprovider
[Model#save]:http://www.sketchup.com/intl/en/developer/docs/ourdoc/model#save
[Model#save_copy]:http://www.sketchup.com/intl/en/developer/docs/ourdoc/model#save_copy
[Page#update]:http://www.sketchup.com/intl/en/developer/docs/ourdoc/page#update
[Pages#add]:http://www.sketchup.com/intl/en/developer/docs/ourdoc/pages#add
[RenderingOptions]:http://www.sketchup.com/intl/en/developer/docs/ourdoc/renderingoptions
[RenderingOptionsObserver]:http://www.sketchup.com/intl/en/developer/docs/ourdoc/renderingoptionsobserver
[onRenderingOptionsChanged]:http://www.sketchup.com/intl/en/developer/docs/ourdoc/renderingoptionsobserver#onRenderingOptionsChanged
[Sketchup.send_action]:http://www.sketchup.com/intl/en/developer/docs/ourdoc/sketchup#send_action
[Sketchup.set_status_text]:http://www.sketchup.com/intl/en/developer/docs/ourdoc/sketchup#set_status_text
[Importer#load_file]:http://www.sketchup.com/intl/en/developer/docs/ourdoc/importer#load_file
[Layer#page_behavior]: http://www.sketchup.com/intl/en/developer/docs/ourdoc/layer#page_behavior
[Text#leader_type]:http://www.sketchup.com/intl/en/developer/docs/ourdoc/text#leader_type
[Texturewriter#write]:http://www.sketchup.com/intl/en/developer/docs/ourdoc/texturewriter#write
[Tool#onKeyDown]:http://www.sketchup.com/intl/en/developer/docs/ourdoc/tool#onKeyDown
[Tool #onLButtonDoubleClick]:http://www.sketchup.com/intl/en/developer/docs/ourdoc/tool#onLButtonDoubleClick
[Toolbar#get_last_state]:http://www.sketchup.com/intl/en/developer/docs/ourdoc/toolbar#get_last_state
[UI.messagebox]:http://www.sketchup.com/intl/en/developer/docs/ourdoc/ui#messagebox
[View#draw]:http://www.sketchup.com/intl/en/developer/docs/ourdoc/view#draw
[View#draw_text]:http://www.sketchup.com/intl/en/developer/docs/ourdoc/view#draw_text

<script>
var ss_last = document.styleSheets.length - 1,
    ss = document.styleSheets[ss_last],
    rules = ss.cssRules,
    rT1 = "#filecontents table.gjl15 ";
ss.insertRule(rT1 + "{ border:none;}", rules.length );
ss.insertRule(rT1 + "thead { border-bottom:2px solid #aaa; background-color:transparent;}", rules.length );
ss.insertRule(rT1 + "tr { border:none; background-color:transparent;}", rules.length );
ss.insertRule(rT1 + "tr:nth-child(5n) { border-bottom:1px solid #aaa;}", rules.length );
ss.insertRule(rT1 + "th { border:none; padding: 2px 10px 2px 3px; background-color:transparent; text-align:left;}", rules.length );
ss.insertRule(rT1 + "td { border:none; padding: 2px 10px 2px 3px; background-color:transparent;}", rules.length );
ss.insertRule(rT1 + "td.c, " + rT1 + "th.c { text-align:center;}", rules.length );
ss.insertRule(rT1 + "td.r, " + rT1 + "th.r { text-align:right;}" , rules.length );
ss.insertRule(rT1 + "td.clr, " + rT1 + "th.clr { border-bottom:none; width:10em;}" , rules.length );
</script>

# SketchUp 2014 Constants Guide

SketchUp defines constants, some are global, others are defined in classes or
'name-spaced'.  Many of them are not listed in the SketchUp.com help documentation.
This list includes all constants.

While creating this document, I noticed that some constants' values changed from
version to version.  Hence, it is strongly recommended that the constant names
(versus their values) are used in code.

All of the links in this reference refer back to SketchUp.com.

Some of the concepts in this document may be obvious to experienced programmers,
but many API users are new to Ruby, or new to programming.  

Finally, thanks to Jim Foltz and others for their previous work and help.
***
This document divides the SketchUp defined constants into three categories

**1. Namespaced Constants:** These are defined on a class.  They will often be listed
in a form similar to:

```ruby
Sketchup::Importer::ImporterNotFound
```

`Sketchup::Importer` is the class they are defined on.  Hence, one can set a
variable equal to the class, and refer to them in another way. A short name may
make the code more readable.

```ruby
# cns = constant namespace
cns = Sketchup::Importer
if (t == cns::ImporterNotFound)
  # etc
end
```

Two things to remember about namespaced nonstants
* One can define the namespace, but one can also use the class method on an instance object.
* They are inherited.  If they are defined on a class (like 'Dimension'). They are also
avaiable on its subclasses (like 'DimensionLinear').

<br/>**2. Global Numeric Constants:**

Almost all of these constants are used as parameters or returns in methods.  Most
are Fixnum.

**3. Global Object Constants:** 

There are a few constants that are SketchUp objects.  All are defined in the
[Geom] module, with the exception of [Sketchup::Console].

## Namespaced Constants


### Dimension \#arrow_type \#arrow_type=

Defined on [Sketchup::Dimension].  See [Dimension#arrow_type]. These constants are for use with [Sketchup::Dimension]
subclasses such as [DimensionLinear] and [DimensionRadial].

```ruby
arrow_type = dim.arrow_type
dim.arrow_type = arrow_type
```

<table class='gjl15'><thead>
<th><br/>arrow_type</th><th class='c'>value<br/>(Fixnum)</th>
</thead><tbody>
<tr><td>ARROW_CLOSED</td><td class='c'>3</td></tr>
<tr><td>ARROW_DOT</td><td class='c'>2</td></tr>
<tr><td>ARROW_NONE</td><td class='c'>0</td></tr>
<tr><td>ARROW_OPEN</td><td class='c'>4</td></tr>
<tr><td>ARROW_SLASH</td><td class='c'>1</td></tr>
</tbody></table>
<br/>

### DimensionLinear \#aligned_text_position \#aligned_text_position=

Defined on [Sketchup::DimensionLinear].  See [DimensionLinear#aligned_text_position].

```ruby
at_pos = dim.aligned_text_position
dim.aligned_text_position = at_pos
```

<table class='gjl15'><thead>
<th><br/></th><th class='c'>value<br/>(Fixnum)</th>
</thead><tbody>
<tr><td>ALIGNED_TEXT_ABOVE</td><td class='c'>0</td></tr>
<tr><td>ALIGNED_TEXT_CENTER</td><td class='c'>1</td></tr>
<tr><td>ALIGNED_TEXT_OUTSIDE</td><td class='c'>2</td></tr>
</tbody></table>
<br/>

### DimensionLinear \#text_position \#text_position=

Defined on [Sketchup::DimensionLinear].  See [DimensionLinear#text_position].

```ruby
text_pos = dim.text_position
dim.text_position = text_pos
```

<table class='gjl15'><thead>
<th><br/>text_pos</th><th class='c'>value<br/>(Fixnum)</th>
</thead><tbody>
<tr><td>TEXT_CENTERED</td><td class='c'>1</td></tr>
<tr><td>TEXT_OUTSIDE_END</td><td class='c'>2</td></tr>
<tr><td>TEXT_OUTSIDE_START</td><td class='c'>0</td></tr>
</tbody></table>
<br/>

### Entities \#add_faces_from_mesh

Defined on [Geom::PolygonMesh].  See [Entities#add_faces_from_mesh].

```ruby
 Sketchup.active_model.entities.add_faces_from_mesh(pm, smooth_flags, material)
```

<table class='gjl15'><thead>
<th><br/>smooth_flags</th><th class='c'>value<br/>(Fixnum)</th>
</thead><tbody>
<tr><td>AUTO_SOFTEN</td><td class='c'>4</td></tr>
<tr><td>HIDE_BASED_ON_INDEX</td><td class='c'>1</td></tr>
<tr><td>NO_SMOOTH_OR_HIDE</td><td class='c'>0</td></tr>
<tr><td>SMOOTH_SOFT_EDGES</td><td class='c'>8</td></tr>
<tr><td>SOFTEN_BASED_ON_INDEX</td><td class='c'>2</td></tr>
</tbody></table>
<br/>

### Face \#classify_point

Defined on [Sketchup::Face].  See [Face#classify_point]

```ruby
pt_location = face.classify_point(pt)
```

```ruby
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
```
<table class='gjl15'><thead>
<th>pt_location<br/>return</th><th class='c'>value<br/>(Fixnum)</th>
</thead><tbody>
<tr><td>PointInside</td><td class='c'>1</td></tr>
<tr><td>PointNotOnPlane</td><td class='c'>32</td></tr>
<tr><td>PointOnEdge</td><td class='c'>4</td></tr>
<tr><td>PointOnFace</td><td class='c'>8</td></tr>
<tr><td>PointOnVertex</td><td class='c'>2</td></tr>
<tr><td>PointOutside</td><td class='c'>16</td></tr>
<tr><td>PointUnknown</td><td class='c'>0</td></tr>
</tbody></table>
<br/>

### Importer \#load_file

Defined on [Sketchup::Importer].  See [Importer#load_file].  These are returned to SketchUp when your
importer is finished with processing.  Note the following is not included --

5 = SketchUp version not supported (no additional dialog shown)

```ruby
class YourImporter < Sketchup::Importer
  def load_file(file_path, status)
    return status_code
  end
end
```

<table class='gjl15'><thead>
<th>status_code<br/>return</th><th class='c'>value<br/>(Fixnum)</th>
</thead><tbody>
<tr><td>ImportCanceled</td><td class='c'>2</td></tr>
<tr><td>ImportFail</td><td class='c'>1</td></tr>
<tr><td>ImportFileNotFound</td><td class='c'>4</td></tr>
<tr><td>ImportSuccess</td><td class='c'>0</td></tr>
<tr><td>ImporterNotFound</td><td class='c'>3</td></tr>
</tbody></table>
<br/>

### Model \#save \#save_copy

Defined on [Sketchup::Model].  Used with [Model#save] and [Model#save_copy] methods

```ruby
# version param +2014, if omitted, saves in current version
status = model.save(filename, version)
status = model.save_copy(filename, version)
```

<table class='gjl15'><thead>
<th>version<br/>parameter</th><th class='c'>value<br/>(Fixnum)</th>
</thead><tbody>
<tr><td>VERSION_3</td><td class='c'>3</td></tr>
<tr><td>VERSION_4</td><td class='c'>4</td></tr>
<tr><td>VERSION_5</td><td class='c'>5</td></tr>
<tr><td>VERSION_6</td><td class='c'>6</td></tr>
<tr><td>VERSION_7</td><td class='c'>7</td></tr>
<tr><td>VERSION_8</td><td class='c'>8</td></tr>
<tr><td>VERSION_2013</td><td class='c'>9</td></tr>
<tr><td>VERSION_2014</td><td class='c'>10</td></tr>
</tbody></table>
<br/>

### RenderingOptionsObserver

Defined on [Sketchup::RenderingOptions].  These constants are used with a
[RenderingOptionsObserver] instance (fqn Sketchup::RenderingOptionsObserver).
 
A [RenderingOptions] instance is essentially a Hash.  Its keys can be
enumerated, and setting their value will change the rendering options of the model.
The constants are used in a callback method in a [RenderingOptionsObserver]
instance as a notification of rendering option changes by the user or other code.

The constants provide some information about the change.  Some notes -
* They do not map one-to-one to the [RenderingOptions] keys.  Some changes
  will result in two callbacks firing.
* Some [RenderingOptions] keys will fire a callback, but with no constant
  assigned to the type value.
* Some [RenderingOptions] keys will not fire a callback.

The following code can either be pasted into the Ruby console or loaded via a file.
First, it lists all of the [RenderingOptions] constants.
Secondly, it adds a [RenderingOptionsObserver] to the current model.  The observer
outputs to the console the [onRenderingOptionsChanged] callback's type
parameter and the constant associated with it.  It is not code designed for production.

Since all the constants are prefixed by 'ROPSet' or 'ROP', the code adds a few
spaces after the prefix. To 'remove' the code, just open another model, which
destroys all references to it.

```ruby
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
@@obs_ro = Object.new
def @@obs_ro.onRenderingOptionsChanged(ro, type)
  puts "#{type.to_s.rjust(3)}  #{@@roc[type]}"
end
# attach the observer
Sketchup.active_model.rendering_options.add_observer(@@obs_ro)
```

The above code does not make use of the constants, so the below code shows one
way of creating an observer.  The callback uses some constants (items in 'view'
menu and toolbar) in a case statement.  Similar code could be used in a plug-in.

```ruby
# create an observer
obs_ro = Sketchup::RenderingOptionsObserver.new
# add callback method
def obs_ro.onRenderingOptionsChanged(ro, type)
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
```

The following table lists [RenderingOptions] keys which fire callbacks in a
[RenderingOptionsObserver] [onRenderingOptionsChanged] callback.  As
mentioned, some keys generate more than one callback, and, any row with
'** Missing, type =' in the 'Observer constant (type)' column fired a callback,
but there isn't a [RenderingOptions] constant with that value.

<table class='gjl15'><thead>
<th>RenderingOptions<br/>key</th><th><br/>RO value.class</th><th>Observer<br/>constant (type)</th>
</thead><tbody>
<tr><td>BackgroundColor</td><td>Sketchup::Color</td><td>ROPSetBackgroundColor</td></tr>
<tr><td>ConstructionColor</td><td>Sketchup::Color</td><td>ROPSetConstructionColor</td></tr>
<tr><td>DepthQueWidth</td><td>Fixnum</td><td>ROPSetDepthQueWidth</td></tr>
<tr><td>DisplayColorByLayer</td><td>Boolean</td><td>ROPSetDisplayColorByLayer</td></tr>
<tr><td>DisplayDims</td><td>Boolean</td><td>ROPSetDisplayDims</td></tr>
<tr><td>DisplayFog</td><td>Boolean</td><td>ROPSetDisplayFog</td></tr>
<tr><td>DisplayInstanceAxes</td><td>Boolean</td><td>ROPSetDisplayInstanceAxes</td></tr>
<tr><td>DisplaySectionPlanes</td><td>Boolean</td><td>ROPSetSectionDisplayMode</td></tr>
<tr><td>DisplaySectionPlanes</td><td>Boolean</td><td><strong>** Missing, type = 26</strong></td></tr>
<tr><td>DisplaySketchAxes</td><td>Boolean</td><td>ROPSetDisplaySketchAxes</td></tr>
<tr><td>DisplayText</td><td>Boolean</td><td>ROPSetDisplayText</td></tr>
<tr><td>DisplayWatermarks</td><td>Boolean</td><td><strong>** Missing, type = 55</strong></td></tr>
<tr><td>DrawDepthQue</td><td>Boolean</td><td>ROPSetDepthQueEdges</td></tr>
<tr><td>DrawGround</td><td>Boolean</td><td>ROPSetDrawGround</td></tr>
<tr><td>DrawHidden</td><td>Boolean</td><td>ROPDrawHidden</td></tr>
<tr><td>DrawHorizon</td><td>Boolean</td><td>ROPSetDrawHorizon</td></tr>
<tr><td>DrawLineEnds</td><td>Boolean</td><td>ROPSetLineEndEdges</td></tr>
<tr><td>DrawProfilesOnly</td><td>Boolean</td><td>ROPSetProfilesOnlyEdges</td></tr>
<tr><td>DrawSilhouettes</td><td>Boolean</td><td>ROPSetProfileEdges</td></tr>
<tr><td>DrawUnderground</td><td>Boolean</td><td>ROPSetDrawUnderground</td></tr>
<tr><td>EdgeColorMode</td><td>Fixnum</td><td>ROPSetEdgeColorMode</td></tr>
<tr><td>EdgeDisplayMode</td><td>Fixnum</td><td>ROPSetEdgeDisplayMode</td></tr>
<tr><td>EdgeType</td><td>Fixnum</td><td>ROPSetEdgeType</td></tr>
<tr><td>ExtendLines</td><td>Boolean</td><td>ROPSetExtendLines</td></tr>
<tr><td>FaceBackColor</td><td>Sketchup::Color</td><td>ROPSetFaceColor</td></tr>
<tr><td>FaceColorMode</td><td>Fixnum</td><td>ROPSetFaceColorMode</td></tr>
<tr><td>FaceFrontColor</td><td>Sketchup::Color</td><td>ROPSetFaceColor</td></tr>
<tr><td>FogColor</td><td>Sketchup::Color</td><td>ROPSetFogColor</td></tr>
<tr><td>FogEndDist</td><td>Float</td><td>ROPSetFogDist</td></tr>
<tr><td>FogStartDist</td><td>Float</td><td>ROPSetFogDist</td></tr>
<tr><td>FogUseBkColor</td><td>Boolean</td><td>ROPSetFogUseBkColor</td></tr>
<tr><td>ForegroundColor</td><td>Sketchup::Color</td><td>ROPSetForegroundColor</td></tr>
<tr><td>GroundColor</td><td>Sketchup::Color</td><td>ROPSetGroundColor</td></tr>
<tr><td>GroundTransparency</td><td>Fixnum</td><td>ROPSetGroundTransparency</td></tr>
<tr><td>HideConstructionGeometry</td><td>Boolean</td><td>ROPSetHideConstructionGeometry</td></tr>
<tr><td>HighlightColor</td><td>Sketchup::Color</td><td>ROPSetHighlightColor</td></tr>
<tr><td>InactiveFade</td><td>Float</td><td>ROPEditComponent</td></tr>
<tr><td>InactiveHidden</td><td>Boolean</td><td>ROPEditComponent</td></tr>
<tr><td>InstanceFade</td><td>Float</td><td>ROPEditComponent</td></tr>
<tr><td>InstanceHidden</td><td>Boolean</td><td>ROPEditComponent</td></tr>
<tr><td>JitterEdges</td><td>Boolean</td><td>ROPSetJitterEdges</td></tr>
<tr><td>LineEndWidth</td><td>Fixnum</td><td>ROPSetLineEndWidth</td></tr>
<tr><td>LineExtension</td><td>Fixnum</td><td>ROPSetLineExtension</td></tr>
<tr><td>LockedColor</td><td>Sketchup::Color</td><td>ROPSetLockedColor</td></tr>
<tr><td>MaterialTransparency</td><td>Boolean</td><td>ROPSetMaterialTransparency</td></tr>
<tr><td>ModelTransparency</td><td>Boolean</td><td>ROPSetModelTransparency</td></tr>
<tr><td>RenderMode</td><td>Fixnum</td><td>ROPSetEdgeDisplayMode</td></tr>
<tr><td>RenderMode</td><td>Fixnum</td><td>ROPSetRenderMode</td></tr>
<tr><td>SectionActiveColor</td><td>Sketchup::Color</td><td>ROPSetSectionActiveColor</td></tr>
<tr><td>SectionCutWidth</td><td>Fixnum</td><td>ROPSetSectionCutWidth</td></tr>
<tr><td>SectionDefaultCutColor</td><td>Sketchup::Color</td><td>ROPSetSectionDefaultCutColor</td></tr>
<tr><td>SectionInactiveColor</td><td>Sketchup::Color</td><td>ROPSetSectionInactiveColor</td></tr>
<tr><td>SilhouetteWidth</td><td>Fixnum</td><td>ROPSetProfileWidth</td></tr>
<tr><td>SkyColor</td><td>Sketchup::Color</td><td>ROPSetSkyColor</td></tr>
<tr><td>Texture</td><td>Boolean</td><td>ROPSetTexture</td></tr>
<tr><td>TransparencySort</td><td>Fixnum</td><td>ROPTransparencySortMethod</td></tr>
</tbody></table>
<br/>
The following table lists [RenderingOptions] keys that do not fire the [onRenderingOptionsChanged] callback.

<table class='gjl15'><thead>
<th>RenderingOptions<br/>key</th><th><br/>RO value.class</th>
</thead><tbody>
<tr><td>BandColor</td><td>Sketchup::Color</td></tr>
<tr><td>HorizonColor</td><td>Sketchup::Color</td></tr>
<tr><td>ShowViewName</td><td>Boolean</td></tr>
</tbody></table>
<br/>
The following RenderingOptions constants are not fired by any keys in [RenderingOptions].  They may be returned for UI changes that do not have API control.

<table class='gjl15'><thead>
<th>Observer<br/>constant (type)</th><th class='c'>value</th>
</thead><tbody>
<tr><td>ROPAssign</td><td class='c'>0</td></tr>
<tr><td>ROPSetExtendEdges</td><td class='c'>7</td></tr>
<tr><td>ROPSetFogHint</td><td class='c'>24</td></tr>
<tr><td>ROPSetTransparencyObsolete</td><td class='c'>2</td></tr>
</tbody></table>
<br/>

### Length 'Units' OptionsProvider

Defined on [Length].  See [Model#options], [OptionsManager], [OptionsManager#&#91;&#93;]
and [OptionsProvider].

First, SketchUp.com does not list all of the keys used in [OptionsManager] and 
[OptionsProvider].  The below table shows all of the keys.

<table class='gjl15'><thead>
<th>OptionsManager<br/>key</th><th>OptionsProvider<br/>key</th><th class='c'>OptionsProvider<br/>value</th><th><br/>class</th>
</thead><tbody>
<tr><td>PageOptions</td><td>ShowTransition</td><td class='c'>true</td><td>Boolean</td></tr>
<tr><td></td><td>TransitionTime</td><td class='c'>2.0</td><td>Float</td></tr>
<tr><td>&#160;</td><td></td><td class='c'></td><td></td></tr>
<tr><td>PrintOptions</td><td>ComputeSizeFromScale</td><td class='c'>false</td><td>Boolean</td></tr>
<tr><td></td><td>FitToPage</td><td class='c'>true</td><td>Boolean</td></tr>
<tr><td></td><td>LineWeight</td><td class='c'>0.5</td><td>Float</td></tr>
<tr><td></td><td>ModelExtents</td><td class='c'>true</td><td>Boolean</td></tr>
<tr><td></td><td>NumberOfPages</td><td class='c'>1</td><td>Fixnum</td></tr>
<tr><td></td><td>PixelsPerInch</td><td class='c'>150.0</td><td>Float</td></tr>
<tr><td></td><td>PrintHeight</td><td class='c'>11.0</td><td>Float</td></tr>
<tr><td></td><td>PrintQuality</td><td class='c'>0</td><td>Fixnum</td></tr>
<tr><td></td><td>PrintWidth</td><td class='c'>8.5</td><td>Float</td></tr>
<tr><td></td><td>ScaleAdjustment</td><td class='c'>1.0</td><td>Float</td></tr>
<tr><td></td><td>SectionSlice</td><td class='c'>false</td><td>Boolean</td></tr>
<tr><td></td><td>SizeInModel</td><td class='c'>1.0</td><td>Float</td></tr>
<tr><td></td><td>SizeInPrint</td><td class='c'>1.0</td><td>Float</td></tr>
<tr><td></td><td>VectorMode</td><td class='c'>false</td><td>Boolean</td></tr>
<tr><td>&#160;</td><td></td><td class='c'></td><td></td></tr>
<tr><td>SlideshowOptions</td><td>LoopSlideshow</td><td class='c'>true</td><td>Boolean</td></tr>
<tr><td></td><td>SlideTime</td><td class='c'>1.0</td><td>Float</td></tr>
<tr><td>&#160;</td><td></td><td class='c'></td><td></td></tr>
<tr><td>UnitsOptions</td><td>AnglePrecision</td><td class='c'>1</td><td>Fixnum</td></tr>
<tr><td></td><td>AngleSnapEnabled</td><td class='c'>true</td><td>Boolean</td></tr>
<tr><td></td><td>ForceInchDisplay</td><td class='c'>false</td><td>Boolean</td></tr>
<tr><td></td><td>LengthFormat</td><td class='c'>1</td><td>Fixnum</td></tr>
<tr><td></td><td>LengthPrecision</td><td class='c'>4</td><td>Fixnum</td></tr>
<tr><td></td><td>LengthSnapEnabled</td><td class='c'>true</td><td>Boolean</td></tr>
<tr><td></td><td>LengthSnapLength</td><td class='c'>0.25</td><td>Float</td></tr>
<tr><td></td><td>LengthUnit</td><td class='c'>0</td><td>Fixnum</td></tr>
<tr><td></td><td>SnapAngle</td><td class='c'>15.0</td><td>Float</td></tr>
<tr><td></td><td>SuppressUnitsDisplay</td><td class='c'>false</td><td>Boolean</td></tr>
</tbody></table>
<br/> 

These constants are used with the 'UnitsOptions' [OptionsProvider].  In the two
following code lines, units and format have constant equivalents.

```ruby
am = Sketchup.active_model
units  = am.options['UnitsOptions']['LengthUnit']
format = am.options['UnitsOptions']['LengthFormat']
```

The following code creates two hashes that make use of the Length:: constants.

```ruby
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
```

<table class='gjl15'><thead>
<th>constant<br/>name</th><th class='c'>value<br/>(Fixnum)</th>
</thead><tbody>
<tr><td>Architectural</td><td class='c'>1</td></tr>
<tr><td>Centimeter</td><td class='c'>3</td></tr>
<tr><td>Decimal</td><td class='c'>0</td></tr>
<tr><td>Engineering</td><td class='c'>2</td></tr>
<tr><td>Feet</td><td class='c'>1</td></tr>
<tr><td>Fractional</td><td class='c'>3</td></tr>
<tr><td>Inches</td><td class='c'>0</td></tr>
<tr><td>Meter</td><td class='c'>4</td></tr>
<tr><td>Millimeter</td><td class='c'>2</td></tr>
</tbody></table>
<br/>

## Global Object Constants

### Geometry Class constants

These constants can be used anywhere their respective classes are used.

<table class='gjl15'><thead>
<th>constant name</th><th class='c'>value</th><th>class</th>
</thead><tbody>
<tr><td>IDENTITY</td><td class='c'>#<Geom::Transformation:0x9d77210></td><td>Geom::Transformation</td></tr>
<tr><td>ORIGIN</td><td class='c'>(0", 0", 0")</td><td>Geom::Point3d</td></tr>
<tr><td>X_AXIS</td><td class='c'>(1.0, 0.0, 0.0)</td><td>Geom::Vector3d</td></tr>
<tr><td>Y_AXIS</td><td class='c'>(0.0, 1.0, 0.0)</td><td>Geom::Vector3d</td></tr>
<tr><td>Z_AXIS</td><td class='c'>(0.0, 0.0, 1.0)</td><td>Geom::Vector3d</td></tr>
</tbody></table>
<br/>

### Other object constants

The only other object constant defined is [Sketchup::Console].

```ruby
SKETCHUP_CONSOLE.write("this way also")
```

<table class='gjl15'><thead>
<th>constant<br/>name</th><th class='c'>value<br/>()</th>
</thead><tbody>
<tr><td>SKETCHUP_CONSOLE</td><td class='c'>#<Sketchup::Console:0x9d765c8></td></tr>
</tbody></table>
<br/>

## Global Numeric Constants

### Sketchup.send_action

```ruby
Sketchup.send_action(action)
```

See [Sketchup.send_action].  This method allows for either a string or a number for
its parameter.  Numbers are officially 'unsupported', and only available under Windows.  

The following code produces the same result.

```ruby
result = Sketchup.send_action("selectArcTool:")  # use a String
result = Sketchup.send_action(CMD_ARC)           # use a Fixnum constant

result = Sketchup.send_action(action)            # action can be either
```

The following table shows strings (taken from SketchUp.com Nov-15), and their constant
equivalents.  Matches were done via RegEx and several lines of case statement.

<table class='gjl15'><thead>
<th>action parameter<br/>String</th><th>action parameter<br/>Constant</th><th class='c'>action<br/>Fixnum</th>
</thead><tbody>
<tr><td>copy:</td><td>CMD_COPY</td><td class='c'>57634</td></tr>
<tr><td>cut:</td><td>CMD_CUT</td><td class='c'>57635</td></tr>
<tr><td>editHide:</td><td></td><td class='c'></td></tr>
<tr><td>editRedo:</td><td>CMD_REDO</td><td class='c'>57644</td></tr>
<tr><td>editUndo:</td><td>CMD_UNDO</td><td class='c'>57643</td></tr>
<tr><td>editUnhide:</td><td></td><td class='c'></td></tr>
<tr><td>fixNonPlanarFaces:</td><td></td><td class='c'></td></tr>
<tr><td>getPhotoTexture:</td><td></td><td class='c'></td></tr>
<tr><td>openDocument:</td><td>CMD_OPEN</td><td class='c'>57601</td></tr>
<tr><td>pageAdd:</td><td>CMD_PAGE_NEW</td><td class='c'>21067</td></tr>
<tr><td>pageDelete:</td><td>CMD_PAGE_DELETE</td><td class='c'>21078</td></tr>
<tr><td>pageNext:</td><td>CMD_PAGE_NEXT</td><td class='c'>10535</td></tr>
<tr><td>pagePrevious:</td><td>CMD_PAGE_PREVIOUS</td><td class='c'>10536</td></tr>
<tr><td>pageUpdate:</td><td>CMD_PAGE_UPDATE</td><td class='c'>21068</td></tr>
<tr><td>paste:</td><td>CMD_PASTE</td><td class='c'>57637</td></tr>
<tr><td>printDocument:</td><td>CMD_PRINT</td><td class='c'>57607</td></tr>
<tr><td>renderHiddenLine:</td><td>CMD_HIDDENLINE</td><td class='c'>10511</td></tr>
<tr><td>renderMonochrome:</td><td></td><td class='c'></td></tr>
<tr><td>renderShaded:</td><td>CMD_SHADED</td><td class='c'>10512</td></tr>
<tr><td>renderTextures:</td><td>CMD_TEXTURED</td><td class='c'>10539</td></tr>
<tr><td>renderWireframe:</td><td>CMD_WIREFRAME</td><td class='c'>10510</td></tr>
<tr><td>selectArc3PointPieTool:</td><td></td><td class='c'></td></tr>
<tr><td>selectArc3PointTool:</td><td></td><td class='c'></td></tr>
<tr><td>selectArcTool:</td><td>CMD_ARC</td><td class='c'>21065</td></tr>
<tr><td>selectAxisTool:</td><td></td><td class='c'></td></tr>
<tr><td>selectCircleTool:</td><td>CMD_CIRCLE</td><td class='c'>21096</td></tr>
<tr><td>selectDimensionTool:</td><td>CMD_DIMENSION</td><td class='c'>21410</td></tr>
<tr><td>selectDollyTool:</td><td>CMD_DOLLY</td><td class='c'>10523</td></tr>
<tr><td>selectEraseTool:</td><td>CMD_ERASE</td><td class='c'>21019</td></tr>
<tr><td>selectExtrudeTool:</td><td>CMD_EXTRUDE</td><td class='c'>21525</td></tr>
<tr><td>selectFieldOfViewTool:</td><td>CMD_DISPLAY_FOV</td><td class='c'>21494</td></tr>
<tr><td>selectFreehandTool:</td><td>CMD_FREEHAND</td><td class='c'>21031</td></tr>
<tr><td>selectImageIglooTool:</td><td></td><td class='c'></td></tr>
<tr><td>selectLineTool:</td><td>CMD_LINE</td><td class='c'>21020</td></tr>
<tr><td>selectMeasureTool:</td><td>CMD_MEASURE</td><td class='c'>21024</td></tr>
<tr><td>selectMoveTool:</td><td>CMD_MOVE</td><td class='c'>21048</td></tr>
<tr><td>selectNorthTool:</td><td></td><td class='c'></td></tr>
<tr><td>selectOffsetTool:</td><td>CMD_OFFSET</td><td class='c'>21100</td></tr>
<tr><td>selectOrbitTool:</td><td>CMD_ORBIT</td><td class='c'>10508</td></tr>
<tr><td>selectPaintTool:</td><td>CMD_PAINT</td><td class='c'>21074</td></tr>
<tr><td>selectPolygonTool:</td><td>CMD_POLYGON</td><td class='c'>21095</td></tr>
<tr><td>selectPositionCameraTool:</td><td>CMD_POSITION_CAMERA</td><td class='c'>21169</td></tr>
<tr><td>selectProtractorTool:</td><td>CMD_PROTRACTOR</td><td class='c'>21057</td></tr>
<tr><td>selectPushPullTool:</td><td>CMD_PUSHPULL</td><td class='c'>21041</td></tr>
<tr><td>selectRectangle3PointTool:</td><td></td><td class='c'></td></tr>
<tr><td>selectRectangleTool:</td><td>CMD_RECTANGLE</td><td class='c'>21094</td></tr>
<tr><td>selectRotateTool:</td><td>CMD_ROTATE</td><td class='c'>21129</td></tr>
<tr><td>selectScaleTool:</td><td>CMD_SCALE</td><td class='c'>21236</td></tr>
<tr><td>selectSectionPlaneTool:</td><td>CMD_SECTION</td><td class='c'>21337</td></tr>
<tr><td>selectSelectionTool:</td><td>CMD_SELECT</td><td class='c'>21022</td></tr>
<tr><td>selectTextTool:</td><td>CMD_TEXT</td><td class='c'>21405</td></tr>
<tr><td>selectTurnTool:</td><td>CMD_PAN</td><td class='c'>10525</td></tr>
<tr><td>selectWalkTool:</td><td>CMD_WALK</td><td class='c'>10520</td></tr>
<tr><td>selectZoomTool:</td><td>CMD_ZOOM</td><td class='c'>10509</td></tr>
<tr><td>selectZoomWindowTool:</td><td>CMD_ZOOM_WINDOW</td><td class='c'>10526</td></tr>
<tr><td>showRubyPanel:</td><td>CMD_RUBY_CONSOLE</td><td class='c'>21478</td></tr>
<tr><td>viewBack:</td><td>CMD_VIEW_BACK</td><td class='c'>10505</td></tr>
<tr><td>viewBottom:</td><td>CMD_VIEW_BOTTOM</td><td class='c'>10506</td></tr>
<tr><td>viewFront:</td><td>CMD_VIEW_FRONT</td><td class='c'>10502</td></tr>
<tr><td>viewIso:</td><td>CMD_VIEW_ISO</td><td class='c'>10507</td></tr>
<tr><td>viewLeft:</td><td>CMD_VIEW_LEFT</td><td class='c'>10504</td></tr>
<tr><td>viewPerspective:</td><td>CMD_VIEW_PERSPECTIVE</td><td class='c'>10519</td></tr>
<tr><td>viewRight:</td><td>CMD_VIEW_RIGHT</td><td class='c'>10503</td></tr>
<tr><td>viewShowAxes:</td><td>CMD_SKETCHAXES</td><td class='c'>10522</td></tr>
<tr><td>viewShowGuides:</td><td>CMD_SHOWGUIDES</td><td class='c'>21980</td></tr>
<tr><td>viewShowHidden:</td><td>CMD_SHOWHIDDEN</td><td class='c'>21154</td></tr>
<tr><td>viewTop:</td><td>CMD_VIEW_TOP</td><td class='c'>10501</td></tr>
<tr><td>viewUndo:</td><td></td><td class='c'></td></tr>
<tr><td>viewZoomExtents:</td><td>CMD_ZOOM_EXTENTS</td><td class='c'>10527</td></tr>
<tr><td>viewZoomToSelection:</td><td>CMD_SELECTION_ZOOM_EXT</td><td class='c'>21469</td></tr>
</tbody></table>
<br/>

The following constants do not have string equivalents.

<table class='gjl15'><thead>
<th>Numeric<br/>Constant</th><th class='c'>value<br/>(Fixnum)</th>
</thead><tbody>
<tr><td>CMD_CAMERA_UNDO</td><td class='c'>10529</td></tr>
<tr><td>CMD_DELETE</td><td class='c'>21021</td></tr>
<tr><td>CMD_DRAWCUTS</td><td class='c'>21348</td></tr>
<tr><td>CMD_DRAWOUTLINES</td><td class='c'>21347</td></tr>
<tr><td>CMD_MAKE_COMPONENT</td><td class='c'>21083</td></tr>
<tr><td>CMD_NEW</td><td class='c'>57600</td></tr>
<tr><td>CMD_SAVE</td><td class='c'>57603</td></tr>
<tr><td>CMD_SKETCHCS</td><td class='c'>21126</td></tr>
<tr><td>CMD_TRANSPARENT</td><td class='c'>10513</td></tr>
</tbody></table>
<br/>

### Sketchup.set_status_text

See [Sketchup.set_status_text].  Text can be placed in three different locations.
The constants define the location.

```ruby
result = Sketchup.set_status_text("This is a Test", SB_VCB_VALUE)
result = Sketchup.set_status_text(status, position)
```

<table class='gjl15'><thead>
<th>position<br/>parameter</th><th class='c'>value<br/>(Fixnum)</th>
</thead><tbody>
<tr><td>SB_PROMPT</td><td class='c'>0</td></tr>
<tr><td>SB_VCB_LABEL</td><td class='c'>1</td></tr>
<tr><td>SB_VCB_VALUE</td><td class='c'>2</td></tr>
</tbody></table>
<br/>

### Command \#set_validation_proc

See [Command#set_validation_proc].  The value returned by the block determines
the display state of a command, which can be a menu item, a toolbar button, or both.

```ruby
your_toolbar = UI::Toolbar.new "YourToolbar"
your_submenu = UI.menu("Draw").add_submenu("Yours")
 
cmd = UI::Command.new("YourCmd") { some method() }
cmd.menu_text  = "My Command"
cmd.small_icon = "YourCmdSmall.png"
cmd.large_icon = "YourCmdLarge.png"
 
cmd.set_validation_proc {
  # process
  return cmd_status
}
 
your_toolbar.add_item cmd
your_submenu.add_item cmd
```

<table class='gjl15'><thead>
<th>cmd_status<br/>return</th><th class='c'>value<br/>(Fixnum)</th>
</thead><tbody>
<tr><td>MF_CHECKED</td><td class='c'>8</td></tr>
<tr><td>MF_DISABLED</td><td class='c'>2</td></tr>
<tr><td>MF_ENABLED</td><td class='c'>0</td></tr>
<tr><td>MF_GRAYED</td><td class='c'>1</td></tr>
<tr><td>MF_UNCHECKED</td><td class='c'>0</td></tr>
</tbody></table>
<br/>

### Definition \#behavior \#snapto

See [Behavior#snapto].  To quote SU help, 'The Behavior class is used to control
the "behavior" of components'.  

```ruby
snap_to = behavior.snapto
behavior.snapto = snap_to
```

<table class='gjl15'><thead>
<th><br/>snap_to</th><th class='c'>value<br/>(Fixnum)</th>
</thead><tbody>
<tr><td>SnapTo_Arbitrary</td><td class='c'>0</td></tr>
<tr><td>SnapTo_Horizontal</td><td class='c'>1</td></tr>
<tr><td>SnapTo_Sloped</td><td class='c'>3</td></tr>
<tr><td>SnapTo_Vertical</td><td class='c'>2</td></tr>
</tbody></table>
<br/>

### Layer \#page_behavior \#page_behavior=

See [Layer#page_behavior].  This attribute is a numeric, with somewhat confusing
documentation.  From the docs, 'The behaviour is composed of a combination of
these flags'.  So default visiblity is bit 0 ('HIDDEN' is set), why does 'NEW_PAGES'
have 'VISIBLE' setting bit 4 and 'HIDDEN' setting bit 5?  Seems that they should
be mutually exclusive.

```ruby
layers = Sketchup.active_model.layers
layer.page_behavior = page_behavior
page_behavior = layers[0].page_behavior
puts page_behavior[0]   # this is default visiblity
puts page_behavior[4]   # this new pages visible?
puts page_behavior[5]   # this new pages hidden?
```

<< layer_page_behavior >>

### Page \#update, Pages \#add

See [Page#update] and [Pages#add].  These bit constants are used for the flag
parameter.

```ruby
status = Sketchup.active_model.pages.add(name, flags = nil, index = nil)
Sketchup.active_model.pages['yourPage'].update(flags = nil)
```

<table class='gjl15'><thead>
<th><br/>flag parameter</th><th class='c'>value<br/>(Fixnum)</th>
</thead><tbody>
<tr><td>PAGE_NO_CAMERA</td><td class='c'>4094</td></tr>
<tr><td>PAGE_USE_ALL</td><td class='c'>4095</td></tr>
<tr><td>PAGE_USE_CAMERA</td><td class='c'>1</td></tr>
<tr><td>PAGE_USE_HIDDEN</td><td class='c'>16</td></tr>
<tr><td>PAGE_USE_LAYER_VISIBILITY</td><td class='c'>32</td></tr>
<tr><td>PAGE_USE_RENDERING_OPTIONS</td><td class='c'>2</td></tr>
<tr><td>PAGE_USE_SECTION_PLANES</td><td class='c'>64</td></tr>
<tr><td>PAGE_USE_SHADOWINFO</td><td class='c'>4</td></tr>
<tr><td>PAGE_USE_SKETCHCS</td><td class='c'>8</td></tr>
</tbody></table>
<br/>

### Text \#leader_type \#leader_type=

See [Text#leader_type]

```ruby
leader = text.leader_type
leader = Text.leader_type = leader
```

<table class='gjl15'><thead>
<th><br/>leader</th><th class='c'>value<br/>(Fixnum)</th>
</thead><tbody>
<tr><td>ALeaderModel</td><td class='c'>2</td></tr>
<tr><td>ALeaderNone</td><td class='c'>0</td></tr>
<tr><td>ALeaderView</td><td class='c'>1</td></tr>
</tbody></table>
<br/>

### TextureWriter \#write 

See [Texturewriter#write]

```ruby
tw = Sketchup.create_texture_writer
status = tw.write(entity, side, filename)
```

<table class='gjl15'><thead>
<th><br/>status return</th><th class='c'>value<br/>(Fixnum)</th>
</thead><tbody>
<tr><td>FILE_WRITE_FAILED_INVALID_TYPE</td><td class='c'>1</td></tr>
<tr><td>FILE_WRITE_FAILED_UNKNOWN</td><td class='c'>2</td></tr>
<tr><td>FILE_WRITE_OK</td><td class='c'>0</td></tr>
</tbody></table>
<br/>

### Tool \#onKeyDown, Tool \#onKeyUp

See [Tool#onKeyDown].  The constants are the key parameter, VK_PRIOR is 'Page Up',
VK_NEXT is 'Page Down'.
* A-Z keys return 65-90
* qwerty number keys are 48-57
* keypad number keys are 96-105

I could not get any information from the flags parameter. I would suggest using
keyUp and KeyDown to keep track of modifier key state.

```ruby
 def onKeyDown(key, repeat, flags, view)
```

<table class='gjl15'><thead>
<th>key<br/>parameter</th><th class='c'>value<br/>(Fixnum)</th>
</thead><tbody>
<tr><td>VK_ALT</td><td class='c'>18</td></tr>
<tr><td>VK_COMMAND</td><td class='c'>18</td></tr>
<tr><td>VK_CONTROL</td><td class='c'>17</td></tr>
<tr><td>VK_DELETE</td><td class='c'>46</td></tr>
<tr><td>VK_DOWN</td><td class='c'>40</td></tr>
<tr><td>VK_END</td><td class='c'>35</td></tr>
<tr><td>VK_HOME</td><td class='c'>36</td></tr>
<tr><td>VK_INSERT</td><td class='c'>45</td></tr>
<tr><td>VK_LEFT</td><td class='c'>37</td></tr>
<tr><td>VK_MENU</td><td class='c'>18</td></tr>
<tr><td>VK_NEXT</td><td class='c'>34</td></tr>
<tr><td>VK_PRIOR</td><td class='c'>33</td></tr>
<tr><td>VK_RIGHT</td><td class='c'>39</td></tr>
<tr><td>VK_SHIFT</td><td class='c'>16</td></tr>
<tr><td>VK_SPACE</td><td class='c'>32</td></tr>
<tr><td>VK_UP</td><td class='c'>38</td></tr>
</tbody></table>
<br/>

### Tool \#onMouse

See [Tool #onLButtonDoubleClick].  A total of nine mouse button events exist:
up, down, and double click, for left, middle, and right buttons.
Under Windows -
* A user can click more than one button at once.
* The 'flags' bits for which buttons are pressed are **not set** on the 'Up' events.
* 'Down' and 'Up' events fire first, then the 'DoubleClick' event fires.

All methods have the following for parameters -

```ruby
def onLButtonDown(flags, x, y, view)
# your code
end
```

Below is code that shows use of the constants, same parameters as the mouse calls,
with the addition of a 'click type' parameter.

```ruby
def mouse(flags, x, y, view, up_down_dbl)
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
puts "Mouse Button #{s1} button = #{s2} keys = #{key_mod.join(", ")}"
end
```

<table class='gjl15'><thead>
<th>flags<br/>parameter</th><th class='c'>value<br/>(Fixnum)</th>
</thead><tbody>
<tr><td>MK_ALT</td><td class='c'>32</td></tr>
<tr><td>MK_COMMAND</td><td class='c'>0</td></tr>
<tr><td>MK_CONTROL</td><td class='c'>8</td></tr>
<tr><td>MK_LBUTTON</td><td class='c'>1</td></tr>
<tr><td>MK_MBUTTON</td><td class='c'>16</td></tr>
<tr><td>MK_RBUTTON</td><td class='c'>2</td></tr>
<tr><td>MK_SHIFT</td><td class='c'>4</td></tr>
</tbody></table>
<br/>

### Toolbar #get_last_state

See [Toolbar#get_last_state].

```ruby
state = toolbar.get_last_state
```

<table class='gjl15'><thead>
<th>state<br/>return</th><th class='c'>value<br/>(Fixnum)</th>
</thead><tbody>
<tr><td>TB_HIDDEN</td><td class='c'>0</td></tr>
<tr><td>TB_NEVER_SHOWN</td><td class='c'>-1</td></tr>
<tr><td>TB_VISIBLE</td><td class='c'>1</td></tr>
</tbody></table>
<br/>

### UI.messagebox

See [UI.messagebox].  `MB_MULTILINE` shows a dialog with a scrollable text area
and an 'Okay' button.

```ruby
status = UI.messagebox(message, type)
```
<table class='gjl15'><thead>
<th><br/>type parameter</th><th class='c'>value<br/>(Fixnum)</th>
</thead><tbody>
<tr><td>MB_ABORTRETRYIGNORE</td><td class='c'>2</td></tr>
<tr><td>MB_MULTILINE</td><td class='c'>16</td></tr>
<tr><td>MB_OK</td><td class='c'>0</td></tr>
<tr><td>MB_OKCANCEL</td><td class='c'>1</td></tr>
<tr><td>MB_RETRYCANCEL</td><td class='c'>5</td></tr>
<tr><td>MB_YESNO</td><td class='c'>4</td></tr>
<tr><td>MB_YESNOCANCEL</td><td class='c'>3</td></tr>
</tbody></table>
<br/>
<table class='gjl15'><thead>
<th>status<br/>return</th><th class='c'>value<br/>(Fixnum)</th>
</thead><tbody>
<tr><td>IDABORT</td><td class='c'>3</td></tr>
<tr><td>IDCANCEL</td><td class='c'>2</td></tr>
<tr><td>IDIGNORE</td><td class='c'>5</td></tr>
<tr><td>IDNO</td><td class='c'>7</td></tr>
<tr><td>IDOK</td><td class='c'>1</td></tr>
<tr><td>IDRETRY</td><td class='c'>4</td></tr>
<tr><td>IDYES</td><td class='c'>6</td></tr>
</tbody></table>
<br/>

### View \#draw   
     
See [View#draw]

```ruby
view = Sketchup.active_model.active_view
view.draw(mode, pts)
```

<table class='gjl15'><thead>
<th><br/>mode parameter</th><th class='c'>value<br/>(Fixnum)</th>
</thead><tbody>
<tr><td>GL_LINES</td><td class='c'>1</td></tr>
<tr><td>GL_LINE_LOOP</td><td class='c'>2</td></tr>
<tr><td>GL_LINE_STRIP</td><td class='c'>3</td></tr>
<tr><td>GL_POINTS</td><td class='c'>0</td></tr>
<tr><td>GL_POLYGON</td><td class='c'>9</td></tr>
<tr><td>GL_QUADS</td><td class='c'>7</td></tr>
<tr><td>GL_QUAD_STRIP</td><td class='c'>8</td></tr>
<tr><td>GL_TRIANGLES</td><td class='c'>4</td></tr>
<tr><td>GL_TRIANGLE_FAN</td><td class='c'>6</td></tr>
<tr><td>GL_TRIANGLE_STRIP</td><td class='c'>5</td></tr>
</tbody></table>
<br/>

### View \#draw_text

See [View#draw_text].  These constants are used in SketchUp 2016+ and control the
text alignment.

<table class='gjl15'><thead>
<th>:align<br/>hash value</th><th class='c'>value<br/>(Fixnum)</th>
</thead><tbody>
<tr><td>TextAlignCenter</td><td class='c'>1</td></tr>
<tr><td>TextAlignLeft</td><td class='c'>0</td></tr>
<tr><td>TextAlignRight</td><td class='c'>2</td></tr>
</tbody></table>
<br/>

### RUBY_ Constants, SketchUp Platform Constants

The following are _RUBY and SketchUp constants which vary from version to version.

<table class='gjl15'><thead>
<th>constant name</th><th class='c'>value</th><th>class</th>
</thead><tbody>
<tr><td>RUBY_COPYRIGHT</td><td class='c'>ruby - Copyright (C) 1993-2013<br/>Yukihiro Matsumoto</td><td>String</td></tr>
<tr><td>RUBY_DESCRIPTION</td><td class='c'>ruby 2.0.0p247 (2013-06-27)<br/>[i386-mingw32]</td><td>String</td></tr>
<tr><td>RUBY_ENGINE</td><td class='c'>ruby</td><td>String</td></tr>
<tr><td>RUBY_PATCHLEVEL</td><td class='c'>247</td><td>Fixnum</td></tr>
<tr><td>RUBY_PLATFORM</td><td class='c'>i386-mingw32</td><td>String</td></tr>
<tr><td>RUBY_RELEASE_DATE</td><td class='c'>2013-06-27</td><td>String</td></tr>
<tr><td>RUBY_REVISION</td><td class='c'>0</td><td>Fixnum</td></tr>
<tr><td>RUBY_VERSION</td><td class='c'>2.0.0</td><td>String</td></tr>
</tbody></table>
<br/>

## Depreciated Constants

I beleieve the following are depreciated. VK_ constants should be used in their
place.  I tried the mask constants on both the key and flags parameters, and
nothing seemed to work.

<table class='gjl15'><thead>
<th>constant<br/>name</th><th class='c'>value<br/>(Fixnum)</th>
</thead><tbody>
<tr><td>ALT_MODIFIER_KEY</td><td class='c'>18</td></tr>
<tr><td>ALT_MODIFIER_MASK</td><td class='c'>32</td></tr>
<tr><td>CONSTRAIN_MODIFIER_KEY</td><td class='c'>16</td></tr>
<tr><td>CONSTRAIN_MODIFIER_MASK</td><td class='c'>4</td></tr>
<tr><td>COPY_MODIFIER_KEY</td><td class='c'>17</td></tr>
<tr><td>COPY_MODIFIER_MASK</td><td class='c'>8</td></tr>
</tbody></table>
<br/>

The following have been replaced by namespaced constants.

<table class='gjl15'><thead>
<th>constant<br/>name</th><th class='c'>value<br/>(Fixnum)</th>
</thead><tbody>
<tr><td>DimensionArrowClosed</td><td class='c'>3</td></tr>
<tr><td>DimensionArrowDot</td><td class='c'>2</td></tr>
<tr><td>DimensionArrowNone</td><td class='c'>0</td></tr>
<tr><td>DimensionArrowOpen</td><td class='c'>4</td></tr>
<tr><td>DimensionArrowSlash</td><td class='c'>1</td></tr>
</tbody></table>
<br/>

## Yet to be added to documentation or unknown

<table class='gjl15'><thead>
<th>constant<br/>name</th><th class='c'>value<br/>(Fixnum)</th>
</thead><tbody>
<tr><td>Sketchup::Pages::ImageEmbedded</td><td class='c'>0</td></tr>
<tr><td>Sketchup::Pages::ImageEmbeddedAndLinked</td><td class='c'>1</td></tr>
<tr><td>Sketchup::Pages::ImageLinked</td><td class='c'>2</td></tr>
<tr><td>Sketchup::Pages::UnitsNormalizedX</td><td class='c'>2</td></tr>
<tr><td>Sketchup::Pages::UnitsNormalizedY</td><td class='c'>1</td></tr>
<tr><td>Sketchup::Pages::UnitsPixels</td><td class='c'>0</td></tr>
</tbody></table>
<br/>
