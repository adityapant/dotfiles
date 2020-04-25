#!/bin/bash

# Get the absolute path of the current directory
DIR=$(cd `dirname $0` && pwd)

# Symlink to the home, overwrite
ln -sf $DIR/.tmux.conf ~/.tmux.conf
ln -sf $DIR/.vimrc ~/.vimrc
ln -sf $DIR/.zshrc ~/.zshrc
