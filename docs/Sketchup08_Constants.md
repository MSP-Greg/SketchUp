# @title SketchUp 8 Constants
[ro]:http://www.sketchup.com/intl/en/developer/docs/ourdoc/renderingoptions
[roo]:http://www.sketchup.com/intl/en/developer/docs/ourdoc/renderingoptionsobserver
[roc]:http://www.sketchup.com/intl/en/developer/docs/ourdoc/renderingoptionsobserver#onRenderingOptionsChanged
[model_save]:http://www.sketchup.com/intl/en/developer/docs/ourdoc/model
[model_save_c]:http://www.sketchup.com/intl/en/developer/docs/ourdoc/model

# SketchUp 8 Constants

SketchUp defines constants, some are global, others are 'name-spaced'.
Many of them are not listed in the SketchUp.com help documentation.
This list includes all constants.  All of the links in this reference refer back 
to SketchUp.com documents.  Thanks to Jim Foltz and others for their previous work 
and help.

## Namespaced Constants

### Sketchup::RenderingOptionsObserver

These constants are used with a [RenderingOptionsObserver][roo] instance
(fqn Sketchup::RenderingOptionsObserver) and are tightly coupled to the 
[RenderingOptions][ro] (fqn Sketchup::RenderingOptions) class.
 
A [RenderingOptions][ro] instance is essentially a Hash.  Its keys can be
enumerated, and setting their value will change the rendering options of the model.
The constants are used in a callback method in a [RenderingOptionsObserver][roo]
instance as a notification of rendering option changes by the user or other code.

The constants provide some information about the change.  Some notes -
* They do not map one-to-one to the [RenderingOptions][ro] keys.  Some changes
  will result in two callbacks firing.
* Some [RenderingOptions][ro] keys will fire a callback, but with no constant
  assigned to the type value.
* Some [RenderingOptions][ro] keys will not fire a callback.
* The constant values vary across SketchUp versions, so always use the constants,
  as opposed to an integer value.

The following code can either be pasted into the Ruby console or loaded via a file.
First, it lists all of the [RenderingOptions][ro] constants.
Secondly, it adds a [RenderingOptions][ro] to the current model.  The observer
outputs to the console the [onRenderingOptionsChanged][roc] callback's type
parameter and the constant associated with it.  It is not code designed for production.

Since all the constants are prefixed by 'ROPSet' or 'ROP', the code adds a few
spaces after the prefix. To 'remove' the code, just open another model, which
destroys all references to it.

```ruby
hsh = {}
Sketchup::RenderingOptions.constants.each { |c|
  n = c.to_s.dup
  if ( /^ROPSet/.match(n) )
    n.sub!(/^ROPSet/, 'ROPSet  ')
  elsif ( /^ROP/.match(n) )
    n.sub!(/^ROP/,    'ROP     ')
  end
  hsh[eval("Sketchup::RenderingOptions::#{c.to_s}")] = n
}
array = hsh.sort
array.each { |r| puts "#{r[0].to_s.rjust(3)}   #{r[1]}" }
obs_ro = Sketchup::RenderingOptionsObserver.new
obs_ro.class.module_eval { attr_accessor :___t }
obs_ro.___t = hsh
def obs_ro.onRenderingOptionsChanged(ro, type)
  ns_ro = ro.class
  str = type.to_s.rjust(3)
  if self.___t.key?(type)
    puts "#{self.___t[type].ljust(33)}#{type}"
  else
    puts "        ** No Constant!          #{type}"
  end
end
ro = Sketchup.active_model.rendering_options
ro.add_observer(obs_ro)
```

The above code does not make use of the constants, so the below code shows one
way of creating an observer.  The callback uses some constants (items in 'view' menu and
toolbar) in a case statement.  This code could be used in a plug-in.

