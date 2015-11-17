# @title SketchUp Constants

SketchUp defines constants, some are global, others are 'name-spaced'.
Many of them are not listed in the SketchUp.com help documentation.
This list includes all constants.  All of the links in this reference refer back to SketchUp.com documents.
Thanks to Jim Foltz and others for their previous work and help.

## Namespaced Constants

### Sketchup::RenderingOptions

Haven't written this yet...

| RenderingOptions key       | RO value.class    | Observer constant                | Obs type   |
|:---------------------------|:------------------|:---------------------------------|:----------:|
| `BackgroundColor`          | `Sketchup::Color` | `ROPSetBackgroundColor`          | `12`       |
| `BandColor`                | `Sketchup::Color` | `* No Observer callback? *`      |            |
| `ConstructionColor`        | `Sketchup::Color` | `ROPSetConstructionColor`        | `15`       |
| `DepthQueWidth`            | `Fixnum`          | `ROPSetDepthQueWidth`            | `32`       |
| `DisplayColorByLayer`      | `FalseClass`      | `ROPSetDisplayColorByLayer`      | `16`       |
| `DisplayDims`              | `TrueClass`       | `ROPSetDisplayDims`              | `53`       |
| `DisplayFog`               | `FalseClass`      | `ROPSetDisplayFog`               | `19`       |
| `DisplayInstanceAxes`      | `FalseClass`      | `ROPSetDisplayInstanceAxes`      | `11`       |
| `DisplaySectionPlanes`     | `TrueClass`       | `* No Obs callback constant? *`  | `26`       |
| `DisplaySketchAxes`        | `TrueClass`       | `ROPSetDisplaySketchAxes`        | `36`       |
| `DisplayText`              | `TrueClass`       | `ROPSetDisplayText`              | `52`       |
| `DisplayWatermarks`        | `TrueClass`       | `* No Obs callback constant? *`  | `55`       |
| `DrawDepthQue`             | `FalseClass`      | `ROPSetDepthQueEdges`            | `30`       |
| `DrawGround`               | `FalseClass`      | `ROPSetDrawGround`               | `49`       |
| `DrawHidden`               | `FalseClass`      | `ROPDrawHidden`                  | `27`       |
| `DrawHorizon`              | `TrueClass`       | `ROPSetDrawHorizon`              | `48`       |
| `DrawLineEnds`             | `FalseClass`      | `ROPSetLineEndEdges`             | `31`       |
| `DrawProfilesOnly`         | `FalseClass`      | `ROPSetProfilesOnlyEdges`        | `34`       |
| `DrawSilhouettes`          | `TrueClass`       | `ROPSetProfileEdges`             | `8`        |
| `DrawUnderground`          | `TrueClass`       | `ROPSetDrawUnderground`          | `50`       |
| `EdgeColorMode`            | `Fixnum`          | `ROPSetEdgeColorMode`            | `5`        |
| `EdgeDisplayMode`          | `Fixnum`          | `ROPSetEdgeDisplayMode`          | `4`        |
| `EdgeType`                 | `Fixnum`          | `ROPSetEdgeType`                 | `38`       |
| `ExtendLines`              | `FalseClass`      | `ROPSetExtendLines`              | `17`       |
| `FaceBackColor`            | `Sketchup::Color` | `ROPSetFaceColor`                | `37`       |
| `FaceColorMode`            | `Fixnum`          | `ROPSetFaceColorMode`            | `10`       |
| `FaceFrontColor`           | `Sketchup::Color` | `ROPSetFaceColor`                | `37`       |
| `FogColor`                 | `Sketchup::Color` | `ROPSetFogColor`                 | `22`       |
| `FogEndDist`               | `Float`           | `ROPSetFogDist`                  | `23`       |
| `FogStartDist`             | `Float`           | `ROPSetFogDist`                  | `23`       |
| `FogUseBkColor`            | `TrueClass`       | `ROPSetFogUseBkColor`            | `54`       |
| `ForegroundColor`          | `Sketchup::Color` | `ROPSetForegroundColor`          | `13`       |
| `GroundColor`              | `Sketchup::Color` | `ROPSetGroundColor`              | `47`       |
| `GroundTransparency`       | `Fixnum`          | `ROPSetGroundTransparency`       | `51`       |
| `HideConstructionGeometry` | `FalseClass`      | `ROPSetHideConstructionGeometry` | `45`       |
| `HighlightColor`           | `Sketchup::Color` | `ROPSetHighlightColor`           | `14`       |
| `HorizonColor`             | `Sketchup::Color` | `* No Observer callback? *`      |            |
| `InactiveFade`             | `Float`           | `ROPEditComponent`               | `28`       |
| `InactiveHidden`           | `FalseClass`      | `ROPEditComponent`               | `28`       |
| `InstanceFade`             | `Float`           | `ROPEditComponent`               | `28`       |
| `InstanceHidden`           | `FalseClass`      | `ROPEditComponent`               | `28`       |
| `JitterEdges`              | `FalseClass`      | `ROPSetJitterEdges`              | `6`        |
| `LineEndWidth`             | `Fixnum`          | `ROPSetLineEndWidth`             | `33`       |
| `LineExtension`            | `Fixnum`          | `ROPSetLineExtension`            | `18`       |
| `LockedColor`              | `Sketchup::Color` | `ROPSetLockedColor`              | `35`       |
| `MaterialTransparency`     | `TrueClass`       | `ROPSetMaterialTransparency`     | `40`       |
| `ModelTransparency`        | `FalseClass`      | `ROPSetModelTransparency`        | `39`       |
| `RenderMode`               | `Fixnum`          | `ROPSetRenderMode`               | `1`        |
| `SectionActiveColor`       | `Sketchup::Color` | `ROPSetSectionActiveColor`       | `41`       |
| `SectionCutWidth`          | `Fixnum`          | `ROPSetSectionCutWidth`          | `44`       |
| `SectionDefaultCutColor`   | `Sketchup::Color` | `ROPSetSectionDefaultCutColor`   | `43`       |
| `SectionInactiveColor`     | `Sketchup::Color` | `ROPSetSectionInactiveColor`     | `42`       |
| `ShowViewName`             | `TrueClass`       | `* No Observer callback? *`      |            |
| `SilhouetteWidth`          | `Fixnum`          | `ROPSetProfileWidth`             | `9`        |
| `SkyColor`                 | `Sketchup::Color` | `ROPSetSkyColor`                 | `46`       |
| `Texture`                  | `TrueClass`       | `ROPSetTexture`                  | `3`        |
| `TransparencySort`         | `Fixnum`          | `ROPTransparencySortMethod`      | `29`       |



