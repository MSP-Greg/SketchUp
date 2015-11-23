# @title MD Table Test
[Face.classify_point]:http://www.sketchup.com/intl/en/developer/docs/ourdoc/face#classify_point
[Model#options]:http://www.sketchup.com/intl/en/developer/docs/ourdoc/model#options
[OptionsManager]:http://www.sketchup.com/intl/en/developer/docs/ourdoc/optionsmanager
[OptionsManager#&#91;&#93;]:http://www.sketchup.com/intl/en/developer/docs/ourdoc/optionsmanager#[]
[OptionsProvider]:http://www.sketchup.com/intl/en/developer/docs/ourdoc/optionsprovider
[Model#save]:http://www.sketchup.com/intl/en/developer/docs/ourdoc/model#save
[Model#save_copy]:http://www.sketchup.com/intl/en/developer/docs/ourdoc/model#save_copy
[RenderingOptions]:http://www.sketchup.com/intl/en/developer/docs/ourdoc/renderingoptions
[RenderingOptionsObserver]:http://www.sketchup.com/intl/en/developer/docs/ourdoc/renderingoptionsobserver
[onRenderingOptionsChanged]:http://www.sketchup.com/intl/en/developer/docs/ourdoc/renderingoptionsobserver#onRenderingOptionsChanged
[Sketchup.send_action]:http://www.sketchup.com/intl/en/developer/docs/ourdoc/sketchup#send_action
[Command#set_validation_proc]:http://www.sketchup.com/intl/en/developer/docs/ourdoc/command#set_validation_proc
[layer.page_behavior]: http://www.sketchup.com/intl/en/developer/docs/ourdoc/layer#page_behavior
[texturewriter#write]:http://www.sketchup.com/intl/en/developer/docs/ourdoc/texturewriter#write
[UI.messagebox]:http://www.sketchup.com/intl/en/developer/docs/ourdoc/ui#messagebox
[View#draw]:http://www.sketchup.com/intl/en/developer/docs/ourdoc/view#draw

<script>
var ss_last = document.styleSheets.length - 1,
    ss = document.styleSheets[ss_last],
    rules = ss.cssRules,
    rT1 = "#filecontents table.gjl15 ";
ss.insertRule(rT1 + "{ border:none;}", rules.length );
ss.insertRule(rT1 + "thead { border-bottom:2px solid #aaa; background-color:transparent;}", rules.length );
ss.insertRule(rT1 + "tr { border:none; background-color:transparent;}", rules.length );
ss.insertRule(rT1 + "th { border:none; padding: 2px 10px 2px 3px; background-color:transparent; text-align:left;}", rules.length );
ss.insertRule(rT1 + "td { border:none; padding: 2px 10px 2px 3px; background-color:transparent;}", rules.length );
ss.insertRule(rT1 + "td.c, " + rT1 + "th.c { text-align:center;}", rules.length );
ss.insertRule(rT1 + "td.r, " + rT1 + "th.r { text-align:right;}" , rules.length );
</script>

# SketchUp 8 Constants

SketchUp defines constants, some are global, others are 'name-spaced'.
Many of them are not listed in the SketchUp.com help documentation.
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

<br/>
**2. Global Numeric Constants:**



**3. Global Object Constants:** 



## Namespaced Constants

### Sketchup::Face #classify_point

See [Face.classify_point]

```ruby
<< code_face_1 >>
```

<table class="gjl15"><thead>
<tr>
<th><br/>result return</th>
<th class="c">value<br/>(Fixnum)</th>
</tr>
</thead><tbody>
<tr>
<td>PointInside</td>
<td class="c">1</td>
</tr>
<tr>
<td>PointNotOnPlane</td>
<td class="c">32</td>
</tr>
<tr>
<td>PointOnEdge</td>
<td class="c">4</td>
</tr>
<tr>
<td>PointOnFace</td>
<td class="c">8</td>
</tr>
<tr>
<td>PointOnVertex</td>
<td class="c">2</td>
</tr>
<tr>
<td>PointOutside</td>
<td class="c">16</td>
</tr>
<tr>
<td>PointUnknown</td>
<td class="c">0</td>
</tr>
</tbody></table>
<br/>

### Sketchup::Model \#save \#save_copy

See [Model#save] and [Model#save_copy] methods

```ruby
# version param +2014, if omitted, saves in current version
status = model.save(filename, version)
status = model.save_copy(filename, version)
```

No constants Found!

### Sketchup::RenderingOptionsObserver

These constants are used with a [RenderingOptionsObserver] instance
(fqn Sketchup::RenderingOptionsObserver) and are tightly coupled to the 
[RenderingOptions] (fqn Sketchup::RenderingOptions) class.
 
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
# hash @@roc = RenderingOptions constants
#   key is constant value, value is constant name
@@roc = Hash.new("** No Constant! **")
cns = Sketchup::RenderingOptions

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
# create a RenderingOptionsObserver
@@obs_ro = Sketchup::RenderingOptionsObserver.new

def @@obs_ro.onRenderingOptionsChanged(ro, type)
  puts "#{type.to_s.rjust(3)}  #{@@roc[type]}"
end

# attach the observer
ro = Sketchup.active_model.rendering_options
ro.add_observer(@@obs_ro)

```

The above code does not make use of the constants, so the below code shows one
way of creating an observer.  The callback uses some constants (items in 'view' menu and
toolbar) in a case statement.  This code could be used in a plug-in.

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
  else "Option not caught by case statement"
  end
puts suffix
end
# attach it to the Rendering_options of the model
ro = Sketchup.active_model.rendering_options
ro.add_observer(obs_ro)

```

The following table lists [RenderingOptions] keys which fire callbacks in a
[RenderingOptionsObserver] [onRenderingOptionsChanged] callback.  As
mentioned, some keys generate more than one callback, and, any row with
'*** Missing, type =' in the 'Observer constant (type)' column fired a callback,
but there isn't a [RenderingOptions] constant with that value.

| RenderingOptions key     | RO value.class  | Observer constant (type)       |
|:-------------------------|:----------------|:-------------------------------|
| BackgroundColor          | Sketchup::Color | ROPSetBackgroundColor          |
| ConstructionColor        | Sketchup::Color | ROPSetConstructionColor        |
| DepthQueWidth            | Fixnum          | ROPSetDepthQueWidth            |
| DisplayColorByLayer      | Boolean         | ROPSetDisplayColorByLayer      |
| DisplayDims              | Boolean         | ROPSetDisplayDims              |
| DisplayFog               | Boolean         | ROPSetDisplayFog               |
| DisplayInstanceAxes      | Boolean         | ROPSetDisplayInstanceAxes      |
| DisplaySketchAxes        | Boolean         | ROPSetDisplaySketchAxes        |
| DisplayText              | Boolean         | ROPSetDisplayText              |
| DisplayWatermarks        | Boolean         | *** Missing, type = 54         |
| DrawDepthQue             | Boolean         | ROPSetDepthQueEdges            |
| DrawGround               | Boolean         | ROPSetDrawGround               |
| DrawHidden               | Boolean         | ROPDrawHidden                  |
| DrawHorizon              | Boolean         | ROPSetDrawHorizon              |
| DrawLineEnds             | Boolean         | ROPSetLineEndEdges             |
| DrawProfilesOnly         | Boolean         | ROPSetProfilesOnlyEdges        |
| DrawSilhouettes          | Boolean         | ROPSetProfileEdges             |
| DrawUnderground          | Boolean         | ROPSetDrawUnderground          |
| EdgeColorMode            | Fixnum          | ROPSetEdgeColorMode            |
| EdgeDisplayMode          | Fixnum          | ROPSetEdgeDisplayMode          |
| EdgeType                 | Fixnum          | ROPSetEdgeType                 |
| ExtendLines              | Boolean         | ROPSetExtendLines              |
| FaceBackColor            | Sketchup::Color | ROPSetFaceColor                |
| FaceColorMode            | Fixnum          | ROPSetFaceColorMode            |
| FaceFrontColor           | Sketchup::Color | ROPSetFaceColor                |
| FogColor                 | Sketchup::Color | ROPSetFogColor                 |
| FogEndDist               | Float           | ROPSetFogDist                  |
| FogStartDist             | Float           | ROPSetFogDist                  |
| FogUseBkColor            | Boolean         | ROPSetFogUseBkColor            |
| ForegroundColor          | Sketchup::Color | ROPSetForegroundColor          |
| GroundColor              | Sketchup::Color | ROPSetGroundColor              |
| GroundTransparency       | Fixnum          | ROPSetGroundTransparency       |
| HideConstructionGeometry | Boolean         | ROPSetHideConstructionGeometry |
| HighlightColor           | Sketchup::Color | ROPSetHighlightColor           |
| InactiveFade             | Float           | ROPEditComponent               |
| InactiveHidden           | Boolean         | ROPEditComponent               |
| InstanceFade             | Float           | ROPEditComponent               |
| InstanceHidden           | Boolean         | ROPEditComponent               |
| JitterEdges              | Boolean         | ROPSetJitterEdges              |
| LineEndWidth             | Fixnum          | ROPSetLineEndWidth             |
| LineExtension            | Fixnum          | ROPSetLineExtension            |
| LockedColor              | Sketchup::Color | ROPSetLockedColor              |
| MaterialTransparency     | Boolean         | ROPSetMaterialTransparency     |
| ModelTransparency        | Boolean         | ROPSetModelTransparency        |
| RenderMode               | Fixnum          | ROPSetEdgeDisplayMode          |
| RenderMode               | Fixnum          | ROPSetRenderMode               |
| SectionActiveColor       | Sketchup::Color | ROPSetSectionActiveColor       |
| SectionCutWidth          | Fixnum          | ROPSetSectionCutWidth          |
| SectionDefaultCutColor   | Sketchup::Color | ROPSetSectionDefaultCutColor   |
| SectionInactiveColor     | Sketchup::Color | ROPSetSectionInactiveColor     |
| SilhouetteWidth          | Fixnum          | ROPSetProfileWidth             |
| SkyColor                 | Sketchup::Color | ROPSetSkyColor                 |
| Texture                  | Boolean         | ROPSetTexture                  |
| TransparencySort         | Fixnum          | ROPTransparencySortMethod      |
<br/>

The following table lists [RenderingOptions] keys that do not fire the [onRenderingOptionsChanged] callback.

| RenderingOptions key | RO value.class  |
|:---------------------|:----------------|
| BandColor            | Sketchup::Color |
| HorizonColor         | Sketchup::Color |
| ShowViewName         | Boolean         |
<br/>

The following RenderingOptions constants are not fired by any keys in [RenderingOptions].  They may be returned for UI changes that do not have API control.

| Observer constant (type)   | value |
|:---------------------------|:-----:|
| ROPAssign                  | 0     |
| ROPSetExtendEdges          | 7     |
| ROPSetFogHint              | 24    |
| ROPSetSectionDisplayMode   | 25    |
| ROPSetTransparencyObsolete | 2     |
<br/>


### LENGTH:: 'Units' OptionsProvider

See [Model#options], [OptionsManager], [OptionsManager#&#91;&#93;] and [OptionsProvider].

These constants are used with the 'UnitsOptions'


The LENGTH:: constants are for use with the 'Units' [OptionsProvider].

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

om = Sketchup.active_model.options
op = om['UnitsOptions']
units =  h_units[  op['LengthUnit']   ]
format = h_format[ op['LengthFormat'] ]
puts "Current model units are #{units}"
puts "Current model format is #{format}"

```

| OptionsManager key | OptionsProvider key  | OptionsProvider value | class   |
|:-------------------|:---------------------|:---------------------:|:--------|
| PageOptions        | ShowTransition       | true                  | Boolean |
|                    | TransitionTime       | 2.0                   | Float   |
| PrintOptions       | ComputeSizeFromScale | false                 | Boolean |
|                    | FitToPage            | true                  | Boolean |
|                    | LineWeight           | 0.5                   | Float   |
|                    | ModelExtents         | true                  | Boolean |
|                    | NumberOfPages        | 1                     | Fixnum  |
|                    | PixelsPerInch        | 150.0                 | Float   |
|                    | PrintHeight          | 11.0                  | Float   |
|                    | PrintQuality         | 0                     | Fixnum  |
|                    | PrintWidth           | 8.5                   | Float   |
|                    | QualityAdjustment    | 1.0                   | Float   |
|                    | ScaleAdjustment      | 1.0                   | Float   |
|                    | SectionSlice         | false                 | Boolean |
|                    | SizeInModel          | 1.0                   | Float   |
|                    | SizeInPrint          | 1.0                   | Float   |
|                    | VectorMode           | false                 | Boolean |
| SlideshowOptions   | LoopSlideshow        | true                  | Boolean |
|                    | SlideTime            | 1.0                   | Float   |
| UnitsOptions       | AnglePrecision       | 1                     | Fixnum  |
|                    | AngleSnapEnabled     | true                  | Boolean |
|                    | ForceInchDisplay     | false                 | Boolean |
|                    | LengthFormat         | 1                     | Fixnum  |
|                    | LengthPrecision      | 4                     | Fixnum  |
|                    | LengthSnapEnabled    | true                  | Boolean |
|                    | LengthSnapLength     | 0.25                  | Float   |
|                    | LengthUnit           | 0                     | Fixnum  |
|                    | SnapAngle            | 15.0                  | Float   |
|                    | SuppressUnitsDisplay | false                 | Boolean |
<br/>
 

| constant name | value                 | class  |
|:--------------|:---------------------:|:-------|
| Architectural | 1                     | Fixnum |
| Centimeter    | 3                     | Fixnum |
| DIG           | 15                    | Fixnum |
| Decimal       | 0                     | Fixnum |
| EPSILON       | 2.22044604925031e-016 | Float  |
| Engineering   | 2                     | Fixnum |
| Feet          | 1                     | Fixnum |
| Fractional    | 3                     | Fixnum |
| Inches        | 0                     | Fixnum |
| MANT_DIG      | 53                    | Fixnum |
| MAX           | 1.79769313486232e+308 | Float  |
| MAX_10_EXP    | 308                   | Fixnum |
| MAX_EXP       | 1024                  | Fixnum |
| MIN           | 2.2250738585072e-308  | Float  |
| MIN_10_EXP    | -307                  | Fixnum |
| MIN_EXP       | -1021                 | Fixnum |
| Meter         | 4                     | Fixnum |
| Millimeter    | 2                     | Fixnum |
| RADIX         | 2                     | Fixnum |
| ROUNDS        | 1                     | Fixnum |
<br/>


## Global Object Constants

### Geometry Class constants

| constant name | value                             | class                |
|:--------------|:---------------------------------:|:---------------------|
| IDENTITY      | #<Geom::Transformation:0x486ffd4> | Geom::Transformation |
| ORIGIN        | (0", 0", 0")                      | Geom::Point3d        |
| X_AXIS        | (1.0, 0.0, 0.0)                   | Geom::Vector3d       |
| Y_AXIS        | (0.0, 1.0, 0.0)                   | Geom::Vector3d       |
| Z_AXIS        | (0.0, 0.0, 1.0)                   | Geom::Vector3d       |
<br/>


### Other object constants

<< other_object >>


## Global Numeric Constants

### Sketchup.send_action

```ruby
Sketchup.send_action(action)
```

This method allows for either a string or a number for its parameter.  Numbers are 
officially 'unsupported', and only available under Windows.  

The following code produces the same result

```ruby
result = Sketchup.send_action("selectArcTool:")
result = Sketchup.send_action(CMD_ARC)
```

See [Sketchup.send_action]. The following are constants that can be used in place of their numeric equivalents.

| action parameter text      | action parameter constant | constant value |
|:---------------------------|:--------------------------|:--------------:|
| addBuilding:               |                           |                |
| copy:                      | CMD_COPY                  | 57634          |
| cut:                       | CMD_CUT                   | 57635          |
| editHide:                  |                           |                |
| editRedo:                  | CMD_REDO                  | 57644          |
| editUndo:                  | CMD_UNDO                  | 57643          |
| editUnhide:                |                           |                |
| fixNonPlanarFaces:         |                           |                |
| getPhotoTexture:           |                           |                |
| openDocument:              | CMD_OPEN                  | 57601          |
| pageAdd:                   | CMD_PAGE_NEW              | 21067          |
| pageDelete:                | CMD_PAGE_DELETE           | 21078          |
| pageNext:                  | CMD_PAGE_NEXT             | 10535          |
| pagePrevious:              | CMD_PAGE_PREVIOUS         | 10536          |
| pageUpdate:                | CMD_PAGE_UPDATE           | 21068          |
| paste:                     | CMD_PASTE                 | 57637          |
| renderHiddenLine:          | CMD_HIDDENLINE            | 10511          |
| renderMonochrome:          |                           |                |
| renderShaded:              | CMD_SHADED                | 10512          |
| renderTextures:            | CMD_TEXTURED              | 10539          |
| renderWireframe:           | CMD_WIREFRAME             | 10510          |
| selectArc3PointPieTool:    |                           |                |
| selectArc3PointTool:       |                           |                |
| selectArcTool:             | CMD_ARC                   | 21065          |
| selectAxisTool:            |                           |                |
| selectCircleTool:          | CMD_CIRCLE                | 21096          |
| selectDimensionTool:       | CMD_DIMENSION             | 21410          |
| selectDollyTool:           | CMD_DOLLY                 | 10523          |
| selectEraseTool:           | CMD_ERASE                 | 21019          |
| selectExtrudeTool:         | CMD_EXTRUDE               | 21525          |
| selectFieldOfViewTool:     | CMD_DISPLAY_FOV           | 21494          |
| selectFreehandTool:        | CMD_FREEHAND              | 21031          |
| selectImageIglooTool:      |                           |                |
| selectLineTool:            | CMD_LINE                  | 21020          |
| selectMeasureTool:         | CMD_MEASURE               | 21024          |
| selectMoveTool:            | CMD_MOVE                  | 21048          |
| selectNorthTool:           |                           |                |
| selectOffsetTool:          | CMD_OFFSET                | 21100          |
| selectOrbitTool:           | CMD_ORBIT                 | 10508          |
| selectPaintTool:           | CMD_PAINT                 | 21074          |
| selectPolygonTool:         | CMD_POLYGON               | 21095          |
| selectPositionCameraTool:  | CMD_POSITION_CAMERA       | 21169          |
| selectProtractorTool:      | CMD_PROTRACTOR            | 21057          |
| selectPushPullTool:        | CMD_PUSHPULL              | 21041          |
| selectRectangle3PointTool: |                           |                |
| selectRectangleTool:       | CMD_RECTANGLE             | 21094          |
| selectRotateTool:          | CMD_ROTATE                | 21129          |
| selectScaleTool:           | CMD_SCALE                 | 21236          |
| selectSectionPlaneTool:    |                           |                |
| selectSelectionTool:       | CMD_SELECT                | 21022          |
| selectTextTool:            | CMD_TEXT                  | 21405          |
| selectTurnTool:            |                           |                |
| selectWalkTool:            | CMD_WALK                  | 10520          |
| selectZoomTool:            | CMD_ZOOM                  | 10509          |
| selectZoomWindowTool:      | CMD_ZOOM_WINDOW           | 10526          |
| showRubyPanel:             | CMD_RUBY_CONSOLE          | 21478          |
| viewBack:                  | CMD_VIEW_BACK             | 10505          |
| viewBottom:                | CMD_VIEW_BOTTOM           | 10506          |
| viewFront:                 | CMD_VIEW_FRONT            | 10502          |
| viewIso:                   | CMD_VIEW_ISO              | 10507          |
| viewLeft:                  | CMD_VIEW_LEFT             | 10504          |
| viewPerspective:           | CMD_VIEW_PERSPECTIVE      | 10519          |
| viewRight:                 | CMD_VIEW_RIGHT            | 10503          |
| viewShowAxes:              | CMD_SKETCHAXES            | 10522          |
| viewShowGuides:            | CMD_SHOWGUIDES            | 21980          |
| viewShowHidden:            | CMD_SHOWHIDDEN            | 21154          |
| viewTop:                   | CMD_VIEW_TOP              | 10501          |
| viewUndo:                  |                           |                |
| viewZoomExtents:           | CMD_ZOOM_EXTENTS          | 10527          |
| viewZoomToSelection:       | CMD_SELECTION_ZOOM_EXT    | 21469          |
<br/>


| Numeric Constant   | Numeric Value |
|:-------------------|:-------------:|
| CMD_CAMERA_UNDO    | 10529         |
| CMD_DELETE         | 21021         |
| CMD_DRAWCUTS       | 21348         |
| CMD_DRAWOUTLINES   | 21347         |
| CMD_MAKE_COMPONENT | 21083         |
| CMD_NEW            | 57600         |
| CMD_PAN            | 10525         |
| CMD_PRINT          | 57607         |
| CMD_SAVE           | 57603         |
| CMD_SECTION        | 21337         |
| CMD_SKETCHCS       | 21126         |
| CMD_TRANSPARENT    | 10513         |
<br/>


### Command \#set_validation_proc

See [Command#set_validation_proc].  The value returned by the block determines
the display state of a command, which can be a menu item, a toolbar button, or both.

| constant name | value (Fixnum) |
|:--------------|:--------------:|
| MF_CHECKED    | 8              |
| MF_DISABLED   | 2              |
| MF_ENABLED    | 0              |
| MF_GRAYED     | 1              |
| MF_UNCHECKED  | 0              |
<br/>


### Layer \#page_behavior

See [layer.page_behavior].  This attribute is a numeric, with somewhat confusing
documentation.  From the docs, 'The behaviour is composed of a combination of
these flags'.  So default visiblity is bit 0 ('HIDDEN' is set), why does 'NEW_PAGES'
have 'VISIBLE' setting bit 4 and 'HIDDEN' setting bit 5?  Seems that they should
be mutually exclusive.

```ruby
 layers = Sketchup.active_model.layers
 lyr_pb = layers[0].page_behavior
 puts lyr_pb[0]   # this is default visiblity
 puts lyr_pb[4]   # this new pages visible?
 puts lyr_pb[5]   # this new pages hidden?
```

| constant name                              | value (Fixnum) |
|:-------------------------------------------|:--------------:|
| LAYER_USES_DEFAULT_VISIBILITY_ON_NEW_PAGES | 0              |
| LAYER_VISIBLE_BY_DEFAULT                   | 0              |
| LAYER_HIDDEN_BY_DEFAULT                    | 1              |
| LAYER_IS_VISIBLE_ON_NEW_PAGES              | 16             |
| LAYER_IS_HIDDEN_ON_NEW_PAGES               | 32             |
<br/>


### TextureWriter \#write 

See [texturewriter#write]

```ruby
tw = Sketchup.create_texture_writer
status = tw.write(entity, side, filename)
```

| status return                  | value (Fixnum) |
|:-------------------------------|:--------------:|
| FILE_WRITE_FAILED_INVALID_TYPE | 1              |
| FILE_WRITE_FAILED_UNKNOWN      | 2              |
| FILE_WRITE_OK                  | 0              |
<br/>


### UI.messagebox

See [UI.messagebox].  `MB_MULTILINE` shows a dialog with a scrollable text area
and an 'Okay' button.

```ruby
status = UI.messagebox(message, type)
```
| type parameter      | value (Fixnum) |
|:--------------------|:--------------:|
| MB_ABORTRETRYIGNORE | 2              |
| MB_MULTILINE        | 16             |
| MB_OK               | 0              |
| MB_OKCANCEL         | 1              |
| MB_RETRYCANCEL      | 5              |
| MB_YESNO            | 4              |
| MB_YESNOCANCEL      | 3              |
<br/>

| status return | value (Fixnum) |
|:--------------|:--------------:|
| IDABORT       | 3              |
| IDCANCEL      | 2              |
| IDIGNORE      | 5              |
| IDNO          | 7              |
| IDOK          | 1              |
| IDRETRY       | 4              |
| IDYES         | 6              |
<br/>


### View \#draw   
     
See [View#draw]

```ruby
view = Sketchup.active_model.active_view
view.draw(mode, pts)
```

| mode parameter    | value (Fixnum) |
|:------------------|:--------------:|
| GL_LINES          | 1              |
| GL_LINE_LOOP      | 2              |
| GL_LINE_STRIP     | 3              |
| GL_POINTS         | 0              |
| GL_POLYGON        | 9              |
| GL_QUADS          | 7              |
| GL_QUAD_STRIP     | 8              |
| GL_TRIANGLES      | 4              |
| GL_TRIANGLE_FAN   | 6              |
| GL_TRIANGLE_STRIP | 5              |
<br/>


### RUBY_ Constants

The following are _RUBY constants which vary from version to version.

| constant name     | value        | class  |
|:------------------|:------------:|:-------|
| RUBY_PATCHLEVEL   | 287          | Fixnum |
| RUBY_PLATFORM     | i386-mswin32 | String |
| RUBY_RELEASE_DATE | 2008-08-11   | String |
| RUBY_VERSION      | 1.8.6        | String |
<br/>


## Depreciated Constants

<< depreciated_constants >>

## Yet to added to documentation

| constant name                           | value                          | class             |
|:----------------------------------------|:------------------------------:|:------------------|
| ALT_MODIFIER_KEY                        | 18                             | Fixnum            |
| ALT_MODIFIER_MASK                       | 32                             | Fixnum            |
| ALeaderModel                            | 2                              | Fixnum            |
| ALeaderNone                             | 0                              | Fixnum            |
| ALeaderView                             | 1                              | Fixnum            |
| CONSTRAIN_MODIFIER_KEY                  | 16                             | Fixnum            |
| CONSTRAIN_MODIFIER_MASK                 | 4                              | Fixnum            |
| COPY_MODIFIER_KEY                       | 17                             | Fixnum            |
| COPY_MODIFIER_MASK                      | 8                              | Fixnum            |
| DimensionArrowClosed                    | 3                              | Fixnum            |
| DimensionArrowDot                       | 2                              | Fixnum            |
| DimensionArrowNone                      | 0                              | Fixnum            |
| DimensionArrowOpen                      | 4                              | Fixnum            |
| DimensionArrowSlash                     | 1                              | Fixnum            |
| MK_ALT                                  | 32                             | Fixnum            |
| MK_COMMAND                              | 0                              | Fixnum            |
| MK_CONTROL                              | 8                              | Fixnum            |
| MK_LBUTTON                              | 1                              | Fixnum            |
| MK_MBUTTON                              | 16                             | Fixnum            |
| MK_RBUTTON                              | 2                              | Fixnum            |
| MK_SHIFT                                | 4                              | Fixnum            |
| PAGE_NO_CAMERA                          | 4094                           | Fixnum            |
| PAGE_USE_ALL                            | 4095                           | Fixnum            |
| PAGE_USE_CAMERA                         | 1                              | Fixnum            |
| PAGE_USE_HIDDEN                         | 16                             | Fixnum            |
| PAGE_USE_LAYER_VISIBILITY               | 32                             | Fixnum            |
| PAGE_USE_RENDERING_OPTIONS              | 2                              | Fixnum            |
| PAGE_USE_SECTION_PLANES                 | 64                             | Fixnum            |
| PAGE_USE_SHADOWINFO                     | 4                              | Fixnum            |
| PAGE_USE_SKETCHCS                       | 8                              | Fixnum            |
| PLATFORM                                | i386-mswin32                   | String            |
| RELEASE_DATE                            | 2008-08-11                     | String            |
| SB_PROMPT                               | 0                              | Fixnum            |
| SB_VCB_LABEL                            | 1                              | Fixnum            |
| SB_VCB_VALUE                            | 2                              | Fixnum            |
| SKETCHUP_CONSOLE                        | #<Sketchup::Console:0x486e97c> | Sketchup::Console |
| SnapTo_Arbitrary                        | 0                              | Fixnum            |
| SnapTo_Horizontal                       | 1                              | Fixnum            |
| SnapTo_Sloped                           | 3                              | Fixnum            |
| SnapTo_Vertical                         | 2                              | Fixnum            |
| TB_HIDDEN                               | 0                              | Fixnum            |
| TB_NEVER_SHOWN                          | -1                             | Fixnum            |
| TB_VISIBLE                              | 1                              | Fixnum            |
| TextAlignCenter                         | 1                              | Fixnum            |
| TextAlignLeft                           | 0                              | Fixnum            |
| TextAlignRight                          | 2                              | Fixnum            |
| VERSION                                 | 1.8.6                          | String            |
| VK_ALT                                  | 18                             | Fixnum            |
| VK_COMMAND                              | 18                             | Fixnum            |
| VK_CONTROL                              | 17                             | Fixnum            |
| VK_DELETE                               | 46                             | Fixnum            |
| VK_DOWN                                 | 40                             | Fixnum            |
| VK_END                                  | 35                             | Fixnum            |
| VK_HOME                                 | 36                             | Fixnum            |
| VK_INSERT                               | 45                             | Fixnum            |
| VK_LEFT                                 | 37                             | Fixnum            |
| VK_MENU                                 | 18                             | Fixnum            |
| VK_NEXT                                 | 34                             | Fixnum            |
| VK_PRIOR                                | 33                             | Fixnum            |
| VK_RIGHT                                | 39                             | Fixnum            |
| VK_SHIFT                                | 16                             | Fixnum            |
| VK_SPACE                                | 32                             | Fixnum            |
| VK_UP                                   | 38                             | Fixnum            |
| Sketchup::Importer::ImportCanceled      | 2                              | Fixnum            |
| Sketchup::Importer::ImportFail          | 1                              | Fixnum            |
| Sketchup::Importer::ImportFileNotFound  | 4                              | Fixnum            |
| Sketchup::Importer::ImportSuccess       | 0                              | Fixnum            |
| Sketchup::Importer::ImporterNotFound    | 3                              | Fixnum            |
| Sketchup::Pages::ImageEmbedded          | 0                              | Fixnum            |
| Sketchup::Pages::ImageEmbeddedAndLinked | 1                              | Fixnum            |
| Sketchup::Pages::ImageLinked            | 2                              | Fixnum            |
| Sketchup::Pages::UnitsNormalizedX       | 2                              | Fixnum            |
| Sketchup::Pages::UnitsNormalizedY       | 1                              | Fixnum            |
| Sketchup::Pages::UnitsPixels            | 0                              | Fixnum            |
<br/>

