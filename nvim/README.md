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

# setup
Run the `setup.sh` script in your home directory.

*or*

Run these commands in order in your home directory:

> ***Note:*** Installing `ripgrep` may work differently in some distros

1. `sudo apt-get install ripgrep`
2. `git clone --depth 1 https://github.com/kubgus/nvim ~/.config/nvim`
3. `git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim`
4. `curl -L https://github.com/neovim/neovim/releases/download/v0.9.5/nvim-linux64.tar.gz > nvim-linux64.tar.gz`
5. `tar xvzf nvim-linux64.tar.gz`
6. `rm nvim-linux64.tar.gz`
7. `sudo mv nvim-linux64 /bin`
8. `sudo ln -s /bin/nvim-linux64/bin/nvim /bin/nvim`
9. `nvim ~/.config/nvim`

Ignore runtime errors (press Enter multiple times) and follow these instrustions to correctly load the configuration:

> ***Important:*** This part is required even if installed with `setup.sh`

1. Navigate to `./lua/kubgus` and open files one by one, running `:so` each time (if you get an error, skip the file and return to it after completing the rest)
2. Run `:PackerSync` anywhere in the environment
3. Navigate to `./after/plugin` and run the `:so` command in the same fashion as the previous step

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

<kbd>c</kbd> - Replace
- Same as <kbd>d</kbd>, but enters insert mode

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
