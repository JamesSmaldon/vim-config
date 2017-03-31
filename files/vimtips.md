# Useful VIM tips

# Commands
## Cheat Sheet
 * C-f when in command mode gives you the command history window.
 * C-r" pastes the buffer into the command
 * C-r/ pastes in the last search command

# Searching
## Cheat Sheet
 * Search forward/backword for exact word under the cursor - '*'/'#' e.g. whole words only
 * Search forward/backword for inexact word under the cursor - 'g*'/'g#'  
 * Search for selected text: y/C-r" (yank selection, start search, copy to command)

## Case sensitivity
 * set ignorecase: make all searches case insensitive.
 * for case insensitive/sensitive: /pattern\c /pattern\C

## Searching Across Files
 * :noautocmd vimgrep /pattern/gj **/*.js: Find all instances of pattern in *.js files recursively. Don't jump to first result.
    - The noautocmd stops vim from using autocmds to open the files, which is slow. 
 * :cw open the quickfix list to see results, this is global
 * :lw open the location list (for when you use lvimgrep), this is local to the current buffer.

## Search and Replace Across Files
 * You need to use the arglist for this:
```
:arg *.cpp 
:argadd *.h
:arg (list current args)
:argdo %s/pattern/replace/ge | update

## Pattern Searching
 * Copy current found word to the command line: press /, C-r, C-w
 * An empty pattern search will repeat the last search.
 * Add a number to find the nth occurance. E.g. 3/pattern will search for the 3rd occurance of pattern.
 * Find 3rd occurrance of word under cursor: 3*
 * Put cursor at end of next "hello" /hello/e

# Cutting and Pasting
## Pasting text into the command buffer
Yank the text you want to copy, then enter command mode and type:
```
<c-R> "
```
Yanking multiple things using a named register.
- You can select multiple lines etc by yanking the first one into a named buffer:
  ```
  "ay
  ```
  and then for the other lines using the uppercase register name to append rather than overwrite
  ```
  "Ay
  ```

# Auto completion
 * set complete-=i: Disable scanning of included files (which can be very slow)

# Marks
## Cheat Sheet

 * ma: set bookmark "a" in current file
 * mA: set global bookmark "A"
 * `a: go to bookmark "a" (line and col)
 * 'a: go to bookmark "a" (line only)
 * :marks: list current marks
 * ]`: jump to next lowercase mark
 * [`: jump to previous lowercase mark
 * `.: jump to position of last change in buffer.
 * ``: jump back to where you were before you jumped.
 * `0, `1,...,`9: jump to nth last file edited
 * `": jump to position where you last exited the file.
 * :delmarks!: delete all marks in the current buffer.

# Buffers
## Cheat Sheet

 * :buffers: List available buffers
 * :ls: Same as above
 * :bn: Switch to next buffer
 * :bp: Switch to previous buffer
 * :bfirst: Switch to first buffer
 * :blast: Switch to last buffer
 * :bdelete: Delete the current buffer
 * :badd: Open a new buffer with the filename that follows
 * :e: Edit another file in a new buffer and switch to it.

# Tabs
## Cheat Sheet
 * :tabs         list all tabs including their displayed windows
 * :tabm 0       move current tab to first
 * :tabm         move current tab to last
 * :tabm {i}     move current tab to position i+1
 * :tabn         go to next tab
 * :tabp         go to previous tab
 * :tabfirst     go to first tab
 * :tablast      go to last tab
 * :tabedit {file}   edit specified file in a new tab
 * :tabfind {file}   open a new tab with filename given, searching the 'path' to find it
 * :tabclose         close current tab
 * :tabclose {i}     close i-th tab
 * :tabonly          close all other tabs (show only the current tab)
 * :tab ball         show each buffer in a tab (up to 'tabpagemax' tabs)
 * :tab help         open a new help window in its own tab page
 * :tab drop {file}  open {file} in a new tab, or jump to a window/tab containing the file if there is one
 * :tab split        copy the current window to a new tab of its own
 * gt            go to next tab
 * gT            go to previous tab
 * {i}gt         go to tab in position i

# Windows
## Cheat Sheet
 * :sp: Split the current window in two. The same buffer will be shown in each window initially.
 * Precede the "sp" with a number to set the new window height.
 * :vs: Split the current window vertically. The same buffer will be shown in each window initially.
 * Precede the "vs" with a number to set the new window width.
 * CTRL-ww: Change focus to the next window
 * CTRL-w(movement): Change focus to the window in the direction (h,j,k,l) indicated
 * CTRL-wc: Close the current window
 * CTRL-w+: Increase size of current window
 * CTRL-w-: Decrease size of current window
 * CTRL-w=: Set all windows to equal size
 * #CTRL-w_: Sets the height to the size indicated by the preceding "#"
 * :only: Close all windows but the current one
 * CTRL-wn: Opens a new window with a new buffer

# Recent Files
## MRU plugin
 * :MRU - open most recently used files list.
 * :MRU <search term> - filter list by search term
 * In MRU list:
    * o to open the file, t to open in tab

## Built in functionality - Displaying and opening recent files
To list recently opened files - :ol[dfiles]
To list files and then prompt to open one - :bro[wse] ol[dfiles][1]
    The ! means discard the current buffer.

# Editing .vimrc
### Reload .vimrc without restarting vim
```
:so % "If you're editing it
:so $MYVIMRC "otherwise
```

# Running commands
## Run shell command in windows without suspending vim
```
!start cmd /c "my app.exe" & pause
```
Calling it without the cmd part means you don't get to see 
the program output.
