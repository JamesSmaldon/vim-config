# Useful VIM tips

## Editing .vimrc
### Reload .vimrc without restarting vim
```
:so % "If you're editing it
:so $MYVIMRC "otherwise
```
## Searching
Find next occurance of the word under the cursor - '*'

## Pasting text into the command buffer
Yank the text you want to copy, then enter command mode and type:
```
<c-R> "
```

## Run shell command in windows without suspending vim
```
!start cmd /c "my app.exe" & pause
```
Calling it without the cmd part means you don't get to see 
the program output.

## Displaying and opening recent files
To list recently opened files - :ol[dfiles]
To list files and then prompt to open one - :bro[wse] ol[dfiles][1]
    The ! means discard the current buffer.

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
