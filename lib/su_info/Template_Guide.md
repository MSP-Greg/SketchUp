# @title Guide_Title
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
[CreateSUConstantsGuide]:CreateSUConstantsGuide.html

<style scoped>
#filecontents table.gjl15 { border:none; border-collapse:collapse; margin-bottom:2em;}
#filecontents table.gjl15 thead { border-bottom:2px solid #aaa; background-color:transparent;}
#filecontents table.gjl15 tr    { border:none; background-color:transparent;}
#filecontents table.gjl15 tr:nth-child(5n) { border-bottom:1px solid #bbb;}
#filecontents table.gjl15 th { border:none; padding: 2px 10px 2px 3px; background-color:transparent; text-align:left;}
#filecontents table.gjl15 td { border:none; padding: 2px 10px 2px 3px; background-color:transparent;}
#filecontents table.gjl15 td.c, #filecontents table.gjl15 th.c { text-align:center;}
#filecontents table.gjl15 td.r, #filecontents table.gjl15 th.r { text-align:right;}
#filecontents table.gjl15 td.clr, #filecontents table.gjl15 th.clr { border-bottom:none; width:10em;}
</style>

# Guide_TOC

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
<< hdr >>
---

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

<< DimensionArrow >>

### DimensionLinear \#aligned_text_position \#aligned_text_position=

