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
