# @title 2013&nbsp;Collections
[SUMD_Collections]:../../SUMD_Collections
[RenderingOptions]:http://www.sketchup.com/intl/en/developer/docs/ourdoc/renderingoptions
<style scoped>
#filecontents p code { font-size:16px; }
\#filecontents table.sumd { border:none; border-collapse:collapse; margin-bottom:2em; line-height:1.6em; }
\#filecontents table.sumd thead  { border-bottom:2px solid #aaa; background-color:transparent;}
\#filecontents table.sumd tr     { border:none; background-color:transparent;}
\#filecontents table.sumd tr.clr { border-bottom:none; line-height:0.2em;}
\#filecontents table.sumd th { border:none; padding:0px; background-color:transparent; text-align:left;}
\#filecontents table.sumd td { border:none; padding:0px; background-color:transparent;}
\#filecontents table.sumd td:empty { border-top:1px solid #bbb; height:0.2em;}
\#filecontents table.sumd td.c, #filecontents table.sumd th.c { text-align:center;}
\#filecontents table.sumd td.r, #filecontents table.sumd th.r { text-align:right;}
</style>

# SketchUp 2013 Collections

This is a machine generated list of the collection objects defined by SketchUp
classes.  The links in this document are machine generated, so some may not exist.

---
Generated with [SUMD_Collections] v2.0, on 2015-12-19 at 01:09:16 AM GMT,
using SketchUp v13.0.4812 & Ruby v1.8.6.

---

The criteria is that a class has `.each` defined as a public method.  Note that
`.each` is an Array method and **is not** a method of Enumerable.

The classes can be divided into two groups:

* 'Live' read-only collections of objects, with factory methods to add new
members.  All include Enumerable, and all suport indexed retrieval, although
order/position may vary from call to call.

* 'Hash' like collections where items cannot be added or removed.  An example
would be [RenderingOptions].

Typically 'Live' collections have a `.length` property that is more of a method
or a numeric object (as opposed to a value).  The following code shows a change
in the length of entities as the two faces are added.

```ruby
am_ents = Sketchup.active_model.entities
s = 300
f1 = [ 0, 0, 0 ] , [ 0, s, 0 ] , [ s, s, 0 ] , [ s, 0, 0 ]
f2 = [ 0, 0, s ] , [ 0, s, s ] , [ s, s, s ] , [ s, 0, s ]

puts "am_ents.length = #{am_ents.length}"
am_ents.add_face( f1 )
puts "am_ents.length = #{am_ents.length}"
am_ents.add_face( f2 )
puts "am_ents.length = #{am_ents.length}"
```

What this means is that it will often be faster to make a copy of the collection
using `.to_a` if you are looping thru the whole collection.  `.grep()` will do the
same thing if you only need a subset.  You may find `.to_a.grep()` to be faster.