Defined on [Sketchup::DimensionLinear].  See [DimensionLinear#aligned_text_position].

```ruby
at_pos = dim.aligned_text_position
dim.aligned_text_position = at_pos
```

<< Dim_aligned_text >>

### DimensionLinear \#text_position \#text_position=

Defined on [Sketchup::DimensionLinear].  See [DimensionLinear#text_position].

```ruby
text_pos = dim.text_position
dim.text_position = text_pos
```

<< Dim_text_pos >>

### Entities \#add_faces_from_mesh

Defined on [Geom::PolygonMesh].  See [Entities#add_faces_from_mesh].

```ruby
ame = Sketchup.active_model.entities
ame.add_faces_from_mesh(pm, smooth_flags, material)
```

<< from_mesh >>

### Face \#classify_point

Defined on [Sketchup::Face].  See [Face#classify_point].

```ruby
pt_location = face.classify_point(pt)
```
The below code sample is in the Template_Guide_Code.rb file. Load, then GuideCode.new.face_1.

```ruby
<< code_face_1 >>
```

<< face_classify_point >>

### Importer \#load_file

Defined on [Sketchup::Importer].  See [Importer#load_file].  These are returned to
SketchUp when your importer is finished with processing.  Note the following is not
included --

5 = SketchUp version not supported (no additional dialog shown)

```ruby
class YourImporter < Sketchup::Importer
  def load_file(file_path, status)
    return status_code
  end
end
```

<< importer >>

### Length 'UnitsOptions' OptionsProvider

Defined on [Length].  See [Model#options], [OptionsManager],
[OptionsManager#&#91;&#93;] and [OptionsProvider].

First, SketchUp.com does not list all of the keys used in [OptionsManager] and
[OptionsProvider].  The below table shows all of the keys.

<< OptionsManager >>

These constants are used with the 'UnitsOptions' [OptionsProvider].  In the two
following code lines, units and format have constant equivalents.

```ruby
am = Sketchup.active_model
units  = am.options['UnitsOptions']['LengthUnit']
format = am.options['UnitsOptions']['LengthFormat']
```

The following code creates two hashes that make use of the Length:: constants,
queries the two settings, and outputs to the console.  It's in the
Template_Guide_Code.rb file. Load, then GuideCode.new.len_1.

```ruby
<< code_len_1 >>
```

<< Length:: >>

### Model \#save \#save_copy

Defined on [Sketchup::Model].  See [Model#save] and [Model#save_copy].

```ruby
# version param +2014, if omitted, saves in current version
status = model.save(filename, version)
status = model.save_copy(filename, version)
```

<< model_save >>

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

The following code lists all of the [RenderingOptions] constants and values, then
creates a hash from all of the [RenderingOptions] keys.  It then adds a
[RenderingOptionsObserver] to the current model.  The observer outputs to the
console the [onRenderingOptionsChanged] callback's type parameter and the constant
associated with it, along any [RenderingOptions] changes. One can change
[RenderingOptions] thru the UI and see what's going on, especially if UI operations
do not have constants or keys. The code sample is in the Template_Guide_Code.rb file.
Load, then GuideCode.new.ro_1.

```ruby
<< code_ro_1 >>
```

The above code does not make use of the constants, so the below code shows one
way of creating an observer.  The callback uses some constants (items in 'view'
menu and toolbar) in a case statement.  Similar code could be used in a plug-in.
This code sample is GuideCode.new.ro_2.

```ruby
<< code_ro_2 >>
```

The following table lists [RenderingOptions] keys which fire callbacks in a
[RenderingOptionsObserver] [onRenderingOptionsChanged] callback.  As
mentioned, some keys generate more than one callback, and, any row with
'** Missing, type =' in the 'Observer constant (type)' column fired a callback,
but there isn't a [RenderingOptions] constant with that value.  It is sorted by
RenderingOption value.class, RenderingOption key, and Constant name.  Duplicate
values are shown bolded.  Note that since these seem to have a many-to-many
relationship, the testing done may not show all combinations.

<< RenderingOptions >>
<< RenderingOptions_no_fire >>
<< RenderingOptions_no_cb >>

## Global Object Constants

### Geometry Class constants

These constants can be used anywhere instances of their respective classes are used.

<< Geometry >>

### Other object constants

The only other object constant defined is [Sketchup::Console].

```ruby
SKETCHUP_CONSOLE.write("this way also")
```

<< other_object >>

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

<< cmd_alpha >>

<< cmd_numeric >>

### Sketchup.set_status_text

See [Sketchup.set_status_text].  Text can be placed in three different locations.
The constants define the location.

```ruby
result = Sketchup.set_status_text("This is a Test", SB_VCB_VALUE)
result = Sketchup.set_status_text(status, position)
```

<< SB_ >>

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

<< command_set_validation_proc >>

### Definition \#behavior \#snapto

See [Behavior#snapto].  To quote SU help, 'The Behavior class is used to control
the "behavior" of components'.

```ruby
snap_to = behavior.snapto
behavior.snapto = snap_to
```

<< SnapTo_ >>

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

<< page_use >>

### Text \#leader_type \#leader_type=

See [Text#leader_type]

```ruby
leader = text.leader_type
leader = Text.leader_type = leader
```

<< ALeader >>

### TextureWriter \#write

See [Texturewriter#write]

```ruby
tw = Sketchup.create_texture_writer
status = tw.write(entity, side, filename)
```

<< texture_writer_write >>

### Tool \#onKeyDown, Tool \#onKeyUp

See [Tool#onKeyDown].  The constants are the key parameter, VK_PRIOR is 'Page Up',
VK_NEXT is 'Page Down'.

* A-Z keys return 65-90
* qwerty number keys are 48-57
* keypad number keys are 96-105

I could not get any information from the flags parameter. I would suggest using
keyUp and KeyDown to keep track of modifier key state.  The next section has code
that attaches to mouse and keybaord events.

```ruby
 def onKeyDown(key, repeat, flags, view)
```

<< tool_key >>

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

Below is code that shows use of the constants, also some "does't quite work"
key code.  Located in the Template_Guide_Code.rb file. Load, then GuideCode.new.tool_1.

```ruby
<< code_tool_1 >>
```

<< tool_mse >>

### Toolbar #get_last_state

See [Toolbar#get_last_state].

```ruby
state = toolbar.get_last_state
```

<< TB_ >>

### UI.messagebox

See [UI.messagebox].  `MB_MULTILINE` shows a dialog with a scrollable text area
and an 'Okay' button.

```ruby
status = UI.messagebox(message, type)
```

<< ui_mb_type >>
<< ui_mb_ret >>

### View \#draw

See [View#draw]

```ruby
view = Sketchup.active_model.active_view
view.draw(mode, pts)
```

<< view_draw >>

### View \#draw_text

See [View#draw_text].  These constants are used in SketchUp 2016+ and control the
text alignment.

<< view_draw_text >>

### RUBY_ Constants, SketchUp Platform Constants

The following are _RUBY and SketchUp constants which vary from version to version.

<< RUBY_ >>

## Depreciated Constants

I beleieve the following are depreciated. VK_ constants should be used in their
place.  I tried the mask constants on both the key and flags parameters, and
nothing seemed to work.

<< depreciated_constants_1 >>

The following have been replaced by namespaced constants.

<< depreciated_constants_2 >>

## Yet to be added to documentation or unknown

<< yet_to_be_added >>