```ruby
# create an observer
obs_ro = Sketchup::RenderingOptionsObserver.new
# add callback method
def obs_ro.onRenderingOptionsChanged(ro, type)
  ns_ro = ro.class
  case type
  when ns_ro::ROPSetRenderMode
    puts 'ROPSet  RenderMode'
  when ns_ro::ROPSetTexture
    puts 'ROPSet  Texture'
  when ns_ro::ROPSetModelTransparency
    puts 'ROPSet  ModelTransparency'
  when ns_ro::ROPDrawHidden
    puts 'ROP     DrawHidden'
  when ns_ro::ROPSetSectionDisplayMode
    puts 'ROPSet  SectionDisplayMode'
  when ns_ro::ROPSetDisplaySketchAxes
    puts 'ROPSet  DisplaySketchAxes'
  when ns_ro::ROPSetHideConstructionGeometry
    puts 'ROPSet  HideConstructionGeometry'
  end
end

# attach it to the Rendering_options of the model
ro = Sketchup.active_model.rendering_options
ro.add_observer(obs_ro)
```
The following table lists [RenderingOptions][ro] keys which fire callbacks in a
[RenderingOptionsObserver's][roo] [onRenderingOptionsChanged][roc] callback.  As
mentioned, some keys generate more than one callback, and, any row with
'*** Missing, type =' in the 'Observer constant (type)' column fired a callback,
but there isn't a [RenderingOptions][ro] constant with that value.

| RenderingOptions key       | RO value.class    | Observer constant (type)         |
|:---------------------------|:------------------|:---------------------------------|
| `BackgroundColor`          | `Sketchup::Color` | `ROPSetBackgroundColor`          |
| `ConstructionColor`        | `Sketchup::Color` | `ROPSetConstructionColor`        |
| `DepthQueWidth`            | `Fixnum`          | `ROPSetDepthQueWidth`            |
| `DisplayColorByLayer`      | `Boolean`         | `ROPSetDisplayColorByLayer`      |
| `DisplayDims`              | `Boolean`         | `ROPSetDisplayDims`              |
| `DisplayFog`               | `Boolean`         | `ROPSetDisplayFog`               |
| `DisplayInstanceAxes`      | `Boolean`         | `ROPSetDisplayInstanceAxes`      |
| `DisplaySketchAxes`        | `Boolean`         | `ROPSetDisplaySketchAxes`        |
| `DisplayText`              | `Boolean`         | `ROPSetDisplayText`              |
| `DisplayWatermarks`        | `Boolean`         | `*** Missing, type = 54`         |
| `DrawDepthQue`             | `Boolean`         | `ROPSetDepthQueEdges`            |
| `DrawGround`               | `Boolean`         | `ROPSetDrawGround`               |
| `DrawHidden`               | `Boolean`         | `ROPDrawHidden`                  |
| `DrawHorizon`              | `Boolean`         | `ROPSetDrawHorizon`              |
| `DrawLineEnds`             | `Boolean`         | `ROPSetLineEndEdges`             |
| `DrawProfilesOnly`         | `Boolean`         | `ROPSetProfilesOnlyEdges`        |
| `DrawSilhouettes`          | `Boolean`         | `ROPSetProfileEdges`             |
| `DrawUnderground`          | `Boolean`         | `ROPSetDrawUnderground`          |
| `EdgeColorMode`            | `Fixnum`          | `ROPSetEdgeColorMode`            |
| `EdgeDisplayMode`          | `Fixnum`          | `ROPSetEdgeDisplayMode`          |
| `EdgeType`                 | `Fixnum`          | `ROPSetEdgeType`                 |
| `ExtendLines`              | `Boolean`         | `ROPSetExtendLines`              |
| `FaceBackColor`            | `Sketchup::Color` | `ROPSetFaceColor`                |
| `FaceColorMode`            | `Fixnum`          | `ROPSetFaceColorMode`            |
| `FaceFrontColor`           | `Sketchup::Color` | `ROPSetFaceColor`                |
| `FogColor`                 | `Sketchup::Color` | `ROPSetFogColor`                 |
| `FogEndDist`               | `Float`           | `ROPSetFogDist`                  |
| `FogStartDist`             | `Float`           | `ROPSetFogDist`                  |
| `FogUseBkColor`            | `Boolean`         | `ROPSetFogUseBkColor`            |
| `ForegroundColor`          | `Sketchup::Color` | `ROPSetForegroundColor`          |
| `GroundColor`              | `Sketchup::Color` | `ROPSetGroundColor`              |
| `GroundTransparency`       | `Fixnum`          | `ROPSetGroundTransparency`       |
| `HideConstructionGeometry` | `Boolean`         | `ROPSetHideConstructionGeometry` |
| `HighlightColor`           | `Sketchup::Color` | `ROPSetHighlightColor`           |
| `InactiveFade`             | `Float`           | `ROPEditComponent`               |
| `InactiveHidden`           | `Boolean`         | `ROPEditComponent`               |
| `InstanceFade`             | `Float`           | `ROPEditComponent`               |
| `InstanceHidden`           | `Boolean`         | `ROPEditComponent`               |
| `JitterEdges`              | `Boolean`         | `ROPSetJitterEdges`              |
| `LineEndWidth`             | `Fixnum`          | `ROPSetLineEndWidth`             |
| `LineExtension`            | `Fixnum`          | `ROPSetLineExtension`            |
| `LockedColor`              | `Sketchup::Color` | `ROPSetLockedColor`              |
| `MaterialTransparency`     | `Boolean`         | `ROPSetMaterialTransparency`     |
| `ModelTransparency`        | `Boolean`         | `ROPSetModelTransparency`        |
| `RenderMode`               | `Fixnum`          | `ROPSetEdgeDisplayMode`          |
| `RenderMode`               | `Fixnum`          | `ROPSetRenderMode`               |
| `SectionActiveColor`       | `Sketchup::Color` | `ROPSetSectionActiveColor`       |
| `SectionCutWidth`          | `Fixnum`          | `ROPSetSectionCutWidth`          |
| `SectionDefaultCutColor`   | `Sketchup::Color` | `ROPSetSectionDefaultCutColor`   |
| `SectionInactiveColor`     | `Sketchup::Color` | `ROPSetSectionInactiveColor`     |
| `SilhouetteWidth`          | `Fixnum`          | `ROPSetProfileWidth`             |
| `SkyColor`                 | `Sketchup::Color` | `ROPSetSkyColor`                 |
| `Texture`                  | `Boolean`         | `ROPSetTexture`                  |
| `TransparencySort`         | `Fixnum`          | `ROPTransparencySortMethod`      |
<br/>


The following table lists [RenderingOptions][ro] keys that do not fire 
          [RenderingOptionsObserver's][roo] [onRenderingOptionsChanged][roc] callbacks.
          

| RenderingOptions key   | RO value.class    |
|:-----------------------|:------------------|
| `BandColor`            | `Sketchup::Color` |
| `HorizonColor`         | `Sketchup::Color` |
| `ShowViewName`         | `Boolean`         |
<br/>


### Sketchup::Model

The constants are used for the version parameter in [Model.save][model_save] and
[Model.save_copy][model_save_c] methods

```ruby
# version param +2014, if omitted, saves in current version
status = model.save(filename, version)
status = model.save_copy(filename, version)
```

| Constant Name                   | Value   | Class    |
|:--------------------------------|:-------:|:---------|
| `Sketchup::Model::VERSION_3`    | `3`     | `Fixnum` |
| `Sketchup::Model::VERSION_4`    | `4`     | `Fixnum` |
| `Sketchup::Model::VERSION_5`    | `5`     | `Fixnum` |
| `Sketchup::Model::VERSION_6`    | `6`     | `Fixnum` |
| `Sketchup::Model::VERSION_7`    | `7`     | `Fixnum` |
| `Sketchup::Model::VERSION_8`    | `8`     | `Fixnum` |
| `Sketchup::Model::VERSION_2013` | `9`     | `Fixnum` |
| `Sketchup::Model::VERSION_2014` | `10`    | `Fixnum` |
<br/>


## Global Object Constants

### Geometry Class constants

| Constant Name   | Value                               | Class                  |
|:----------------|:-----------------------------------:|:-----------------------|
| `IDENTITY`      | `#<Geom::Transformation:0xd82f220>` | `Geom::Transformation` |
| `ORIGIN`        | `(0", 0", 0")`                      | `Geom::Point3d`        |
| `X_AXIS`        | `(1.0, 0.0, 0.0)`                   | `Geom::Vector3d`       |
| `Y_AXIS`        | `(0.0, 1.0, 0.0)`                   | `Geom::Vector3d`       |
| `Z_AXIS`        | `(0.0, 0.0, 1.0)`                   | `Geom::Vector3d`       |
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

See [Sketchup.send_action]
(http://www.sketchup.com/intl/en/developer/docs/ourdoc/sketchup#send_action).
The following are constants that can be used in place of their numeric equivalents.


| Constant Name            | Value   | Class    |
|:-------------------------|:-------:|:---------|
| `CMD_ARC`                | `21065` | `Fixnum` |
| `CMD_CAMERA_UNDO`        | `10529` | `Fixnum` |
| `CMD_CIRCLE`             | `21096` | `Fixnum` |
| `CMD_COPY`               | `57634` | `Fixnum` |
| `CMD_CUT`                | `57635` | `Fixnum` |
| `CMD_DELETE`             | `21021` | `Fixnum` |
| `CMD_DIMENSION`          | `21410` | `Fixnum` |
| `CMD_DISPLAY_FOV`        | `21494` | `Fixnum` |
| `CMD_DOLLY`              | `10523` | `Fixnum` |
| `CMD_DRAWCUTS`           | `21348` | `Fixnum` |
| `CMD_DRAWOUTLINES`       | `21347` | `Fixnum` |
| `CMD_ERASE`              | `21019` | `Fixnum` |
| `CMD_EXTRUDE`            | `21525` | `Fixnum` |
| `CMD_FREEHAND`           | `21031` | `Fixnum` |
| `CMD_HIDDENLINE`         | `10511` | `Fixnum` |
| `CMD_LINE`               | `21020` | `Fixnum` |
| `CMD_MAKE_COMPONENT`     | `21083` | `Fixnum` |
| `CMD_MEASURE`            | `21024` | `Fixnum` |
| `CMD_MOVE`               | `21048` | `Fixnum` |
| `CMD_NEW`                | `57600` | `Fixnum` |
| `CMD_OFFSET`             | `21100` | `Fixnum` |
| `CMD_OPEN`               | `57601` | `Fixnum` |
| `CMD_ORBIT`              | `10508` | `Fixnum` |
| `CMD_PAGE_DELETE`        | `21078` | `Fixnum` |
| `CMD_PAGE_NEW`           | `21067` | `Fixnum` |
| `CMD_PAGE_NEXT`          | `10535` | `Fixnum` |
| `CMD_PAGE_PREVIOUS`      | `10536` | `Fixnum` |
| `CMD_PAGE_UPDATE`        | `21068` | `Fixnum` |
| `CMD_PAINT`              | `21074` | `Fixnum` |
| `CMD_PAN`                | `10525` | `Fixnum` |
| `CMD_PASTE`              | `57637` | `Fixnum` |
| `CMD_POLYGON`            | `21095` | `Fixnum` |
| `CMD_POSITION_CAMERA`    | `21169` | `Fixnum` |
| `CMD_PRINT`              | `57607` | `Fixnum` |
| `CMD_PROTRACTOR`         | `21057` | `Fixnum` |
| `CMD_PUSHPULL`           | `21041` | `Fixnum` |
| `CMD_RECTANGLE`          | `21094` | `Fixnum` |
| `CMD_REDO`               | `57644` | `Fixnum` |
| `CMD_ROTATE`             | `21129` | `Fixnum` |
| `CMD_RUBY_CONSOLE`       | `21478` | `Fixnum` |
| `CMD_SAVE`               | `57603` | `Fixnum` |
| `CMD_SCALE`              | `21236` | `Fixnum` |
| `CMD_SECTION`            | `21337` | `Fixnum` |
| `CMD_SELECT`             | `21022` | `Fixnum` |
| `CMD_SELECTION_ZOOM_EXT` | `21469` | `Fixnum` |
| `CMD_SHADED`             | `10512` | `Fixnum` |
| `CMD_SHOWGUIDES`         | `21980` | `Fixnum` |
| `CMD_SHOWHIDDEN`         | `21154` | `Fixnum` |
| `CMD_SKETCHAXES`         | `10522` | `Fixnum` |
| `CMD_SKETCHCS`           | `21126` | `Fixnum` |
| `CMD_TEXT`               | `21405` | `Fixnum` |
| `CMD_TEXTURED`           | `10539` | `Fixnum` |
| `CMD_TRANSPARENT`        | `10513` | `Fixnum` |
| `CMD_UNDO`               | `57643` | `Fixnum` |
| `CMD_VIEW_BACK`          | `10505` | `Fixnum` |
| `CMD_VIEW_BOTTOM`        | `10506` | `Fixnum` |
| `CMD_VIEW_FRONT`         | `10502` | `Fixnum` |
| `CMD_VIEW_ISO`           | `10507` | `Fixnum` |
| `CMD_VIEW_LEFT`          | `10504` | `Fixnum` |
| `CMD_VIEW_PERSPECTIVE`   | `10519` | `Fixnum` |
| `CMD_VIEW_RIGHT`         | `10503` | `Fixnum` |
| `CMD_VIEW_TOP`           | `10501` | `Fixnum` |
| `CMD_WALK`               | `10520` | `Fixnum` |
| `CMD_WIREFRAME`          | `10510` | `Fixnum` |
| `CMD_ZOOM`               | `10509` | `Fixnum` |
| `CMD_ZOOM_EXTENTS`       | `10527` | `Fixnum` |
| `CMD_ZOOM_WINDOW`        | `10526` | `Fixnum` |
<br/>


### TextureWriter #write 

```ruby
tw = Sketchup.create_texture_writer
status = tw.write(entity, side, filename)
```
See [texturewriter#write]
(http://www.sketchup.com/intl/en/developer/docs/ourdoc/texturewriter#write).
Status values --

| Constant Name                    | Value   | Class    |
|:---------------------------------|:-------:|:---------|
| `FILE_WRITE_FAILED_INVALID_TYPE` | `1`     | `Fixnum` |
| `FILE_WRITE_FAILED_UNKNOWN`      | `2`     | `Fixnum` |
| `FILE_WRITE_OK`                  | `0`     | `Fixnum` |
<br/>


### View #draw

```ruby
view = Sketchup.active_model.active_view
view.draw(mode, pts)
```
See [View#draw]
(http://www.sketchup.com/intl/en/developer/docs/ourdoc/view#draw)
The following constants are used for mode.


| Constant Name       | Value   | Class    |
|:--------------------|:-------:|:---------|
| `GL_LINES`          | `1`     | `Fixnum` |
| `GL_LINE_LOOP`      | `2`     | `Fixnum` |
| `GL_LINE_STRIP`     | `3`     | `Fixnum` |
| `GL_POINTS`         | `0`     | `Fixnum` |
| `GL_POLYGON`        | `9`     | `Fixnum` |
| `GL_QUADS`          | `7`     | `Fixnum` |
| `GL_QUAD_STRIP`     | `8`     | `Fixnum` |
| `GL_TRIANGLES`      | `4`     | `Fixnum` |
| `GL_TRIANGLE_FAN`   | `6`     | `Fixnum` |
| `GL_TRIANGLE_STRIP` | `5`     | `Fixnum` |
<br/>


### UI.messagebox

```ruby
status = UI.messagebox(message, type)
```

See [UI.messagebox]
(http://www.sketchup.com/intl/en/developer/docs/ourdoc/ui#messagebox). 
The type parameter for this method is numeric.  
`MB_MULTILINE` shows a dialog with a scrollable text area and an &#39;Okay&#39; button.
 
| Constant Name         | Value   | Class    |
|:----------------------|:-------:|:---------|
| `MB_ABORTRETRYIGNORE` | `2`     | `Fixnum` |
| `MB_MULTILINE`        | `16`    | `Fixnum` |
| `MB_OK`               | `0`     | `Fixnum` |
| `MB_OKCANCEL`         | `1`     | `Fixnum` |
| `MB_RETRYCANCEL`      | `5`     | `Fixnum` |
| `MB_YESNO`            | `4`     | `Fixnum` |
| `MB_YESNOCANCEL`      | `3`     | `Fixnum` |
<br/>


status value is numeric.  Hitting the escape key is equivalent to the \’Cancel\’ button.

| Constant Name   | Value   | Class    |
|:----------------|:-------:|:---------|
| `IDABORT`       | `3`     | `Fixnum` |
| `IDCANCEL`      | `2`     | `Fixnum` |
| `IDIGNORE`      | `5`     | `Fixnum` |
| `IDNO`          | `7`     | `Fixnum` |
| `IDOK`          | `1`     | `Fixnum` |
| `IDRETRY`       | `4`     | `Fixnum` |
| `IDYES`         | `6`     | `Fixnum` |
<br/>


### Layer attr page_behavior

This attribute is a numeric, with somewhat confusing documentation.  See [layer.page_behavior]( http://www.sketchup.com/intl/en/developer/docs/ourdoc/layer#page_behavior)

<< layer_page_behavior >>

### Command #set_validation_proc

The value returned by the block determines the display state of a command, which can be a menu item, a toolbar button, or both.
See [Command#set_validation_proc]
(http://www.sketchup.com/intl/en/developer/docs/ourdoc/command#set_validation_proc)

| Constant Name   | Value   | Class    |
|:----------------|:-------:|:---------|
| `MF_CHECKED`    | `8`     | `Fixnum` |
| `MF_DISABLED`   | `2`     | `Fixnum` |
| `MF_ENABLED`    | `0`     | `Fixnum` |
| `MF_GRAYED`     | `1`     | `Fixnum` |
| `MF_UNCHECKED`  | `0`     | `Fixnum` |
<br/>


## Depreciated Constants

<< depreciated_constants >>

## yet to added to documentation

| Constant Name                                            | Value                                               | Class               |
|:---------------------------------------------------------|:---------------------------------------------------:|:--------------------|
| `ALT_MODIFIER_KEY`                                       | `18`                                                | `Fixnum`            |
| `ALT_MODIFIER_MASK`                                      | `32`                                                | `Fixnum`            |
| `ALeaderModel`                                           | `2`                                                 | `Fixnum`            |
| `ALeaderNone`                                            | `0`                                                 | `Fixnum`            |
| `ALeaderView`                                            | `1`                                                 | `Fixnum`            |
| `CONSTRAIN_MODIFIER_KEY`                                 | `16`                                                | `Fixnum`            |
| `CONSTRAIN_MODIFIER_MASK`                                | `4`                                                 | `Fixnum`            |
| `COPY_MODIFIER_KEY`                                      | `17`                                                | `Fixnum`            |
| `COPY_MODIFIER_MASK`                                     | `8`                                                 | `Fixnum`            |
| `DimensionArrowClosed`                                   | `3`                                                 | `Fixnum`            |
| `DimensionArrowDot`                                      | `2`                                                 | `Fixnum`            |
| `DimensionArrowNone`                                     | `0`                                                 | `Fixnum`            |
| `DimensionArrowOpen`                                     | `4`                                                 | `Fixnum`            |
| `DimensionArrowSlash`                                    | `1`                                                 | `Fixnum`            |
| `MK_ALT`                                                 | `32`                                                | `Fixnum`            |
| `MK_COMMAND`                                             | `0`                                                 | `Fixnum`            |
| `MK_CONTROL`                                             | `8`                                                 | `Fixnum`            |
| `MK_LBUTTON`                                             | `1`                                                 | `Fixnum`            |
| `MK_MBUTTON`                                             | `16`                                                | `Fixnum`            |
| `MK_RBUTTON`                                             | `2`                                                 | `Fixnum`            |
| `MK_SHIFT`                                               | `4`                                                 | `Fixnum`            |
| `PAGE_NO_CAMERA`                                         | `4094`                                              | `Fixnum`            |
| `PAGE_USE_ALL`                                           | `4095`                                              | `Fixnum`            |
| `PAGE_USE_CAMERA`                                        | `1`                                                 | `Fixnum`            |
| `PAGE_USE_HIDDEN`                                        | `16`                                                | `Fixnum`            |
| `PAGE_USE_LAYER_VISIBILITY`                              | `32`                                                | `Fixnum`            |
| `PAGE_USE_RENDERING_OPTIONS`                             | `2`                                                 | `Fixnum`            |
| `PAGE_USE_SECTION_PLANES`                                | `64`                                                | `Fixnum`            |
| `PAGE_USE_SHADOWINFO`                                    | `4`                                                 | `Fixnum`            |
| `PAGE_USE_SKETCHCS`                                      | `8`                                                 | `Fixnum`            |
| `RUBY_COPYRIGHT`                                         | `ruby - Copyright (C) 1993-2013 Yukihiro Matsumoto` | `String`            |
| `RUBY_DESCRIPTION`                                       | `ruby 2.0.0p247 (2013-06-27) [i386-mingw32]`        | `String`            |
| `RUBY_ENGINE`                                            | `ruby`                                              | `String`            |
| `RUBY_PATCHLEVEL`                                        | `247`                                               | `Fixnum`            |
| `RUBY_PLATFORM`                                          | `i386-mingw32`                                      | `String`            |
| `RUBY_RELEASE_DATE`                                      | `2013-06-27`                                        | `String`            |
| `RUBY_REVISION`                                          | `0`                                                 | `Fixnum`            |
| `RUBY_VERSION`                                           | `2.0.0`                                             | `String`            |
| `SB_PROMPT`                                              | `0`                                                 | `Fixnum`            |
| `SB_VCB_LABEL`                                           | `1`                                                 | `Fixnum`            |
| `SB_VCB_VALUE`                                           | `2`                                                 | `Fixnum`            |
| `SKETCHUP_CONSOLE`                                       | `#<Sketchup::Console:0xd82e5d8>`                    | `Sketchup::Console` |
| `SnapTo_Arbitrary`                                       | `0`                                                 | `Fixnum`            |
| `SnapTo_Horizontal`                                      | `1`                                                 | `Fixnum`            |
| `SnapTo_Sloped`                                          | `3`                                                 | `Fixnum`            |
| `SnapTo_Vertical`                                        | `2`                                                 | `Fixnum`            |
| `TB_HIDDEN`                                              | `0`                                                 | `Fixnum`            |
| `TB_NEVER_SHOWN`                                         | `-1`                                                | `Fixnum`            |
| `TB_VISIBLE`                                             | `1`                                                 | `Fixnum`            |
| `TextAlignCenter`                                        | `1`                                                 | `Fixnum`            |
| `TextAlignLeft`                                          | `0`                                                 | `Fixnum`            |
| `TextAlignRight`                                         | `2`                                                 | `Fixnum`            |
| `VK_ALT`                                                 | `18`                                                | `Fixnum`            |
| `VK_COMMAND`                                             | `18`                                                | `Fixnum`            |
| `VK_CONTROL`                                             | `17`                                                | `Fixnum`            |
| `VK_DELETE`                                              | `46`                                                | `Fixnum`            |
| `VK_DOWN`                                                | `40`                                                | `Fixnum`            |
| `VK_END`                                                 | `35`                                                | `Fixnum`            |
| `VK_HOME`                                                | `36`                                                | `Fixnum`            |
| `VK_INSERT`                                              | `45`                                                | `Fixnum`            |
| `VK_LEFT`                                                | `37`                                                | `Fixnum`            |
| `VK_MENU`                                                | `18`                                                | `Fixnum`            |
| `VK_NEXT`                                                | `34`                                                | `Fixnum`            |
| `VK_PRIOR`                                               | `33`                                                | `Fixnum`            |
| `VK_RIGHT`                                               | `39`                                                | `Fixnum`            |
| `VK_SHIFT`                                               | `16`                                                | `Fixnum`            |
| `VK_SPACE`                                               | `32`                                                | `Fixnum`            |
| `VK_UP`                                                  | `38`                                                | `Fixnum`            |
| `Sketchup::Dimension::ARROW_CLOSED`                      | `3`                                                 | `Fixnum`            |
| `Sketchup::Dimension::ARROW_DOT`                         | `2`                                                 | `Fixnum`            |
| `Sketchup::Dimension::ARROW_NONE`                        | `0`                                                 | `Fixnum`            |
| `Sketchup::Dimension::ARROW_OPEN`                        | `4`                                                 | `Fixnum`            |
| `Sketchup::Dimension::ARROW_SLASH`                       | `1`                                                 | `Fixnum`            |
| `Sketchup::DimensionLinear::ALIGNED_TEXT_ABOVE`          | `0`                                                 | `Fixnum`            |
| `Sketchup::DimensionLinear::ALIGNED_TEXT_CENTER`         | `1`                                                 | `Fixnum`            |
| `Sketchup::DimensionLinear::ALIGNED_TEXT_OUTSIDE`        | `2`                                                 | `Fixnum`            |
| `Sketchup::DimensionLinear::ARROW_CLOSED`                | `3`                                                 | `Fixnum`            |
| `Sketchup::DimensionLinear::ARROW_DOT`                   | `2`                                                 | `Fixnum`            |
| `Sketchup::DimensionLinear::ARROW_NONE`                  | `0`                                                 | `Fixnum`            |
| `Sketchup::DimensionLinear::ARROW_OPEN`                  | `4`                                                 | `Fixnum`            |
| `Sketchup::DimensionLinear::ARROW_SLASH`                 | `1`                                                 | `Fixnum`            |
| `Sketchup::DimensionLinear::TEXT_CENTERED`               | `1`                                                 | `Fixnum`            |
| `Sketchup::DimensionLinear::TEXT_OUTSIDE_END`            | `2`                                                 | `Fixnum`            |
| `Sketchup::DimensionLinear::TEXT_OUTSIDE_START`          | `0`                                                 | `Fixnum`            |
| `Sketchup::DimensionRadial::ARROW_CLOSED`                | `3`                                                 | `Fixnum`            |
| `Sketchup::DimensionRadial::ARROW_DOT`                   | `2`                                                 | `Fixnum`            |
| `Sketchup::DimensionRadial::ARROW_NONE`                  | `0`                                                 | `Fixnum`            |
| `Sketchup::DimensionRadial::ARROW_OPEN`                  | `4`                                                 | `Fixnum`            |
| `Sketchup::DimensionRadial::ARROW_SLASH`                 | `1`                                                 | `Fixnum`            |
| `Sketchup::Face::PointInside`                            | `1`                                                 | `Fixnum`            |
| `Sketchup::Face::PointNotOnPlane`                        | `32`                                                | `Fixnum`            |
| `Sketchup::Face::PointOnEdge`                            | `4`                                                 | `Fixnum`            |
| `Sketchup::Face::PointOnFace`                            | `8`                                                 | `Fixnum`            |
| `Sketchup::Face::PointOnVertex`                          | `2`                                                 | `Fixnum`            |
| `Sketchup::Face::PointOutside`                           | `16`                                                | `Fixnum`            |
| `Sketchup::Face::PointUnknown`                           | `0`                                                 | `Fixnum`            |
| `Sketchup::Importer::ImportCanceled`                     | `2`                                                 | `Fixnum`            |
| `Sketchup::Importer::ImportFail`                         | `1`                                                 | `Fixnum`            |
| `Sketchup::Importer::ImportFileNotFound`                 | `4`                                                 | `Fixnum`            |
| `Sketchup::Importer::ImportSuccess`                      | `0`                                                 | `Fixnum`            |
| `Sketchup::Importer::ImporterNotFound`                   | `3`                                                 | `Fixnum`            |
| `Sketchup::Pages::ImageEmbedded`                         | `0`                                                 | `Fixnum`            |
| `Sketchup::Pages::ImageEmbeddedAndLinked`                | `1`                                                 | `Fixnum`            |
| `Sketchup::Pages::ImageLinked`                           | `2`                                                 | `Fixnum`            |
| `Sketchup::Pages::UnitsNormalizedX`                      | `2`                                                 | `Fixnum`            |
| `Sketchup::Pages::UnitsNormalizedY`                      | `1`                                                 | `Fixnum`            |
| `Sketchup::Pages::UnitsPixels`                           | `0`                                                 | `Fixnum`            |
| `Sketchup::RenderingOptions::ROPAssign`                  | `0`                                                 | `Fixnum`            |
| `Sketchup::RenderingOptions::ROPSetExtendEdges`          | `7`                                                 | `Fixnum`            |
| `Sketchup::RenderingOptions::ROPSetFogHint`              | `24`                                                | `Fixnum`            |
| `Sketchup::RenderingOptions::ROPSetSectionDisplayMode`   | `25`                                                | `Fixnum`            |
| `Sketchup::RenderingOptions::ROPSetTransparencyObsolete` | `2`                                                 | `Fixnum`            |
| `Geom::PolygonMesh::AUTO_SOFTEN`                         | `4`                                                 | `Fixnum`            |
| `Geom::PolygonMesh::HIDE_BASED_ON_INDEX`                 | `1`                                                 | `Fixnum`            |
| `Geom::PolygonMesh::NO_SMOOTH_OR_HIDE`                   | `0`                                                 | `Fixnum`            |
| `Geom::PolygonMesh::SMOOTH_SOFT_EDGES`                   | `8`                                                 | `Fixnum`            |
| `Geom::PolygonMesh::SOFTEN_BASED_ON_INDEX`               | `2`                                                 | `Fixnum`            |
| `Length::Architectural`                                  | `1`                                                 | `Fixnum`            |
| `Length::Centimeter`                                     | `3`                                                 | `Fixnum`            |
| `Length::DIG`                                            | `15`                                                | `Fixnum`            |
| `Length::Decimal`                                        | `0`                                                 | `Fixnum`            |
| `Length::EPSILON`                                        | `2.220446049250313e-16`                             | `Float`             |
| `Length::Engineering`                                    | `2`                                                 | `Fixnum`            |
| `Length::Feet`                                           | `1`                                                 | `Fixnum`            |
| `Length::Fractional`                                     | `3`                                                 | `Fixnum`            |
| `Length::INFINITY`                                       | `Infinity`                                          | `Float`             |
| `Length::Inches`                                         | `0`                                                 | `Fixnum`            |
| `Length::MANT_DIG`                                       | `53`                                                | `Fixnum`            |
| `Length::MAX`                                            | `1.7976931348623157e+308`                           | `Float`             |
| `Length::MAX_10_EXP`                                     | `308`                                               | `Fixnum`            |
| `Length::MAX_EXP`                                        | `1024`                                              | `Fixnum`            |
| `Length::MIN`                                            | `2.2250738585072014e-308`                           | `Float`             |
| `Length::MIN_10_EXP`                                     | `-307`                                              | `Fixnum`            |
| `Length::MIN_EXP`                                        | `-1021`                                             | `Fixnum`            |
| `Length::Meter`                                          | `4`                                                 | `Fixnum`            |
| `Length::Millimeter`                                     | `2`                                                 | `Fixnum`            |
| `Length::NAN`                                            | `NaN`                                               | `Float`             |
| `Length::RADIX`                                          | `2`                                                 | `Fixnum`            |
| `Length::ROUNDS`                                         | `1`                                                 | `Fixnum`            |
<br/>