<table class='sumd'>
<colgroup>
<col style='width:16.0em;' />
<col style='width: 4.0em;' />
<col style='width: 4.0em;' />
<col style='width: 3.0em;' />
<col style='width: 3.5em;' />
<col style='width: 7.0em;' />
<col style='width: 9.0em;' />
</colgroup>
<thead><tr><th>Object</th><th class='c'>Enum</th><th class='c'>#each</th><th class='c'>#[]</th><th class='c'>#[]=</th><th class='c'>#each_pair</th><th>Super</th></tr></thead><tbody>
<tr><td><a href='http://www.sketchup.com/intl/en/developer/docs/ourdoc/attributedictionaries'>Sketchup::AttributeDictionaries</a></td><td class='c'>Yes</td><td class='c'>Y</td><td class='c'>Y</td><td class='c'> </td><td class='c'> </td><td>Sketchup::Entity</td></tr>
<tr><td><a href='http://www.sketchup.com/intl/en/developer/docs/ourdoc/attributedictionary'>Sketchup::AttributeDictionary</a></td><td class='c'>Yes</td><td class='c'>Y</td><td class='c'>Y</td><td class='c'>Y</td><td class='c'>Y</td><td>Sketchup::Entity</td></tr>
<tr><td><a href='http://www.sketchup.com/intl/en/developer/docs/ourdoc/definitionlist'>Sketchup::DefinitionList</a></td><td class='c'>Yes</td><td class='c'>Y</td><td class='c'>Y</td><td class='c'> </td><td class='c'> </td><td>Sketchup::Entity</td></tr>
<tr><td><a href='http://www.sketchup.com/intl/en/developer/docs/ourdoc/entities'>Sketchup::Entities</a></td><td class='c'>Yes</td><td class='c'>Y</td><td class='c'>Y</td><td class='c'> </td><td class='c'> </td><td>Object</td></tr>
<tr><td><a href='http://www.sketchup.com/intl/en/developer/docs/ourdoc/extensionsmanager'>Sketchup::ExtensionsManager</a></td><td class='c'>Yes</td><td class='c'>Y</td><td class='c'>Y</td><td class='c'> </td><td class='c'> </td><td>Object</td></tr>
<tr class='clr'><td>&#160;</td><td>&#160;</td><td>&#160;</td><td>&#160;</td><td>&#160;</td><td>&#160;</td><td>&#160;</td></tr>
<tr><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr>
<tr><td><a href='http://www.sketchup.com/intl/en/developer/docs/ourdoc/layers'>Sketchup::Layers</a></td><td class='c'>Yes</td><td class='c'>Y</td><td class='c'>Y</td><td class='c'> </td><td class='c'> </td><td>Sketchup::Entity</td></tr>
<tr><td><a href='http://www.sketchup.com/intl/en/developer/docs/ourdoc/materials'>Sketchup::Materials</a></td><td class='c'>Yes</td><td class='c'>Y</td><td class='c'>Y</td><td class='c'> </td><td class='c'> </td><td>Sketchup::Entity</td></tr>
<tr><td><a href='http://www.sketchup.com/intl/en/developer/docs/ourdoc/optionsmanager'>Sketchup::OptionsManager</a></td><td class='c'>Yes</td><td class='c'>Y</td><td class='c'>Y</td><td class='c'> </td><td class='c'> </td><td>Object</td></tr>
<tr><td><a href='http://www.sketchup.com/intl/en/developer/docs/ourdoc/optionsprovider'>Sketchup::OptionsProvider</a></td><td class='c'>Yes</td><td class='c'>Y</td><td class='c'>Y</td><td class='c'>Y</td><td class='c'>Y</td><td>Object</td></tr>
<tr><td><a href='http://www.sketchup.com/intl/en/developer/docs/ourdoc/pages'>Sketchup::Pages</a></td><td class='c'>Yes</td><td class='c'>Y</td><td class='c'>Y</td><td class='c'> </td><td class='c'> </td><td>Sketchup::Entity</td></tr>
<tr class='clr'><td>&#160;</td><td>&#160;</td><td>&#160;</td><td>&#160;</td><td>&#160;</td><td>&#160;</td><td>&#160;</td></tr>
<tr><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr>
<tr><td><a href='http://www.sketchup.com/intl/en/developer/docs/ourdoc/renderingoptions'>Sketchup::RenderingOptions</a></td><td class='c'>Yes</td><td class='c'>Y</td><td class='c'>Y</td><td class='c'>Y</td><td class='c'>Y</td><td>Sketchup::Entity</td></tr>
<tr><td><a href='http://www.sketchup.com/intl/en/developer/docs/ourdoc/selection'>Sketchup::Selection</a></td><td class='c'>Yes</td><td class='c'>Y</td><td class='c'>Y</td><td class='c'> </td><td class='c'> </td><td>Object</td></tr>
<tr><td><a href='http://www.sketchup.com/intl/en/developer/docs/ourdoc/shadowinfo'>Sketchup::ShadowInfo</a></td><td class='c'>Yes</td><td class='c'>Y</td><td class='c'>Y</td><td class='c'>Y</td><td class='c'>Y</td><td>Sketchup::Entity</td></tr>
<tr><td><a href='http://www.sketchup.com/intl/en/developer/docs/ourdoc/styles'>Sketchup::Styles</a></td><td class='c'>Yes</td><td class='c'>Y</td><td class='c'>Y</td><td class='c'> </td><td class='c'> </td><td>Sketchup::Entity</td></tr>
<tr><td><a href='http://www.sketchup.com/intl/en/developer/docs/ourdoc/set'>Set</a></td><td class='c'> </td><td class='c'>Yes</td><td class='c'> </td><td class='c'> </td><td class='c'> </td><td>Object</td></tr>
<tr class='clr'><td>&#160;</td><td>&#160;</td><td>&#160;</td><td>&#160;</td><td>&#160;</td><td>&#160;</td><td>&#160;</td></tr>
<tr><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr>
<tr><td><a href='http://www.sketchup.com/intl/en/developer/docs/ourdoc/toolbar'>UI::Toolbar</a></td><td class='c'>Yes</td><td class='c'>Y</td><td class='c'> </td><td class='c'> </td><td class='c'> </td><td>Object</td></tr>
</tbody>
</table>
