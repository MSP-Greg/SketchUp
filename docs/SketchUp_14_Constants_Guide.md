# @title 2014 Constants Guide
[SUMD_Guide]:../../SUMD_Guide
[template_code.rb]:../../SUMD_TC
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
<style scoped>
#filecontents p code { font-size:16px; }
\#filecontents table.sumd { border:none; border-collapse:collapse; margin-bottom:2em; line-height:1.6em;}
\#filecontents table.sumd thead { background-color:transparent;}
\#filecontents table.sumd tr    { background-color:transparent; border:none; }
\#filecontents table.sumd th   { border:none; border-bottom:2px solid #aaa; padding: 0em; background-color:transparent; text-align:left;}
\#filecontents table.sumd th.b { border:none; padding: 0em; background-color:transparent; }
\#filecontents table.sumd tr.e  td   { padding-top:0.8em; }
\#filecontents table.sumd tr.t  td   { padding-top:0.2em; }
\#filecontents table.sumd tr.b2 td   { padding-top:0.2em; border-top: 2px solid #bbb; }
\#filecontents table.sumd tr.b1 td   { padding-top:0.2em; border-top: 1px solid #bbb; }
\#filecontents table.sumd tr.b1 td.b { padding-top:0.2em; border-top: none; }
\#filecontents table.sumd td { border:none; padding: 0em; background-color:transparent;}
\#filecontents table.sumd td.c, #filecontents table.sumd th.c { text-align:center;}
\#filecontents table.sumd td.r, #filecontents table.sumd th.r { text-align:right;}
\#filecontents table.sumd td.l1, #filecontents table.sumd th.l1 { padding-right:1em; }
\#filecontents table.sumd td.c1, #filecontents table.sumd th.c1 { padding-right:1em; text-align:center; }
\#filecontents table.sumd td.r1, #filecontents table.sumd th.r1 { padding-right:1em; text-align:right; }
</style>

# SketchUp 2014 Constants Guide

SketchUp defines constants, some are global, others are defined in classes or
'namespaced'.  Many of them are not listed in the SketchUp.com help documentation.
This list includes all constants.

While creating this document, I noticed that some constants' values changed from
version to version.  Hence, it is strongly recommended that the constant names
(versus their values) are used in code.

All of the links in this reference refer back to SketchUp.com.

Some of the concepts in this document may be obvious to experienced programmers,
but many API users are new to Ruby, or new to programming.

Finally, thanks to Jim Foltz and others for their previous work and help.

---
Generated with [SUMD_Guide] v2.0, on 2015-12-21 at 04:28:09 PM GMT,
using SketchUp v14.1.1282 & Ruby v2.0.0.

---

Unless otherwise noted, constants are of class Fixnum.

This document divides the SketchUp defined constants into three categories

**1. Namespaced Constants:** These are defined on a class.  They will often be
listed in a form similar to:

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

Two things to remember about namespaced constants:

* One can define the namespace, but one can also use the class method on an instance
  object.
* They are inherited.  If they are defined on a class (like 'Dimension'). They are
  also available on its subclasses (like 'DimensionLinear').

**2. Global Numeric Constants:**

Almost all of these constants are used as parameters or returns in methods.  Most
are Fixnum.

**3. Global Object Constants:**

There are a few constants that are SketchUp objects.  All are defined in the
[Geom] module, with the exception of [Sketchup::Console].

## Namespaced Constants

### Dimension \#arrow_type \#arrow_type=

