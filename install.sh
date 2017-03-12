#!/bin/bash

command -v git >/dev/null 2>&1 || { echo >&2 "Please install git first"; exit 1; }
command -v curl >/dev/null 2>&1 || { echo >&2 "Please install curl first"; exit 1; }

VIMRC="$HOME/.vimrc"

if [ -e $VIMRC ]
then
  read -p "Overwrite existing .vimrc [y/n]? " yn
  case $yn in
    [Yy]* ) mv $VIMRC $VIMRC.bak ;;
    [Nn]* ) echo "Aborting..."; exit 1;; 
  esac
fi

echo "Copying new vimrc file."
cp ./files/vimrc $VIMRC

echo "Copying tips file."
cp ./files/vimtips.md $HOME/.vim/vimtips.md

VUNDLEDIR=$HOME/.vim/bundle

if [ -e $VUNDLEDIR ]
then
  echo "Removing existing vundle install"
  rm -rf $VUNDLEDIR
fi

echo "Installing vundle."
mkdir $VUNDLEDIR
git clone https://github.com/VundleVim/Vundle.vim.git $VUNDLEDIR/Vundle.vim

echo "Installing plugins"
gvim +PluginInstall +qall

echo "Don't forget to install font:"
echo "sudo apt-get install fonts-inconsolata"
