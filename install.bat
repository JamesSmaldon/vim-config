@ECHO OFF
REM This is required to enable reading of variables set in if statement blocks.
REM Variables read with "!" e.g. !errorlevel! use delayed expansion.
REM See http://ss64.com/nt/delayedexpansion.html for more info.
setlocal enabledelayedexpansion

REM vundle requires git
WHERE git >nul 2>nul
IF %ERRORLEVEL% NEQ 0 ECHO Please install git first. && GOTO :EOF

REM vundle requires curl
WHERE curl >nul 2>nul
IF %ERRORLEVEL% NEQ 0 ECHO Please install curl first (see vundle windows install docs). && GOTO :EOF

REM If _vimrc file already exists, prompt user to overwrite it.
IF EXIST %USERPROFILE%\_vimrc (
    choice /c yn /m "vimrc file already exists, do you want to overwrite it? "
    IF !errorlevel! equ 1 (
        move /Y %USERPROFILE%\_vimrc %USERPROFILE%\_vimrc_bak
    ) ELSE (
        ECHO Aborting...
        GOTO :EOF
    )
)

ECHO Copying new vimrc file.
copy .\files\vimrc %USERPROFILE%\_vimrc

ECHO Copying tips file.
copy .\files\vimtips %USERPROFILE%\vimfiles\vimtips

SET VUNDLEDIR=%USERPROFILE%\vimfiles\bundle\

IF EXIST %VUNDLEDIR% (
    ECHO Removing existing vundle install
    rmdir /S/Q %VUNDLEDIR%
)

ECHO Installing vundle.
mkdir %VUNDLEDIR%
git clone https://github.com/VundleVim/Vundle.vim.git %VUNDLEDIR%\Vundle.vim

ECHO Installing plugins
gvim +PluginInstall +qall
