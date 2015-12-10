# @title 2013 Collections Info
[CreateSUCollections]:CreateSUCollections.html
[RenderingOptions]:http://www.sketchup.com/intl/en/developer/docs/ourdoc/renderingoptions
<style scoped>
\#filecontents table.gjl15 { border:none; border-collapse:collapse; margin-bottom:2em;}
\#filecontents table.gjl15 thead  { border-bottom:2px solid #aaa; background-color:transparent;}
\#filecontents table.gjl15 tr     { border:none; background-color:transparent;}
\#filecontents table.gjl15 tr.clr { border-bottom:none; line-height:0.2em;}
\#filecontents table.gjl15 td:empty { border-top:1px solid #bbb; height:0.2em;}
\#filecontents table.gjl15 th { border:none; padding:0.2em 0.3em 0.2em 0.3em; background-color:transparent; text-align:left;}
\#filecontents table.gjl15 td { border:none; padding:0.2em 0.3em 0.2em 0.3em; background-color:transparent;}
\#filecontents table.gjl15 td.c, #filecontents table.gjl15 th.c { text-align:center;}
\#filecontents table.gjl15 td.r, #filecontents table.gjl15 th.r { text-align:right;}
</style>

# SketchUp 2013 Collections Info

This is a machine generated list of the collection objects defined by SketchUp
classes.  The links in this document are machine generated, so some may not exist.

---
Generated with [CreateSUCollections] v1.4, on 2015-12-10 at 05:48:19 AM GMT, using SketchUp v13.0.4812 & Ruby 1.8.6.


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
face1 = [   0,   0,   0 ],[   0, 300,   0 ],[ 300, 300,   0 ],[ 300,   0,   0 ]
face2 = [   0,   0, 300 ],[   0, 300, 300 ],[ 300, 300, 300 ],[ 300,   0, 300 ]

puts "am_ents.length = #{am_ents.length}"
am_ents.add_face( face1 )
puts "am_ents.length = #{am_ents.length}"
am_ents.add_face( face2 )
puts "am_ents.length = #{am_ents.length}"
```

What this means is that it will often be faster to make a copy of the collection
using `.to_a` if you are looping thru the whole collection.  `.grep()` will do the
same thing if you only need a subset.  You may find `.to_a.grep()` to be faster.

<table class='gjl15'>
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
