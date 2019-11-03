#!/bin/bash

# Get the absolute path of the current directory
DIR=$(cd `dirname $0` && pwd)

# Symlink to the home, overwrite
ln -sf $DIR/.tmux.conf ~/.tmux.conf

# Source

# Include local file if exists
# if [ -f ~/.zshrc.local ]; then
	# source ~/.zshrc.local
# fi