## Global Object Constants

### Geometry Class constants

<< geometry_class >>

### Other object constants

<< other_object >>


## Global Numeric Constants

### Sketchup.send_action(action)

This method allows for either a string or a number for its parameter.  Numbers are officially &#39;unsupported &#39;, and only available under Windows.  

The following code produces the same result

```ruby
result = Sketchup.send_action("selectArcTool:")
result = Sketchup.send_action(CMD_ARC)
```

The following are constants that can be used in place of their numeric equivalents.  See [Sketchup.send_action](http://www.sketchup.com/intl/en/developer/docs/ourdoc/sketchup#send_action).

<< send_action >> CMD_

### TextureWriter#write 

```ruby
tw = Sketchup.create_texture_writer
status = tw.write(entity, side, filename)
```
See [texturewriter.write ](http://www.sketchup.com/intl/en/developer/docs/ourdoc/texturewriter#write). status values --

<< texture_writer_write >>  FILE_WRITE_

### View.draw(mode, pts)

The following constants are used for mode.  See [View.draw](http://www.sketchup.com/intl/en/developer/docs/ourdoc/view#draw)


<< view_draw >> GL_

### UI.messagebox(message, type)

```ruby
status = UI.messagebox(message, type)
```

See [UI.messagebox](http://www.sketchup.com/intl/en/developer/docs/ourdoc/ui#messagebox).  The type parameter for this method is numeric.  ` MB_MULTILINE` shows a dialog with a scrollable text area and an \’Okay\’ button.
 
<< ui_mb_type >> MB_

status value is numeric.  Hitting the escape key is equivalent to the \’Cancel\’ button.

<< ui_mb_ret >> ID

### Layer#page_behavior, Layer#page_behavior=

This attribute is a numeric, with somewhat confusing documentation.  See [layer.page_behavior]( http://www.sketchup.com/intl/en/developer/docs/ourdoc/layer#page_behavior)

<< layer_page_behavior >> LAYER_

### Command#set_validation_proc

The value returned by the block determines the status of a command, which can be a menu item, a toolbar button, or both.  See [Command#set_validation_proc](http://www.sketchup.com/intl/en/developer/docs/ourdoc/command#set_validation_proc)

<< command_set_validation_proc >> MF_