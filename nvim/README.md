# nvim config

My personal NeoVim configuration files.

## prerequisites
- nvim not installed (installation happens later)
- ripgrep installed
- node.js (& npm) installed

> ***Note:*** Don't forget to `sudo apt-get update`

## features
- [x] lsp
- [x] treesitter
- [x] telescope
- [x] undotree
- [x] fugitive
- [x] custom theme
- [x] lualine

# learn vim (and this config)

[ThePrimeagen's guide](https://www.youtube.com/playlist?list=PLm323Lc7iSW_wuxqmKx_xxNtJC_hJbQ7R)

> ***Note:*** Shift key is substituted with the letter being uppercase

## vim motions

Can be used in *normal mode*.

> ***Note:*** Some command-motion combos are present for their fundamental nature

### basic

<kbd>h</kbd> - Move cursor left

<kbd>j</kbd> - Move cursor down

<kbd>k</kbd> - Move cursor up

<kbd>l</kbd> - Move cursor right


<kbd>w</kbd> - Move cursor to start of next word

<kbd>W</kbd> - Move cursor to start of next word (incl. punc.)


<kbd>b</kbd> - Opposite of <kbd>w</kbd> (previous word)

<kbd>B</kbd> - Opposite of <kbd>W</kbd> (previous word)


<kbd>e</kbd> - Move cursor to end of next word

<kbd>E</kbd> - Move cursor to end of next word


<kbd>g</kbd><kbd>e</kbd> - Move cursor to end of previous word


<kbd>$</kbd> - Move cursor to the end of the line

<kbd>_</kbd> - Move cursor to the first non-whitespace character of the line

<kbd>0</kbd> - Move cursor to the beginning of the line


<kbd>g</kbd><kbd>g</kbd> - Move to the first line of the document

<kbd>G</kbd> - Move to the last line of the document


<kbd>i</kbd> - Enter insert mode to the left of cursor

<kbd>I</kbd> - Enter insert mode at the beginning of the line

<kbd>a</kbd> - Enter insert mode at the right of the cursor

<kbd>A</kbd> - Enter insert mode at the end of the line

<kbd>o</kbd> - Create a new line below the cursor and enter insert mode on it

<kbd>O</kbd> - Create a new line above the cursor and enter insert mode on it


<kbd>v</kbd> - Enter visual (select) mode

<kbd>V</kbd> - Enter visual line (line select) mode


<kbd>p</kbd> - Paste contents of yank buffer after the cursor

<kbd>P</kbd> - Paste contents of yank buffer before the cursor


<kbd>u</kbd> - Undo

<kbd>Ctrl</kbd> + <kbd>r</kbd> - Redo


<kbd>Ctrl</kbd> + <kbd>d</kbd> - Half page scroll down

<kbd>Ctrl</kbd> + <kbd>u</kbd> - Half page scroll up

### intermediate

<kbd>x</kbd> - Delete single character (writes to yank buffer)


<kbd>Y</kbd> - Yank to end of line (same as <kbd>y</kbd><kbd>$</kbd>)

<kbd>D</kbd> - Delete to end of line (same as <kbd>d</kbd><kbd>$</kbd>)


<kbd>r</kbd> - Replace single character at cursor

<kbd>R</kbd> - Enter replace mode


<kbd>}</kbd> - Move cursor forward by paragraph

<kbd>{</kbd> - Move cursor backward by paragraph

<kbd>)</kbd> - Similar to <kbd>}</kbd> (figure it out)

