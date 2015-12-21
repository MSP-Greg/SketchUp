# @title Template Symbols
[SUMD_Symbols]:../../SUMD_Symbols
<style scoped>
#filecontents p code { font-size:16px; }
\#filecontents table.sumd { border:none; border-collapse:collapse; margin-bottom:2em; background-color:transparent; line-height:1.5em; }
\#filecontents table.sumd tr     { border:none; background-color:transparent;}
\#filecontents table.sumd tr.e  td   { padding-top:0.8em; }
\#filecontents table.sumd tr.t  td   { padding-top:0.2em; }
\#filecontents table.sumd tr.b2 td   { padding-top:0.2em; border-top: 2px solid #bbb; }
\#filecontents table.sumd tr.b1 td   { padding-top:0.2em; border-top: 1px solid #bbb; }
\#filecontents table.sumd tr.b1 td.b { padding-top:0.2em; border-top: 1px solid transparent; }
\#filecontents table.sumd tr.clr { border-bottom:none; line-height:0.2em;}
\#filecontents table.sumd th { border:none; padding: 0px; background-color:transparent; border-bottom:2px solid #aaa; ; text-align:left;}
\#filecontents table.sumd td { border:none; padding: 0px; background-color:transparent;}
\#filecontents table.sumd th:empty { border:none; border-bottom:2px solid transparent; padding: 0px; background-color:transparent; text-align:left;}
\#filecontents table.sumd td.c, #filecontents table.sumd th.c { text-align:center;}
\#filecontents table.sumd td.r, #filecontents table.sumd th.r { text-align:right;}
</style>

# TOC Symbols

Symbols are used by Ruby for many purposes.  The names of all classes, methods,
attributes, constants and variables are all placed in Ruby's symbol table.

---
<%= hdr %>

---

* **This summary does not show symbols beginning with $, @, or @@.**

* **Global constants have also been omitted, please see the Constants List.**

<%= found %>

## Attribute Names

These are assumed to be attributes, due to there being sets of them (plain, ending
in '?', ending in '=').  Columns show whether one exists with '?' or '='.  If only
the '?' version exists, it is placed in the main column.

If an attribute has a symbol for both plain and a ? suffix, very often the plain
symbol 'method' **is not defined and will not work.**

<table class='sumd'>
<colgroup>
<col style='width: 1.5em;' />
<col style='width: 1.5em;' />
<col style='width:16.0em;' />
<col style='width: 5.0em;' />
<col style='width: 1.5em;' />
<col style='width: 1.5em;' />
<col style='width:16.0em;' />
</colgroup>
<%= _attribute %>
</table>

## Symbols - Lower Case 1st letter

These symbols are either method names or variables.

<table class='sumd'>
<colgroup>
<col style='width:18.0em;' />
<col style='width: 5.0em;' />
<col style='width:18.0em;' />
</colgroup>
<%= _method %>
</table>

## Symbols - Upper Case 1st letter

These symbols are mixed case, but all have a first capital letter.  They are
constants, and may be class or module names.

<table class='sumd'>
<colgroup>
<col style='width:19.0em;' />
<col style='width: 5.0em;' />
<col style='width:19.0em;' />
</colgroup>
<%= _class %>
</table>

## Symbols - All Upper Case

These symbols are all upper case.  They are constants, and may also be class or
module names.

<table class='sumd'>
<colgroup>
<col style='width:19.0em;' />
<col style='width: 5.0em;' />
<col style='width:19.0em;' />
</colgroup>
<%= _constant %>
</table>
