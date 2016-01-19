@ECHO OFF

REM vundle requires git
WHERE git >nul 2>nul
IF %ERRORLEVEL% NEQ 0 ECHO Please install git first. && GOTO :EOF

REM vundle requires curl
WHERE curl >nul 2>nul
IF %ERRORLEVEL% NEQ 0 ECHO Please install curl first (see vundle windows install docs). && GOTO :EOF

REM If _vimrc file already exists, prompt user to overwrite it.
IF EXIST %USERPROFILE%\_vimrc (
    set /p OVERWRITEVIMRC=vimrc file already exists, do you want to overwrite it? [yn] 
    IF "%OVERWRITEVIMRC%" EQU "y" (
        move /Y %USERPROFILE%\_vimrc %USERPROFILE%\_vimrc_bak
    ) ELSE (
        ECHO Aborting...
        GOTO :EOF
    )
)

ECHO Copying new vimrc file.
copy .\files\vimrc %USERPROFILE%\_vimrc

SET VUNDLEDIR=%USERPROFILE%\vimfiles\bundle\

IF EXIST %VUNDLEDIR% (
    ECHO Removing existing vundle install
    rmdir /S/Q %VUNDLEDIR%
)

ECHO Installing vundle.
mkdir %VUNDLEDIR%
git clone https://github.com/VundleVim/Vundle.vim.git %USERPROFILE%\vimfiles\bundle\Vundle.vim

ECHO Installing plugins
vim +PluginInstall +qall

ECHO All done...
