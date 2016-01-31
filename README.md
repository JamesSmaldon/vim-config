# vim-config
My VIM Configuration

To install on windows, run:
```
install.bat
```

See also [VIM quick reference](quickref.md)

## Troubleshooting
### Vundle and gvim 7.3 on windows
Vundle does not work with vim 7.3 and produces all sorts of strange error
messages when running :PluginInstall, the solution is to upgrade to vim 7.4.

## VIM Quick Ref
### Pasting text into the command buffer
Yank the text you want to copy, then enter command mode and type:
```
<c-R> "
```

### Run shell command in windows without suspending vim
```
!start cmd /c "my app.exe" & pause
```
Calling it without the cmd part means you don't get to see 
the program output.