<kbd>(</kbd> - Similar to <kbd>{</kbd> (figure it out)


<kbd>f</kbd><kbd>[any]</kbd> - Move cursor to the next instance of `[any]` character in the line

<kbd>F</kbd><kbd>[any]</kbd> - Opposite of <kbd>f</kbd> (previous instance of `[any]`)

<kbd>t</kbd><kbd>[any]</kbd> - Move cursor up to the next instance of `[any]` character in the line

<kbd>T</kbd><kbd>[any]</kbd> - Opposite of <kbd>t</kbd> (previous instance of `[any]`)


<kbd>;</kbd> - Move forward in searching the line (<kbd>f</kbd>, <kbd>F</kbd>, <kbd>t</kbd>, <kbd>T</kbd>)

<kbd>,</kbd> - Opposite of <kbd>;</kbd> (move backward)


<kbd>/</kbd> - Load word into the search term (press <kbd>Enter</kbd> to confirm)

<kbd>?</kbd> - Same as <kbd>/</kbd>, but searches backwards and flips the controls


<kbd>*</kbd> - Load current cursor word into the search term (like when using <kbd>/</kbd>)

<kbd>#</kbd> - Load current cursor word into the search term (like when using <kbd>?</kbd>)


<kbd>n</kbd> - Move forward in searching the document (search term)

<kbd>N</kbd> - Opposite of <kbd>n</kbd> (move backward)

## vim commands

<kbd>y</kbd> - Yank (Copy) *(Yoink)*
- Combine with itself to yank the whole line
- Combine with any other motion to yank from the old to new cursor position
- Yanking puts the deleted contents into the yank buffer

<kbd>d</kbd> - Delete
- Combine with itself to delete the whole line
- Combine with any other motion to delete from the old to new cursor position
- Deleting puts the deleted contents into the yank buffer
- By pressing <kbd>"</kbd><kbd>_</kbd> before this command, it will not write into the yank buffer

<kbd>c</kbd> - Change (Replace)
- Same as <kbd>d</kbd>, but enters insert mode

<kbd>g</kbd> - Go (To)
- Move cursor
- Combine with itself to go to a specified line - <kbd>[line]</kbd><kbd>g</kbd><kbd>g</kbd>
- Other combinations: ([see more](https://vimdoc.sourceforge.net/htmldoc/vimindex.html#g))
    - <kbd>g</kbd><kbd>d</kbd> - Go to definition
    - <kbd>g</kbd><kbd>e</kbd> - Go to end of previous word
    - <kbd>g</kbd><kbd>E</kbd> - Go to end of previous word (incl. punc.)

<kbd>=</kbd> - Correct indentation
- Combine with itself to correct the current line's indentation
- Combine with any other motion to correct indentation from the old to new cursor position

<kbd>></kbd> - Indent
- Combine with itself to indent the current line
- Combine with any other motion to indent from the old to new cursor position

<kbd><</kbd> - De-indent
- Reverse of <kbd>></kbd>

## config specific

`-- VISUAL --` <kbd>J</kbd> - Move selected text down

`-- VISUAL --` <kbd>K</kbd> - Move selected text up


<kbd>Space</kbd><kbd>y</kbd> - Yank to system clipboard

<kbd>Space</kbd><kbd>Y</kbd> - Yank from cursor to end of line to system clipboard

<kbd>Space</kbd><kbd>d</kbd> - Same as <kbd>"</kbd><kbd>_</kbd><kbd>d</kbd>

Find more in the `lua/kubgus/remap.lua` file!

### navigator keymaps (copy)

| mode | key             | function                                                   |
| ---- | --------------- | ---------------------------------------------------------- |
| n    | gr              | async references, definitions and context                  |
| n    | \<Leader>gr     | show reference and context                                 |
| i    | \<m-k\>         | signature help                                             |
| n    | \<c-k\>         | signature help                                             |
| n    | gW              | workspace symbol fuzzy finder                              |
| n    | gD              | declaration                                                |
| n    | gd              | definition                                                 |
| n    | gt              | type definition                                            |
| n    | g0              | document symbol                                            |
| n    | \<C-]\>         | go to definition (if multiple show listview)               |
| n    | gp              | definition preview (show Preview)                          |
| n    | gP              | type definition preview (show Preview)                     |
| n    | \<C-LeftMouse\> | definition                                                 |
| n    | g\<LeftMouse\>  | implementation                                             |
| n    | \<Leader>gt     | treesitter document symbol                                 |
| n    | \<Leader\>gT    | treesitter symbol for all open buffers                     |
| n    | \<Leader\> ct   | ctags symbol search                                        |
| n    | \<Leader\> cg   | ctags symbol generate                                      |
| n    | K               | hover doc                                                  |
| n    | \<Space\>ca     | code action (when you see 🏏 )                             |
| n    | \<Space\>la     | code lens action (when you see a codelens indicator)       |
| v    | \<Space\>ca     | range code action (when you see 🏏 )                       |
| n    | \<Space\>rn     | rename with floating window                                |
| n    | \<Leader\>re    | rename (lsp default)                                       |
| n    | \<Leader\>gi    | hierarchy incoming calls                                   |
| n    | \<Leader\>go    | hierarchy outgoing calls                                   |
| n    | \<Space\>ff     | format buffer (LSP)
| v    | \<Space\>ff     | format selection range (LSP)
| n    | gi              | implementation                                             |
| n    | \<Space\> D     | type definition                                            |
| n    | gL              | show line diagnostic                                       |
| n    | gG              | show diagnostic for all buffers                            |
| n    | ]d              | next diagnostic                                            |
| n    | [d              | previous diagnostic                                        |
| n    | \<Leader\> dt   | diagnostic toggle(enable/disable)                          |
| n    | ]r              | next treesitter reference/usage                            |
| n    | [r              | previous treesitter reference/usage                        |
| n    | \<Space\> wa    | add workspace folder                                       |
| n    | \<Space\> wr    | remove workspace folder                                    |
| n    | \<Space\> wl    | print workspace folder                                     |
| n    | \<Leader\>k     | toggle reference highlight                                 |
| i/n  | \<C-p\>         | previous item in list                                      |
| i/n  | \<C-n\>         | next item in list                                          |
| i/n  | number 1~9      | move to ith row/item in the list                           |
| i/n  | \<Up\>          | previous item in list                                      |
| i/n  | \<Down\>        | next item in list                                          |
| n    | \<Ctrl-w\>j     | move cursor to preview (windows move to bottom view point) |
| n    | \<Ctrl-w\>k     | move cursor to list (windows move to up view point)        |
| i/n  | \<C-o\>         | open preview file in nvim/Apply action                     |
| n    | \<C-v\>         | open preview file in nvim with vsplit                      |
| n    | \<C-s\>         | open preview file in nvim with split                       |
| n    | \<Enter\>       | open preview file in nvim/Apply action                     |
| n    | \<ESC\>         | close listview of floating window                          |
| i/n  | \<C-e\>         | close listview of floating window                          |
| n    | \<C-q\>         | close listview and send results to quickfix                |
| i/n  | \<C-b\>         | previous page in listview                                  |
| i/n  | \<C-f\>         | next page in listview                                      |
| i/n  | \<C-s\>         | save the modification to preview window to file            |
