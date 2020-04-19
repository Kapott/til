# VIM Basics

Just some mnemonics for vim. Vim is actually a 'language' which you can type and use as you see fit. These mnemonics really bring it home for me when I'm working in it.

The notes in this file are really just the basics - but even then it's nice to revisit them every now and again, as there are things in here I still forget every now and again.


Tips

- If you cannot repeat your action with `.` -  then you should probably learn how to express it with `.`
- Prefer text-objects (`iw`) over motions (`w`) for improved repeatability.
- Visual mode is a smell, breaks repeatability.


Structure

- a command is: <number> <command><text object or motion>
- number (optional) performs command over text obj or motion
- command is the operation (change, delete, yank)
- text object or motion can be text construct (word, sentence, paragraph) or motion (forward a lone, back a page, end of line)
- editing command is command + text obj/motion

Commands are repeatable and undoable

- `u`ndo, `U` (shift-U) redo it.
- `.` repeat last command

General mnemonics: motions

- `i`nside/ `i`nner
- `a`ll of
- `d`elete (and leave copy in anonymous buffer)
- `c`hange (delete and enter insert mode)
- `>`indent
- `v`isually select
- `y`ank (copy, leaves copy in anonymous buffer))
- `w`ord (alphanumeric)
- `W`ORD (alphanumeric, includes typographic chars like commas and dots)
- `b`ack by a word
- `r`eplace
- `x`delete (to X out)
- `f`/`F`ind next character e.g. `f(` moves to next `(`
- `t`/`T` Find up `t`o character (doesn't include character, stops before)
- `/` search up to the next match `/se` will go to the first occurrence of 'se', shift `/`, or `?` will do this as well, but backwards.


General mnemonics: Text objects

- `aw` a word (includes surrounding whitespace
- `iw` inner word (does not include surrounding whitespace)
- `it / at`inner tag / a tag 
- `i"` inner quoted string, also works for `'` 
- `a"` a quoted string
- `a)` a parenthesized block
- `i)` inner parenthesized block
- `ip / ap`paragraph
- `is / as` sentence



Movement within file

- `G` go to last line
- `gg` go to first line
- `` moves back to the last position/edit



Screen movement

- [`u`]p (half a screen, ctrl + u)
- [`d`]own (half a screen, ctrl + d)
- [`f`]orward (an entire screen, ctrl + f)
- [`b`]ack (an entire screen, ctrl +b)



Cursor movement within the screen

- [`H`]ome
- [`M`]iddle
- [`L`]ast



Text block movement

- Sentence, beginning and end:  `(`  `)`
- Paragraphs, beginning and end: `{` `}`
- `%` to navigate between related items (brackets, comments etc)



Word movement

- next [`w`]ord
- [`e`]nd of next word



Examples:

- delete entire word: `daw` (delete all of word)
- change inside brackets: `ci]`
- change find ' : `cf'` - delete everything up to `'` and go to insert mode
- change find 'other' - `c/other` - delete everything up to 'other' and go into insert mode
- relativenumber on: change 6 down - `c6j`



## Vim diff

Left is local, right is HEAD

- `[c` and `]c` - previous `c`hangeset, next `c`hangeset
-  `d`iff `o`btain - Get from HEAD to local
- `d`iff `put` - Set from local to HEAD
- `:diffup` updates the coloring when stuff goes awkward
- Remember: `u`ndo only works in the _affected_ window










































