Defined on [Sketchup::Dimension].  See [Dimension#arrow_type]. These constants are
for use with [Sketchup::Dimension] subclasses such as [DimensionLinear] and
[DimensionRadial].

```ruby
arrow_type = dim.arrow_type
dim.arrow_type = arrow_type
```

<table class='sumd'><thead><tr>
<th class='l1'>arrow_type</th><th class='c'>value</th>
</tr></thead><tbody>
<tr><td class='l1'>ARROW_CLOSED</td><td class='c'>3</td></tr>
<tr><td class='l1'>ARROW_DOT</td><td class='c'>2</td></tr>
<tr><td class='l1'>ARROW_NONE</td><td class='c'>0</td></tr>
<tr><td class='l1'>ARROW_OPEN</td><td class='c'>4</td></tr>
<tr><td class='l1'>ARROW_SLASH</td><td class='c'>1</td></tr>
</tbody></table>


### DimensionLinear \#aligned_text_position \#aligned_text_position=

Defined on [Sketchup::DimensionLinear].  See [DimensionLinear#aligned_text_position].

```ruby
at_pos = dim.aligned_text_position
dim.aligned_text_position = at_pos
```

<table class='sumd'><thead><tr>
<th class='l1'>at_pos</th><th class='c'>value</th>
</tr></thead><tbody>
<tr><td class='l1'>ALIGNED_TEXT_ABOVE</td><td class='c'>0</td></tr>
<tr><td class='l1'>ALIGNED_TEXT_CENTER</td><td class='c'>1</td></tr>
<tr><td class='l1'>ALIGNED_TEXT_OUTSIDE</td><td class='c'>2</td></tr>
</tbody></table>


### DimensionLinear \#text_position \#text_position=

Defined on [Sketchup::DimensionLinear].  See [DimensionLinear#text_position].

```ruby
text_pos = dim.text_position
dim.text_position = text_pos
```

<table class='sumd'><thead><tr>
<th class='l1'>text_pos</th><th class='c'>value</th>
</tr></thead><tbody>
<tr><td class='l1'>TEXT_CENTERED</td><td class='c'>1</td></tr>
<tr><td class='l1'>TEXT_OUTSIDE_END</td><td class='c'>2</td></tr>
<tr><td class='l1'>TEXT_OUTSIDE_START</td><td class='c'>0</td></tr>
</tbody></table>


### Entities \#add_faces_from_mesh

Defined on [Geom::PolygonMesh].  See [Entities#add_faces_from_mesh].

```ruby
ame = Sketchup.active_model.entities
ame.add_faces_from_mesh(pm, smooth_flags, material)
```

<table class='sumd'><thead><tr>
<th class='l1'>smooth_flags</th><th class='c'>value</th>
</tr></thead><tbody>
<tr><td class='l1'>AUTO_SOFTEN</td><td class='c'>4</td></tr>
<tr><td class='l1'>HIDE_BASED_ON_INDEX</td><td class='c'>1</td></tr>
<tr><td class='l1'>NO_SMOOTH_OR_HIDE</td><td class='c'>0</td></tr>
<tr><td class='l1'>SMOOTH_SOFT_EDGES</td><td class='c'>8</td></tr>
<tr><td class='l1'>SOFTEN_BASED_ON_INDEX</td><td class='c'>2</td></tr>
</tbody></table>


### Face \#classify_point

Defined on [Sketchup::Face].  See [Face#classify_point].

```ruby
pt_location = face.classify_point(pt)
```
The below code sample is in the [template_code.rb] file. Load, then
SUMD_TC.new.face_1.

```ruby
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
```

<table class='sumd'><colgroup><col style='width:9.6em;' /><col /><col style='width:3em;'/><col style='width:9.6em;' /><col /></colgroup><thead><tr>
<th>pt_location</th><th class='c'>value</th><th class='b'></th><th>pt_location</th><th class='c'>value</th>
</tr></thead><tbody>
<tr><td>PointInside</td><td class='c'>1</td><td class='b'></td><td>PointOnVertex</td><td class='c'>2</td></tr>
<tr><td>PointNotOnPlane</td><td class='c'>32</td><td class='b'></td><td>PointOutside</td><td class='c'>16</td></tr>
<tr><td>PointOnEdge</td><td class='c'>4</td><td class='b'></td><td>PointUnknown</td><td class='c'>0</td></tr>
<tr><td>PointOnFace</td><td class='c'>8</td><td class='b'></td><td></td><td class='c'></td></tr>
</tbody></table>


### Importer \#load_file

Defined on [Sketchup::Importer].  See [Importer#load_file].  These are returned
to SketchUp when your importer is finished with processing.  Note the following
is not included --

5 = SketchUp version not supported (no additional dialog shown)

```ruby
class YourImporter < Sketchup::Importer
  def load_file(file_path, status)
    return status_code
  end
end
```

<table class='sumd'><thead><tr>
<th class='l1'>status_code return</th><th class='c'>value</th>
</tr></thead><tbody>
<tr><td class='l1'>ImportCanceled</td><td class='c'>2</td></tr>
<tr><td class='l1'>ImportFail</td><td class='c'>1</td></tr>
<tr><td class='l1'>ImportFileNotFound</td><td class='c'>4</td></tr>
<tr><td class='l1'>ImportSuccess</td><td class='c'>0</td></tr>
<tr><td class='l1'>ImporterNotFound</td><td class='c'>3</td></tr>
</tbody></table>


### Length 'UnitsOptions' OptionsProvider

Defined on [Length].  See [Model#options], [OptionsManager],
[OptionsManager#&#91;&#93;] and [OptionsProvider].

First, SketchUp.com does not list all of the keys used in [OptionsManager] and
[OptionsProvider].  The below table shows all of the keys.

<table class='sumd'><thead><tr>
<th class='l1'>OptionsManager<br/>key</th><th class='l1'>OptionsProvider<br/>key</th><th class='c1'>OptionsProvider<br/>value</th><th><br/>class</th>
</tr></thead><tbody>
<tr><td class='l1'>PageOptions</td><td class='l1'>ShowTransition</td><td class='c1'>true</td><td>Boolean</td></tr>
<tr><td class='l1'></td><td class='l1'>TransitionTime</td><td class='c1'>2.0</td><td>Float</td></tr>
<tr><td class='l1'>&#160;</td><td class='l1'></td><td class='c1'></td><td></td></tr>
<tr><td class='l1'>PrintOptions</td><td class='l1'>ComputeSizeFromScale</td><td class='c1'>false</td><td>Boolean</td></tr>
<tr><td class='l1'></td><td class='l1'>FitToPage</td><td class='c1'>true</td><td>Boolean</td></tr>
<tr class='t' ><td colspan='4'></td></tr>
<tr class='b1'><td colspan='4'></td></tr>
<tr><td class='l1'></td><td class='l1'>LineWeight</td><td class='c1'>0.5</td><td>Float</td></tr>
<tr><td class='l1'></td><td class='l1'>ModelExtents</td><td class='c1'>true</td><td>Boolean</td></tr>
<tr><td class='l1'></td><td class='l1'>NumberOfPages</td><td class='c1'>1</td><td>Fixnum</td></tr>
<tr><td class='l1'></td><td class='l1'>PixelsPerInch</td><td class='c1'>150.0</td><td>Float</td></tr>
<tr><td class='l1'></td><td class='l1'>PrintHeight</td><td class='c1'>11.0</td><td>Float</td></tr>
<tr class='t' ><td colspan='4'></td></tr>
<tr class='b1'><td colspan='4'></td></tr>
<tr><td class='l1'></td><td class='l1'>PrintQuality</td><td class='c1'>0</td><td>Fixnum</td></tr>
<tr><td class='l1'></td><td class='l1'>PrintWidth</td><td class='c1'>8.5</td><td>Float</td></tr>
<tr><td class='l1'></td><td class='l1'>ScaleAdjustment</td><td class='c1'>1.0</td><td>Float</td></tr>
<tr><td class='l1'></td><td class='l1'>SectionSlice</td><td class='c1'>false</td><td>Boolean</td></tr>
<tr><td class='l1'></td><td class='l1'>SizeInModel</td><td class='c1'>1.0</td><td>Float</td></tr>
<tr class='t' ><td colspan='4'></td></tr>
<tr class='b1'><td colspan='4'></td></tr>
<tr><td class='l1'></td><td class='l1'>SizeInPrint</td><td class='c1'>1.0</td><td>Float</td></tr>
<tr><td class='l1'></td><td class='l1'>VectorMode</td><td class='c1'>false</td><td>Boolean</td></tr>
<tr><td class='l1'>&#160;</td><td class='l1'></td><td class='c1'></td><td></td></tr>
<tr><td class='l1'>SlideshowOptions</td><td class='l1'>LoopSlideshow</td><td class='c1'>true</td><td>Boolean</td></tr>
<tr><td class='l1'></td><td class='l1'>SlideTime</td><td class='c1'>1.0</td><td>Float</td></tr>
<tr class='t' ><td colspan='4'></td></tr>
<tr class='b1'><td colspan='4'></td></tr>
<tr><td class='l1'>&#160;</td><td class='l1'></td><td class='c1'></td><td></td></tr>
<tr><td class='l1'>UnitsOptions</td><td class='l1'>AnglePrecision</td><td class='c1'>1</td><td>Fixnum</td></tr>
<tr><td class='l1'></td><td class='l1'>AngleSnapEnabled</td><td class='c1'>true</td><td>Boolean</td></tr>
<tr><td class='l1'></td><td class='l1'>ForceInchDisplay</td><td class='c1'>false</td><td>Boolean</td></tr>
<tr><td class='l1'></td><td class='l1'>LengthFormat</td><td class='c1'>1</td><td>Fixnum</td></tr>
<tr class='t' ><td colspan='4'></td></tr>
<tr class='b1'><td colspan='4'></td></tr>
<tr><td class='l1'></td><td class='l1'>LengthPrecision</td><td class='c1'>4</td><td>Fixnum</td></tr>
<tr><td class='l1'></td><td class='l1'>LengthSnapEnabled</td><td class='c1'>true</td><td>Boolean</td></tr>
<tr><td class='l1'></td><td class='l1'>LengthSnapLength</td><td class='c1'>0.25</td><td>Float</td></tr>
<tr><td class='l1'></td><td class='l1'>LengthUnit</td><td class='c1'>0</td><td>Fixnum</td></tr>
<tr><td class='l1'></td><td class='l1'>SnapAngle</td><td class='c1'>15.0</td><td>Float</td></tr>
<tr class='t' ><td colspan='4'></td></tr>
<tr class='b1'><td colspan='4'></td></tr>
<tr><td class='l1'></td><td class='l1'>SuppressUnitsDisplay</td><td class='c1'>false</td><td>Boolean</td></tr>
</tbody></table>


These constants are used with the 'UnitsOptions' [OptionsProvider].  In the two
following code lines, units and format have constant equivalents.

```ruby
am = Sketchup.active_model
units  = am.options['UnitsOptions']['LengthUnit']
format = am.options['UnitsOptions']['LengthFormat']
```

The following code creates two hashes that make use of the Length:: constants,
queries the two settings, and outputs to the console.  It's in the
[template_code.rb] file. Load, then SUMD_TC.new.len_1.

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

<table class='sumd'><colgroup><col style='width:7.3em;' /><col /><col style='width:3em;'/><col style='width:7.3em;' /><col /></colgroup><thead><tr>
<th>constant</th><th class='c'>value</th><th class='b'></th><th>constant</th><th class='c'>value</th>
</tr></thead><tbody>
<tr><td>Architectural</td><td class='c'>1</td><td class='b'></td><td>Fractional</td><td class='c'>3</td></tr>
<tr><td>Centimeter</td><td class='c'>3</td><td class='b'></td><td>Inches</td><td class='c'>0</td></tr>
<tr><td>Decimal</td><td class='c'>0</td><td class='b'></td><td>Meter</td><td class='c'>4</td></tr>
<tr><td>Engineering</td><td class='c'>2</td><td class='b'></td><td>Millimeter</td><td class='c'>2</td></tr>
<tr><td>Feet</td><td class='c'>1</td><td class='b'></td><td></td><td class='c'></td></tr>
</tbody></table>


### Model \#save \#save_copy

Defined on [Sketchup::Model].  See [Model#save] and [Model#save_copy].

```ruby
# version param +2014, if omitted, saves in current version
status = model.save(filename, version)
status = model.save_copy(filename, version)
```

<table class='sumd'><colgroup><col style='width:8.8em;' /><col /><col style='width:3em;'/><col style='width:8.8em;' /><col /></colgroup><thead><tr>
<th>version</th><th class='c'>value</th><th class='b'></th><th>version</th><th class='c'>value</th>
</tr></thead><tbody>
<tr><td>VERSION_3</td><td class='c'>3</td><td class='b'></td><td>VERSION_7</td><td class='c'>7</td></tr>
<tr><td>VERSION_4</td><td class='c'>4</td><td class='b'></td><td>VERSION_8</td><td class='c'>8</td></tr>
<tr><td>VERSION_5</td><td class='c'>5</td><td class='b'></td><td>VERSION_2013</td><td class='c'>9</td></tr>
<tr><td>VERSION_6</td><td class='c'>6</td><td class='b'></td><td>VERSION_2014</td><td class='c'>10</td></tr>
</tbody></table>


### RenderingOptionsObserver

Defined on [Sketchup::RenderingOptions].  These constants are used with a
[RenderingOptionsObserver] instance (fqn Sketchup::RenderingOptionsObserver).

A [RenderingOptions] instance is essentially a Hash.  Its keys can be
enumerated, and setting their value will change the rendering options of the
model. The constants are used in a callback method in a [RenderingOptionsObserver]
instance as a notification of rendering option changes by the user or other code.

The constants provide some information about the change.

* They do not map one-to-one to the [RenderingOptions] keys.  Some changes
  will result in two callbacks firing.
* Some [RenderingOptions] keys will fire a callback, but with no constant
  assigned to the type value.
* Some [RenderingOptions] keys will not fire a callback.

The following code lists all of the [RenderingOptions] constants and values,
then creates a hash from all of the [RenderingOptions] keys.  It then adds a
[RenderingOptionsObserver] to the current model.  The observer outputs to the
console the [onRenderingOptionsChanged] callback's type parameter and the
constant associated with it, along any [RenderingOptions] changes. One can
change [RenderingOptions] thru the UI and see what's going on, especially if UI
operations do not have constants or keys. The code sample is in the
[template_code.rb] file.  Load, then SUMD_TC.new.ro_1.

```ruby
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
```

The above code does not make use of the constants, so the below code shows one
way of creating an observer.  The callback uses some constants (items in 'view'
menu and toolbar) in a case statement.  Similar code could be used in a plug-in.
This code sample is SUMD_TC.new.ro_2.

```ruby
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
```

The following table lists [RenderingOptions] keys which fire callbacks in a
[RenderingOptionsObserver] [onRenderingOptionsChanged] callback.  As
mentioned, some keys generate more than one callback, and, any row with
'** Missing, type =' in the 'Observer constant (type)' column fired a callback,
but there isn't a [RenderingOptions] constant with that value.  It is sorted by
RenderingOption value.class, RenderingOption key, and Constant name.  Duplicate
values are shown bolded.  Note that since these seem to have a many-to-many
relationship, the testing done may not show all combinations.

<table class='sumd'><thead><tr>
<th class='l1'>RenderingOptions<br/>key</th><th class='l1'>RenderingOptions<br/>value.class</th><th><br/>Observer constant (type)</th>
</tr></thead><tbody>
<tr><td class='l1'>DisplayColorByLayer</td><td class='l1'>Boolean</td><td>ROPSetDisplayColorByLayer</td></tr>
<tr><td class='l1'>DisplayDims</td><td class='l1'>Boolean</td><td>ROPSetDisplayDims</td></tr>
<tr><td class='l1'>DisplayFog</td><td class='l1'>Boolean</td><td>ROPSetDisplayFog</td></tr>
<tr><td class='l1'>DisplayInstanceAxes</td><td class='l1'>Boolean</td><td>ROPSetDisplayInstanceAxes</td></tr>
<tr><td class='l1'><strong>DisplaySectionPlanes</strong></td><td class='l1'>Boolean</td><td><strong style='color:blue'>** Missing, type = 26</strong></td></tr>
<tr class='t' ><td colspan='3'></td></tr>
<tr class='b1'><td colspan='3'></td></tr>
<tr><td class='l1'><strong>DisplaySectionPlanes</strong></td><td class='l1'>Boolean</td><td>ROPSetSectionDisplayMode</td></tr>
<tr><td class='l1'>DisplaySketchAxes</td><td class='l1'>Boolean</td><td>ROPSetDisplaySketchAxes</td></tr>
<tr><td class='l1'>DisplayText</td><td class='l1'>Boolean</td><td>ROPSetDisplayText</td></tr>
<tr><td class='l1'>DisplayWatermarks</td><td class='l1'>Boolean</td><td><strong style='color:blue'>** Missing, type = 55</strong></td></tr>
<tr><td class='l1'>DrawDepthQue</td><td class='l1'>Boolean</td><td>ROPSetDepthQueEdges</td></tr>
<tr class='t' ><td colspan='3'></td></tr>
<tr class='b1'><td colspan='3'></td></tr>
<tr><td class='l1'>DrawGround</td><td class='l1'>Boolean</td><td>ROPSetDrawGround</td></tr>
<tr><td class='l1'>DrawHidden</td><td class='l1'>Boolean</td><td>ROPDrawHidden</td></tr>
<tr><td class='l1'>DrawHorizon</td><td class='l1'>Boolean</td><td>ROPSetDrawHorizon</td></tr>
<tr><td class='l1'>DrawLineEnds</td><td class='l1'>Boolean</td><td>ROPSetLineEndEdges</td></tr>
<tr><td class='l1'>DrawProfilesOnly</td><td class='l1'>Boolean</td><td>ROPSetProfilesOnlyEdges</td></tr>
<tr class='t' ><td colspan='3'></td></tr>
<tr class='b1'><td colspan='3'></td></tr>
<tr><td class='l1'>DrawSilhouettes</td><td class='l1'>Boolean</td><td>ROPSetProfileEdges</td></tr>
<tr><td class='l1'>DrawUnderground</td><td class='l1'>Boolean</td><td>ROPSetDrawUnderground</td></tr>
<tr><td class='l1'>ExtendLines</td><td class='l1'>Boolean</td><td>ROPSetExtendLines</td></tr>
<tr><td class='l1'>FogUseBkColor</td><td class='l1'>Boolean</td><td>ROPSetFogUseBkColor</td></tr>
<tr><td class='l1'>HideConstructionGeometry</td><td class='l1'>Boolean</td><td>ROPSetHideConstructionGeometry</td></tr>
<tr class='t' ><td colspan='3'></td></tr>
<tr class='b1'><td colspan='3'></td></tr>
<tr><td class='l1'>InactiveHidden</td><td class='l1'>Boolean</td><td><strong>ROPEditComponent</strong></td></tr>
<tr><td class='l1'>InstanceHidden</td><td class='l1'>Boolean</td><td><strong>ROPEditComponent</strong></td></tr>
<tr><td class='l1'>JitterEdges</td><td class='l1'>Boolean</td><td>ROPSetJitterEdges</td></tr>
<tr><td class='l1'>MaterialTransparency</td><td class='l1'>Boolean</td><td>ROPSetMaterialTransparency</td></tr>
<tr><td class='l1'>ModelTransparency</td><td class='l1'>Boolean</td><td>ROPSetModelTransparency</td></tr>
<tr class='t' ><td colspan='3'></td></tr>
<tr class='b1'><td colspan='3'></td></tr>
<tr><td class='l1'>Texture</td><td class='l1'>Boolean</td><td>ROPSetTexture</td></tr>
<tr><td class='l1'>DepthQueWidth</td><td class='l1'>Fixnum</td><td>ROPSetDepthQueWidth</td></tr>
<tr><td class='l1'>EdgeColorMode</td><td class='l1'>Fixnum</td><td>ROPSetEdgeColorMode</td></tr>
<tr><td class='l1'>EdgeDisplayMode</td><td class='l1'>Fixnum</td><td><strong>ROPSetEdgeDisplayMode</strong></td></tr>
<tr><td class='l1'>EdgeType</td><td class='l1'>Fixnum</td><td>ROPSetEdgeType</td></tr>
<tr class='t' ><td colspan='3'></td></tr>
<tr class='b1'><td colspan='3'></td></tr>
<tr><td class='l1'>FaceColorMode</td><td class='l1'>Fixnum</td><td>ROPSetFaceColorMode</td></tr>
<tr><td class='l1'>GroundTransparency</td><td class='l1'>Fixnum</td><td>ROPSetGroundTransparency</td></tr>
<tr><td class='l1'>LineEndWidth</td><td class='l1'>Fixnum</td><td>ROPSetLineEndWidth</td></tr>
<tr><td class='l1'>LineExtension</td><td class='l1'>Fixnum</td><td>ROPSetLineExtension</td></tr>
<tr><td class='l1'><strong>RenderMode</strong></td><td class='l1'>Fixnum</td><td><strong>ROPSetEdgeDisplayMode</strong></td></tr>
<tr class='t' ><td colspan='3'></td></tr>
<tr class='b1'><td colspan='3'></td></tr>
<tr><td class='l1'><strong>RenderMode</strong></td><td class='l1'>Fixnum</td><td>ROPSetRenderMode</td></tr>
<tr><td class='l1'>SectionCutWidth</td><td class='l1'>Fixnum</td><td>ROPSetSectionCutWidth</td></tr>
<tr><td class='l1'>SilhouetteWidth</td><td class='l1'>Fixnum</td><td>ROPSetProfileWidth</td></tr>
<tr><td class='l1'>TransparencySort</td><td class='l1'>Fixnum</td><td>ROPTransparencySortMethod</td></tr>
<tr><td class='l1'>FogEndDist</td><td class='l1'>Float</td><td><strong>ROPSetFogDist</strong></td></tr>
<tr class='t' ><td colspan='3'></td></tr>
<tr class='b1'><td colspan='3'></td></tr>
<tr><td class='l1'>FogStartDist</td><td class='l1'>Float</td><td><strong>ROPSetFogDist</strong></td></tr>
<tr><td class='l1'>InactiveFade</td><td class='l1'>Float</td><td><strong>ROPEditComponent</strong></td></tr>
<tr><td class='l1'>InstanceFade</td><td class='l1'>Float</td><td><strong>ROPEditComponent</strong></td></tr>
<tr><td class='l1'>BackgroundColor</td><td class='l1'>Sketchup::Color</td><td>ROPSetBackgroundColor</td></tr>
<tr><td class='l1'>ConstructionColor</td><td class='l1'>Sketchup::Color</td><td>ROPSetConstructionColor</td></tr>
<tr class='t' ><td colspan='3'></td></tr>
<tr class='b1'><td colspan='3'></td></tr>
<tr><td class='l1'>FaceBackColor</td><td class='l1'>Sketchup::Color</td><td><strong>ROPSetFaceColor</strong></td></tr>
<tr><td class='l1'>FaceFrontColor</td><td class='l1'>Sketchup::Color</td><td><strong>ROPSetFaceColor</strong></td></tr>
<tr><td class='l1'>FogColor</td><td class='l1'>Sketchup::Color</td><td>ROPSetFogColor</td></tr>
<tr><td class='l1'>ForegroundColor</td><td class='l1'>Sketchup::Color</td><td>ROPSetForegroundColor</td></tr>
<tr><td class='l1'>GroundColor</td><td class='l1'>Sketchup::Color</td><td>ROPSetGroundColor</td></tr>
<tr class='t' ><td colspan='3'></td></tr>
<tr class='b1'><td colspan='3'></td></tr>
<tr><td class='l1'>HighlightColor</td><td class='l1'>Sketchup::Color</td><td>ROPSetHighlightColor</td></tr>
<tr><td class='l1'>LockedColor</td><td class='l1'>Sketchup::Color</td><td>ROPSetLockedColor</td></tr>
<tr><td class='l1'>SectionActiveColor</td><td class='l1'>Sketchup::Color</td><td>ROPSetSectionActiveColor</td></tr>
<tr><td class='l1'>SectionDefaultCutColor</td><td class='l1'>Sketchup::Color</td><td>ROPSetSectionDefaultCutColor</td></tr>
<tr><td class='l1'>SectionInactiveColor</td><td class='l1'>Sketchup::Color</td><td>ROPSetSectionInactiveColor</td></tr>
<tr class='t' ><td colspan='3'></td></tr>
<tr class='b1'><td colspan='3'></td></tr>
<tr><td class='l1'>SkyColor</td><td class='l1'>Sketchup::Color</td><td>ROPSetSkyColor</td></tr>
</tbody></table>

The following table lists [RenderingOptions] keys that do not fire the [onRenderingOptionsChanged] callback.

<table class='sumd'><thead><tr>
<th class='l1'>R Opts key</th><th>R Opts value.class</th>
</tr></thead><tbody>
<tr><td class='l1'>BandColor</td><td>Sketchup::Color</td></tr>
<tr><td class='l1'>HorizonColor</td><td>Sketchup::Color</td></tr>
<tr><td class='l1'>ShowViewName</td><td>Boolean</td></tr>
</tbody></table>

The following RenderingOptions constants are not fired by any keys in [RenderingOptions].  They may be returned for UI changes that do not have API control.

<table class='sumd'><thead><tr>
<th class='l1'>Observer constant (type)</th><th class='c'>value</th>
</tr></thead><tbody>
<tr><td class='l1'>ROPAssign</td><td class='c'>0</td></tr>
<tr><td class='l1'>ROPSetExtendEdges</td><td class='c'>7</td></tr>
<tr><td class='l1'>ROPSetFogHint</td><td class='c'>24</td></tr>
<tr><td class='l1'>ROPSetTransparencyObsolete</td><td class='c'>2</td></tr>
</tbody></table>


## Global Object Constants

### Geometry Class constants

These constants can be used anywhere instances of their respective classes are
used.

<table class='sumd'><thead><tr>
<th class='l1'>constant</th><th class='c1'>value</th><th>class</th>
</tr></thead><tbody>
<tr><td class='l1'>IDENTITY</td><td class='c1'>#<Geom::Transformation:0xa4d7218></td><td>Geom::Transformation</td></tr>
<tr><td class='l1'>ORIGIN</td><td class='c1'>(0", 0", 0")</td><td>Geom::Point3d</td></tr>
<tr><td class='l1'>X_AXIS</td><td class='c1'>(1.0, 0.0, 0.0)</td><td>Geom::Vector3d</td></tr>
<tr><td class='l1'>Y_AXIS</td><td class='c1'>(0.0, 1.0, 0.0)</td><td>Geom::Vector3d</td></tr>
<tr><td class='l1'>Z_AXIS</td><td class='c1'>(0.0, 0.0, 1.0)</td><td>Geom::Vector3d</td></tr>
</tbody></table>


### Other object constants

The only other object constant defined is [Sketchup::Console].

```ruby
SKETCHUP_CONSOLE.write("this way also")
```

<table class='sumd'><thead><tr>
<th class='l1'>constant</th><th class='c'>value</th>
</tr></thead><tbody>
<tr><td class='l1'>SKETCHUP_CONSOLE</td><td class='c'>#<Sketchup::Console:0xa4d65d0></td></tr>
</tbody></table>


## Global Numeric Constants

### Sketchup.send_action

```ruby
Sketchup.send_action(action)
```

See [Sketchup.send_action].  This method allows for either a string or a number
for its parameter.  Numbers are officially 'unsupported', and only available
under Windows.

The following code produces the same result.

```ruby
bln = Sketchup.send_action("selectArcTool:") # use a String
bln = Sketchup.send_action(CMD_ARC)          # use a Constant
bln = Sketchup.send_action(21065)            # use a Fixnum
bln = Sketchup.send_action(action)     # action can be either
```

Some strings are not listed on SketchUp.com.  If one needs an unlisted menu item
string, one can assign a keyboard shortcut, then either view them with
`Sketchup.get_shortcuts.sort.join("\n")` or by exporting the 'Preferences' from
the UI and viewing the .dat file in a text editor.  If a string ending in ':' is
shown...

The following table shows strings (taken from SketchUp.com Nov-15), and their constant
equivalents.  Matches were done via RegEx and several lines of case statement.

<table class='sumd'><thead><tr>
<th class='l1'>action String</th><th class='l1'>action Constant</th><th class='c'>Fixnum</th>
</tr></thead><tbody>
<tr><td class='l1'>copy:</td><td class='l1'>CMD_COPY</td><td class='c'>57634</td></tr>
<tr><td class='l1'>cut:</td><td class='l1'>CMD_CUT</td><td class='c'>57635</td></tr>
<tr><td class='l1'>editHide:</td><td class='l1'></td><td class='c'></td></tr>
<tr><td class='l1'>editRedo:</td><td class='l1'>CMD_REDO</td><td class='c'>57644</td></tr>
<tr><td class='l1'>editUndo:</td><td class='l1'>CMD_UNDO</td><td class='c'>57643</td></tr>
<tr class='t' ><td colspan='3'></td></tr>
<tr class='b1'><td colspan='3'></td></tr>
<tr><td class='l1'>editUnhide:</td><td class='l1'></td><td class='c'></td></tr>
<tr><td class='l1'>fixNonPlanarFaces:</td><td class='l1'></td><td class='c'></td></tr>
<tr><td class='l1'>getPhotoTexture:</td><td class='l1'></td><td class='c'></td></tr>
<tr><td class='l1'>openDocument:</td><td class='l1'>CMD_OPEN</td><td class='c'>57601</td></tr>
<tr><td class='l1'>pageAdd:</td><td class='l1'>CMD_PAGE_NEW</td><td class='c'>21067</td></tr>
<tr class='t' ><td colspan='3'></td></tr>
<tr class='b1'><td colspan='3'></td></tr>
<tr><td class='l1'>pageDelete:</td><td class='l1'>CMD_PAGE_DELETE</td><td class='c'>21078</td></tr>
<tr><td class='l1'>pageNext:</td><td class='l1'>CMD_PAGE_NEXT</td><td class='c'>10535</td></tr>
<tr><td class='l1'>pagePrevious:</td><td class='l1'>CMD_PAGE_PREVIOUS</td><td class='c'>10536</td></tr>
<tr><td class='l1'>pageUpdate:</td><td class='l1'>CMD_PAGE_UPDATE</td><td class='c'>21068</td></tr>
<tr><td class='l1'>paste:</td><td class='l1'>CMD_PASTE</td><td class='c'>57637</td></tr>
<tr class='t' ><td colspan='3'></td></tr>
<tr class='b1'><td colspan='3'></td></tr>
<tr><td class='l1'>printDocument:</td><td class='l1'>CMD_PRINT</td><td class='c'>57607</td></tr>
<tr><td class='l1'>renderHiddenLine:</td><td class='l1'>CMD_HIDDENLINE</td><td class='c'>10511</td></tr>
<tr><td class='l1'>renderMonochrome:</td><td class='l1'></td><td class='c'></td></tr>
<tr><td class='l1'>renderShaded:</td><td class='l1'>CMD_SHADED</td><td class='c'>10512</td></tr>
<tr><td class='l1'>renderTextures:</td><td class='l1'>CMD_TEXTURED</td><td class='c'>10539</td></tr>
<tr class='t' ><td colspan='3'></td></tr>
<tr class='b1'><td colspan='3'></td></tr>
<tr><td class='l1'>renderWireframe:</td><td class='l1'>CMD_WIREFRAME</td><td class='c'>10510</td></tr>
<tr><td class='l1'>selectArc3PointPieTool:</td><td class='l1'></td><td class='c'></td></tr>
<tr><td class='l1'>selectArc3PointTool:</td><td class='l1'></td><td class='c'></td></tr>
<tr><td class='l1'>selectArcTool:</td><td class='l1'>CMD_ARC</td><td class='c'>21065</td></tr>
<tr><td class='l1'>selectAxisTool:</td><td class='l1'></td><td class='c'></td></tr>
<tr class='t' ><td colspan='3'></td></tr>
<tr class='b1'><td colspan='3'></td></tr>
<tr><td class='l1'>selectCircleTool:</td><td class='l1'>CMD_CIRCLE</td><td class='c'>21096</td></tr>
<tr><td class='l1'>selectDimensionTool:</td><td class='l1'>CMD_DIMENSION</td><td class='c'>21410</td></tr>
<tr><td class='l1'>selectDollyTool:</td><td class='l1'>CMD_DOLLY</td><td class='c'>10523</td></tr>
<tr><td class='l1'>selectEraseTool:</td><td class='l1'>CMD_ERASE</td><td class='c'>21019</td></tr>
<tr><td class='l1'>selectExtrudeTool:</td><td class='l1'>CMD_EXTRUDE</td><td class='c'>21525</td></tr>
<tr class='t' ><td colspan='3'></td></tr>
<tr class='b1'><td colspan='3'></td></tr>
<tr><td class='l1'>selectFieldOfViewTool:</td><td class='l1'>CMD_DISPLAY_FOV</td><td class='c'>21494</td></tr>
<tr><td class='l1'>selectFreehandTool:</td><td class='l1'>CMD_FREEHAND</td><td class='c'>21031</td></tr>
<tr><td class='l1'>selectImageIglooTool:</td><td class='l1'></td><td class='c'></td></tr>
<tr><td class='l1'>selectLineTool:</td><td class='l1'>CMD_LINE</td><td class='c'>21020</td></tr>
<tr><td class='l1'>selectMeasureTool:</td><td class='l1'>CMD_MEASURE</td><td class='c'>21024</td></tr>
<tr class='t' ><td colspan='3'></td></tr>
<tr class='b1'><td colspan='3'></td></tr>
<tr><td class='l1'>selectMoveTool:</td><td class='l1'>CMD_MOVE</td><td class='c'>21048</td></tr>
<tr><td class='l1'>selectNorthTool:</td><td class='l1'></td><td class='c'></td></tr>
<tr><td class='l1'>selectOffsetTool:</td><td class='l1'>CMD_OFFSET</td><td class='c'>21100</td></tr>
<tr><td class='l1'>selectOrbitTool:</td><td class='l1'>CMD_ORBIT</td><td class='c'>10508</td></tr>
<tr><td class='l1'>selectPaintTool:</td><td class='l1'>CMD_PAINT</td><td class='c'>21074</td></tr>
<tr class='t' ><td colspan='3'></td></tr>
<tr class='b1'><td colspan='3'></td></tr>
<tr><td class='l1'>selectPolygonTool:</td><td class='l1'>CMD_POLYGON</td><td class='c'>21095</td></tr>
<tr><td class='l1'>selectPositionCameraTool:</td><td class='l1'>CMD_POSITION_CAMERA</td><td class='c'>21169</td></tr>
<tr><td class='l1'>selectProtractorTool:</td><td class='l1'>CMD_PROTRACTOR</td><td class='c'>21057</td></tr>
<tr><td class='l1'>selectPushPullTool:</td><td class='l1'>CMD_PUSHPULL</td><td class='c'>21041</td></tr>
<tr><td class='l1'>selectRectangle3PointTool:</td><td class='l1'></td><td class='c'></td></tr>
<tr class='t' ><td colspan='3'></td></tr>
<tr class='b1'><td colspan='3'></td></tr>
<tr><td class='l1'>selectRectangleTool:</td><td class='l1'>CMD_RECTANGLE</td><td class='c'>21094</td></tr>
<tr><td class='l1'>selectRotateTool:</td><td class='l1'>CMD_ROTATE</td><td class='c'>21129</td></tr>
<tr><td class='l1'>selectScaleTool:</td><td class='l1'>CMD_SCALE</td><td class='c'>21236</td></tr>
<tr><td class='l1'>selectSectionPlaneTool:</td><td class='l1'>CMD_SECTION</td><td class='c'>21337</td></tr>
<tr><td class='l1'>selectSelectionTool:</td><td class='l1'>CMD_SELECT</td><td class='c'>21022</td></tr>
<tr class='t' ><td colspan='3'></td></tr>
<tr class='b1'><td colspan='3'></td></tr>
<tr><td class='l1'>selectTextTool:</td><td class='l1'>CMD_TEXT</td><td class='c'>21405</td></tr>
<tr><td class='l1'>selectTurnTool:</td><td class='l1'>CMD_PAN</td><td class='c'>10525</td></tr>
<tr><td class='l1'>selectWalkTool:</td><td class='l1'>CMD_WALK</td><td class='c'>10520</td></tr>
<tr><td class='l1'>selectZoomTool:</td><td class='l1'>CMD_ZOOM</td><td class='c'>10509</td></tr>
<tr><td class='l1'>selectZoomWindowTool:</td><td class='l1'>CMD_ZOOM_WINDOW</td><td class='c'>10526</td></tr>
<tr class='t' ><td colspan='3'></td></tr>
<tr class='b1'><td colspan='3'></td></tr>
<tr><td class='l1'>showRubyPanel:</td><td class='l1'>CMD_RUBY_CONSOLE</td><td class='c'>21478</td></tr>
<tr><td class='l1'>viewBack:</td><td class='l1'>CMD_VIEW_BACK</td><td class='c'>10505</td></tr>
<tr><td class='l1'>viewBottom:</td><td class='l1'>CMD_VIEW_BOTTOM</td><td class='c'>10506</td></tr>
<tr><td class='l1'>viewFront:</td><td class='l1'>CMD_VIEW_FRONT</td><td class='c'>10502</td></tr>
<tr><td class='l1'>viewIso:</td><td class='l1'>CMD_VIEW_ISO</td><td class='c'>10507</td></tr>
<tr class='t' ><td colspan='3'></td></tr>
<tr class='b1'><td colspan='3'></td></tr>
<tr><td class='l1'>viewLeft:</td><td class='l1'>CMD_VIEW_LEFT</td><td class='c'>10504</td></tr>
<tr><td class='l1'>viewPerspective:</td><td class='l1'>CMD_VIEW_PERSPECTIVE</td><td class='c'>10519</td></tr>
<tr><td class='l1'>viewRight:</td><td class='l1'>CMD_VIEW_RIGHT</td><td class='c'>10503</td></tr>
<tr><td class='l1'>viewShowAxes:</td><td class='l1'>CMD_SKETCHAXES</td><td class='c'>10522</td></tr>
<tr><td class='l1'>viewShowGuides:</td><td class='l1'>CMD_SHOWGUIDES</td><td class='c'>21980</td></tr>
<tr class='t' ><td colspan='3'></td></tr>
<tr class='b1'><td colspan='3'></td></tr>
<tr><td class='l1'>viewShowHidden:</td><td class='l1'>CMD_SHOWHIDDEN</td><td class='c'>21154</td></tr>
<tr><td class='l1'>viewTop:</td><td class='l1'>CMD_VIEW_TOP</td><td class='c'>10501</td></tr>
<tr><td class='l1'>viewUndo:</td><td class='l1'></td><td class='c'></td></tr>
<tr><td class='l1'>viewZoomExtents:</td><td class='l1'>CMD_ZOOM_EXTENTS</td><td class='c'>10527</td></tr>
<tr><td class='l1'>viewZoomToSelection:</td><td class='l1'>CMD_SELECTION_ZOOM_EXT</td><td class='c'>21469</td></tr>
</tbody></table>


The following constants do not have string equivalents.

<table class='sumd'><colgroup><col style='width:14.0em;' /><col /><col style='width:3em;'/><col style='width:14.0em;' /><col /></colgroup><thead><tr>
<th>action constant</th><th class='c'>value</th><th class='b'></th><th>action constant</th><th class='c'>value</th>
</tr></thead><tbody>
<tr><td>CMD_CAMERA_UNDO</td><td class='c'>10529</td><td class='b'></td><td>CMD_NEW</td><td class='c'>57600</td></tr>
<tr><td>CMD_DELETE</td><td class='c'>21021</td><td class='b'></td><td>CMD_SAVE</td><td class='c'>57603</td></tr>
<tr><td>CMD_DRAWCUTS</td><td class='c'>21348</td><td class='b'></td><td>CMD_SKETCHCS</td><td class='c'>21126</td></tr>
<tr><td>CMD_DRAWOUTLINES</td><td class='c'>21347</td><td class='b'></td><td>CMD_TRANSPARENT</td><td class='c'>10513</td></tr>
<tr><td>CMD_MAKE_COMPONENT</td><td class='c'>21083</td><td class='b'></td><td></td><td class='c'></td></tr>
</tbody></table>


### Sketchup.set_status_text

See [Sketchup.set_status_text].  Text can be placed in three different locations.
The constants are used as the position parameter and define the location.

```ruby
result = Sketchup.set_status_text("This is a Test", SB_VCB_VALUE)
result = Sketchup.set_status_text(status, position)
```

<table class='sumd'><thead><tr>
<th class='l1'>position</th><th class='c'>value</th>
</tr></thead><tbody>
<tr><td class='l1'>SB_PROMPT</td><td class='c'>0</td></tr>
<tr><td class='l1'>SB_VCB_LABEL</td><td class='c'>1</td></tr>
<tr><td class='l1'>SB_VCB_VALUE</td><td class='c'>2</td></tr>
</tbody></table>


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

<table class='sumd'><thead><tr>
<th class='l1'>cmd_status</th><th class='c'>value</th>
</tr></thead><tbody>
<tr><td class='l1'>MF_CHECKED</td><td class='c'>8</td></tr>
<tr><td class='l1'>MF_DISABLED</td><td class='c'>2</td></tr>
<tr><td class='l1'>MF_ENABLED</td><td class='c'>0</td></tr>
<tr><td class='l1'>MF_GRAYED</td><td class='c'>1</td></tr>
<tr><td class='l1'>MF_UNCHECKED</td><td class='c'>0</td></tr>
</tbody></table>


### Definition \#behavior \#snapto

See [Behavior#snapto].  To quote SketchUp.com help, 'The Behavior class is used
to control the "behavior" of components'.

```ruby
model = Sketchup.active_model
definition = model.definitions[0]
behavior = definition.behavior
snap_to = behavior.snapto
behavior.snapto = snap_to
```

<table class='sumd'><thead><tr>
<th class='l1'>snap_to</th><th class='c'>value</th>
</tr></thead><tbody>
<tr><td class='l1'>SnapTo_Arbitrary</td><td class='c'>0</td></tr>
<tr><td class='l1'>SnapTo_Horizontal</td><td class='c'>1</td></tr>
<tr><td class='l1'>SnapTo_Sloped</td><td class='c'>3</td></tr>
<tr><td class='l1'>SnapTo_Vertical</td><td class='c'>2</td></tr>
</tbody></table>


### Layer \#page_behavior \#page_behavior=

See [Layer#page_behavior].  This attribute is a numeric, with somewhat confusing
documentation.  From the docs, 'The behavior is composed of a combination of
these flags'.  So default visiblity is bit 0 ('HIDDEN' is set), why does
'NEW_PAGES' have 'VISIBLE' setting bit 4 and 'HIDDEN' setting bit 5?  Seems that
they should be mutually exclusive.

```ruby
layers = Sketchup.active_model.layers
layer.page_behavior = page_behavior
page_behavior = layers[0].page_behavior
puts page_behavior[0]   # this is default visiblity
puts page_behavior[4]   # this new pages visible?
puts page_behavior[5]   # this new pages hidden?
```

<table class='sumd'><thead><tr>
<th class='l1'>constant</th><th class='c'>value</th>
</tr></thead><tbody>
<tr><td class='l1'>LAYER_USES_DEFAULT_VISIBILITY_ON_NEW_PAGES</td><td class='c'>0</td></tr>
<tr><td class='l1'>LAYER_VISIBLE_BY_DEFAULT</td><td class='c'>0</td></tr>
<tr><td class='l1'>LAYER_HIDDEN_BY_DEFAULT</td><td class='c'>1</td></tr>
<tr><td class='l1'>LAYER_IS_VISIBLE_ON_NEW_PAGES</td><td class='c'>16</td></tr>
<tr><td class='l1'>LAYER_IS_HIDDEN_ON_NEW_PAGES</td><td class='c'>32</td></tr>
</tbody></table>


### Page \#update, Pages \#add

See [Page#update] and [Pages#add].  These bit constants are used for the flag
parameter.

```ruby
am = Sketchup.active_model
status = am.pages.add(name, flags = nil, index = nil)
am.pages['yourPage'].update(flags = nil)
```

<table class='sumd'><colgroup><col style='width:18.2em;' /><col /><col style='width:1.5em;'/><col style='width:18.2em;' /><col /></colgroup><thead><tr>
<th>flag parameter</th><th class='c'>value</th><th class='b'></th><th>flag parameter</th><th class='c'>value</th>
</tr></thead><tbody>
<tr><td>PAGE_NO_CAMERA</td><td class='c'>4094</td><td class='b'></td><td>PAGE_USE_RENDERING_OPTIONS</td><td class='c'>2</td></tr>
<tr><td>PAGE_USE_ALL</td><td class='c'>4095</td><td class='b'></td><td>PAGE_USE_SECTION_PLANES</td><td class='c'>64</td></tr>
<tr><td>PAGE_USE_CAMERA</td><td class='c'>1</td><td class='b'></td><td>PAGE_USE_SHADOWINFO</td><td class='c'>4</td></tr>
<tr><td>PAGE_USE_HIDDEN</td><td class='c'>16</td><td class='b'></td><td>PAGE_USE_SKETCHCS</td><td class='c'>8</td></tr>
<tr><td>PAGE_USE_LAYER_VISIBILITY</td><td class='c'>32</td><td class='b'></td><td></td><td class='c'></td></tr>
</tbody></table>


### Text \#leader_type \#leader_type=

See [Text#leader_type]

```ruby
leader = text.leader_type
text.leader_type = leader
```

<table class='sumd'><thead><tr>
<th class='l1'>leader</th><th class='c'>value</th>
</tr></thead><tbody>
<tr><td class='l1'>ALeaderModel</td><td class='c'>2</td></tr>
<tr><td class='l1'>ALeaderNone</td><td class='c'>0</td></tr>
<tr><td class='l1'>ALeaderView</td><td class='c'>1</td></tr>
</tbody></table>


### TextureWriter \#write

See [Texturewriter#write]

```ruby
tw = Sketchup.create_texture_writer
status = tw.write(entity, side, filename)
```

<table class='sumd'><thead><tr>
<th class='l1'>status return</th><th class='c'>value</th>
</tr></thead><tbody>
<tr><td class='l1'>FILE_WRITE_FAILED_INVALID_TYPE</td><td class='c'>1</td></tr>
<tr><td class='l1'>FILE_WRITE_FAILED_UNKNOWN</td><td class='c'>2</td></tr>
<tr><td class='l1'>FILE_WRITE_OK</td><td class='c'>0</td></tr>
</tbody></table>


### Tool \#onKeyDown, Tool \#onKeyUp

See [Tool#onKeyDown].  The constants are the key parameter, VK_PRIOR is 'Page Up',
VK_NEXT is 'Page Down'.

* A-Z keys return 65-90
* qwerty number keys are 48-57
* keypad number keys are 96-105

I could not get any information from the flags parameter. I would suggest using
keyUp and KeyDown to keep track of modifier key state.  The next section has
code that attaches to mouse and keyboard events.

```ruby
 def onKeyDown(key, repeat, flags, view)
```

<table class='sumd'><colgroup><col style='width:8.6em;' /><col /><col style='width:3em;'/><col style='width:8.6em;' /><col /></colgroup><thead><tr>
<th>key cb<br/>parameter</th><th class='c'><br/>value</th><th class='b'></th><th>key cb<br/>parameter</th><th class='c'><br/>value</th>
</tr></thead><tbody>
<tr><td>VK_ALT</td><td class='c'>18</td><td class='b'></td><td>VK_LEFT</td><td class='c'>37</td></tr>
<tr><td>VK_COMMAND</td><td class='c'>18</td><td class='b'></td><td>VK_MENU</td><td class='c'>18</td></tr>
<tr><td>VK_CONTROL</td><td class='c'>17</td><td class='b'></td><td>VK_NEXT</td><td class='c'>34</td></tr>
<tr><td>VK_DELETE</td><td class='c'>46</td><td class='b'></td><td>VK_PRIOR</td><td class='c'>33</td></tr>
<tr><td>VK_DOWN</td><td class='c'>40</td><td class='b'></td><td>VK_RIGHT</td><td class='c'>39</td></tr>
<tr class='t' ><td></td><td></td><td></td><td></td><td></td></tr>
<tr class='b1'><td></td><td></td><td class='b'></td><td></td><td></td></tr>
<tr><td>VK_END</td><td class='c'>35</td><td class='b'></td><td>VK_SHIFT</td><td class='c'>16</td></tr>
<tr><td>VK_HOME</td><td class='c'>36</td><td class='b'></td><td>VK_SPACE</td><td class='c'>32</td></tr>
<tr><td>VK_INSERT</td><td class='c'>45</td><td class='b'></td><td>VK_UP</td><td class='c'>38</td></tr>
</tbody></table>


### Tool \#onMouse

See [Tool #onLButtonDoubleClick].  A total of nine mouse button events exist:
up, down, and double click, for left, middle, and right buttons.
Under Windows:

* A user can click more than one button at once.
* The 'flags' bits for which buttons are pressed are **not set** on the 'Up'
    events for a single button press.
* On a double button press and release, a single down event will often fire,
    the the double. On release, first the **wrong button** will fire an
    event, the a 'blank' up event.
* 'Down' and 'Up' events fire first, then the 'DoubleClick' event fires.

All methods have the following for parameters -

```ruby
def onLButtonDown(flags, x, y, view)
# your code
end
```

Below is code that shows use of the constants, also some "doesn't quite work"
key code.  Located in the [template_code.rb] file. Load, then SUMD_TC.new.tool_1.

```ruby
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
```

<table class='sumd'><colgroup><col style='width:8.7em;' /><col /><col style='width:3em;'/><col style='width:8.7em;' /><col /></colgroup><thead><tr>
<th>flags cb<br/>parameter</th><th class='c'><br/>value</th><th class='b'></th><th>flags cb<br/>parameter</th><th class='c'><br/>value</th>
</tr></thead><tbody>
<tr><td>MK_ALT</td><td class='c'>32</td><td class='b'></td><td>MK_MBUTTON</td><td class='c'>16</td></tr>
<tr><td>MK_COMMAND</td><td class='c'>0</td><td class='b'></td><td>MK_RBUTTON</td><td class='c'>2</td></tr>
<tr><td>MK_CONTROL</td><td class='c'>8</td><td class='b'></td><td>MK_SHIFT</td><td class='c'>4</td></tr>
<tr><td>MK_LBUTTON</td><td class='c'>1</td><td class='b'></td><td></td><td class='c'></td></tr>
</tbody></table>


### Toolbar #get_last_state

See [Toolbar#get_last_state].

```ruby
state = toolbar.get_last_state
```

<table class='sumd'><thead><tr>
<th class='l1'>state return</th><th class='c'>value</th>
</tr></thead><tbody>
<tr><td class='l1'>TB_HIDDEN</td><td class='c'>0</td></tr>
<tr><td class='l1'>TB_NEVER_SHOWN</td><td class='c'>-1</td></tr>
<tr><td class='l1'>TB_VISIBLE</td><td class='c'>1</td></tr>
</tbody></table>


### UI.messagebox

See [UI.messagebox].  `MB_MULTILINE` shows a dialog with a scrollable text area
and an 'Okay' button.

```ruby
status = UI.messagebox(message, type)
```

<table class='sumd'><colgroup><col style='width:8.3em;' /><col /><col style='width:3em;'/><col style='width:14.1em;' /><col /></colgroup><thead><tr>
<th>status return</th><th class='c'>value</th><th class='b'></th><th>type parameter</th><th class='c'>value</th>
</tr></thead><tbody>
<tr><td>IDABORT</td><td class='c'>3</td><td class='b'></td><td>MB_ABORTRETRYIGNORE</td><td class='c'>2</td></tr>
<tr><td>IDCANCEL</td><td class='c'>2</td><td class='b'></td><td>MB_MULTILINE</td><td class='c'>16</td></tr>
<tr><td>IDIGNORE</td><td class='c'>5</td><td class='b'></td><td>MB_OK</td><td class='c'>0</td></tr>
<tr><td>IDNO</td><td class='c'>7</td><td class='b'></td><td>MB_OKCANCEL</td><td class='c'>1</td></tr>
<tr><td>IDOK</td><td class='c'>1</td><td class='b'></td><td>MB_RETRYCANCEL</td><td class='c'>5</td></tr>
<tr class='t' ><td></td><td></td><td></td><td></td><td></td></tr>
<tr class='b1'><td></td><td></td><td class='b'></td><td></td><td></td></tr>
<tr><td>IDRETRY</td><td class='c'>4</td><td class='b'></td><td>MB_YESNO</td><td class='c'>4</td></tr>
<tr><td>IDYES</td><td class='c'>6</td><td class='b'></td><td>MB_YESNOCANCEL</td><td class='c'>3</td></tr>
</tbody></table>


### View \#draw

See [View#draw]

```ruby
view = Sketchup.active_model.active_view
view.draw(mode, pts)
```

<table class='sumd'><colgroup><col style='width:11.7em;' /><col /><col style='width:3em;'/><col style='width:11.7em;' /><col /></colgroup><thead><tr>
<th>mode parameter</th><th class='c'>value</th><th class='b'></th><th>mode parameter</th><th class='c'>value</th>
</tr></thead><tbody>
<tr><td>GL_LINES</td><td class='c'>1</td><td class='b'></td><td>GL_QUADS</td><td class='c'>7</td></tr>
<tr><td>GL_LINE_LOOP</td><td class='c'>2</td><td class='b'></td><td>GL_QUAD_STRIP</td><td class='c'>8</td></tr>
<tr><td>GL_LINE_STRIP</td><td class='c'>3</td><td class='b'></td><td>GL_TRIANGLES</td><td class='c'>4</td></tr>
<tr><td>GL_POINTS</td><td class='c'>0</td><td class='b'></td><td>GL_TRIANGLE_FAN</td><td class='c'>6</td></tr>
<tr><td>GL_POLYGON</td><td class='c'>9</td><td class='b'></td><td>GL_TRIANGLE_STRIP</td><td class='c'>5</td></tr>
</tbody></table>


### View \#draw_text

See [View#draw_text].  These constants are used in SketchUp 2016+ and control
the text alignment.

<table class='sumd'><thead><tr>
<th class='l1'>:align value</th><th class='c'>value</th>
</tr></thead><tbody>
<tr><td class='l1'>TextAlignCenter</td><td class='c'>1</td></tr>
<tr><td class='l1'>TextAlignLeft</td><td class='c'>0</td></tr>
<tr><td class='l1'>TextAlignRight</td><td class='c'>2</td></tr>
</tbody></table>


### RUBY_ Constants, SketchUp Platform Constants

The following are RUBY_ and SketchUp constants which vary from version to version.

<table class='sumd'><thead><tr>
<th class='l1'>constant</th><th class='c1'>value</th><th>class</th>
</tr></thead><tbody>
<tr><td class='l1'>RUBY_COPYRIGHT</td><td class='c1'>ruby - Copyright (C) 1993-2013 Yukihiro Matsumoto</td><td>String</td></tr>
<tr><td class='l1'>RUBY_DESCRIPTION</td><td class='c1'>ruby 2.0.0p247 (2013-06-27) [i386-mingw32]</td><td>String</td></tr>
<tr><td class='l1'>RUBY_ENGINE</td><td class='c1'>ruby</td><td>String</td></tr>
<tr><td class='l1'>RUBY_PATCHLEVEL</td><td class='c1'>247</td><td>Fixnum</td></tr>
<tr><td class='l1'>RUBY_PLATFORM</td><td class='c1'>i386-mingw32</td><td>String</td></tr>
<tr class='t' ><td colspan='3'></td></tr>
<tr class='b1'><td colspan='3'></td></tr>
<tr><td class='l1'>RUBY_RELEASE_DATE</td><td class='c1'>2013-06-27</td><td>String</td></tr>
<tr><td class='l1'>RUBY_REVISION</td><td class='c1'>0</td><td>Fixnum</td></tr>
<tr><td class='l1'>RUBY_VERSION</td><td class='c1'>2.0.0</td><td>String</td></tr>
</tbody></table>


## Depreciated Constants

I believe the following are depreciated. VK_ constants should be used in their
place.  I tried the mask constants on both the key and flags parameters, and
nothing seemed to work.

<table class='sumd'><thead><tr>
<th class='l1'>constant</th><th class='c'>value</th>
</tr></thead><tbody>
<tr><td class='l1'>ALT_MODIFIER_KEY</td><td class='c'>18</td></tr>
<tr><td class='l1'>ALT_MODIFIER_MASK</td><td class='c'>32</td></tr>
<tr><td class='l1'>CONSTRAIN_MODIFIER_KEY</td><td class='c'>16</td></tr>
<tr><td class='l1'>CONSTRAIN_MODIFIER_MASK</td><td class='c'>4</td></tr>
<tr><td class='l1'>COPY_MODIFIER_KEY</td><td class='c'>17</td></tr>
<tr class='t' ><td colspan='2'></td></tr>
<tr class='b1'><td colspan='2'></td></tr>
<tr><td class='l1'>COPY_MODIFIER_MASK</td><td class='c'>8</td></tr>
</tbody></table>


The following have been replaced by namespaced constants.

<table class='sumd'><thead><tr>
<th class='l1'>constant</th><th class='c'>value</th>
</tr></thead><tbody>
<tr><td class='l1'>DimensionArrowClosed</td><td class='c'>3</td></tr>
<tr><td class='l1'>DimensionArrowDot</td><td class='c'>2</td></tr>
<tr><td class='l1'>DimensionArrowNone</td><td class='c'>0</td></tr>
<tr><td class='l1'>DimensionArrowOpen</td><td class='c'>4</td></tr>
<tr><td class='l1'>DimensionArrowSlash</td><td class='c'>1</td></tr>
</tbody></table>


## Yet to be added to documentation or unknown

<table class='sumd'><thead><tr>
<th class='l1'>constant</th><th class='c'>value</th>
</tr></thead><tbody>
<tr><td class='l1'>Sketchup::Pages::ImageEmbedded</td><td class='c'>0</td></tr>
<tr><td class='l1'>Sketchup::Pages::ImageEmbeddedAndLinked</td><td class='c'>1</td></tr>
<tr><td class='l1'>Sketchup::Pages::ImageLinked</td><td class='c'>2</td></tr>
<tr><td class='l1'>Sketchup::Pages::UnitsNormalizedX</td><td class='c'>2</td></tr>
<tr><td class='l1'>Sketchup::Pages::UnitsNormalizedY</td><td class='c'>1</td></tr>
<tr class='t' ><td colspan='2'></td></tr>
<tr class='b1'><td colspan='2'></td></tr>
<tr><td class='l1'>Sketchup::Pages::UnitsPixels</td><td class='c'>0</td></tr>
</tbody></table>

