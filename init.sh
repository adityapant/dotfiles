#!/bin/bash

# Get the absolute path of the current directory
DIR=$(cd `dirname $0` && pwd)

# Install pure
echo "Installing pure"
mkdir $HOME/repos
git clone https://github.com/sindresorhus/pure.git "$HOME/repos/pure"

# Install powerline-status
echo "Installing powerline-status"
pip3 install --user powerline-status

# Install zsh-syntax-highlighting
echo "Installing zsh-syntax-highlighting"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$HOME/repos/zsh-syntax-highlighting"

# Install zsh-autosuggestions
echo "Installing zsh-autosuggestions"
git clone https://github.com/zsh-users/zsh-autosuggestions "$HOME/repos/zsh-autosuggestions"

# Install direnv
echo "Installing direnv"
curl -sfL https://direnv.net/install.sh | bash

# Make backups
cp -v ~/.tmux.conf ~/.tmux.conf.bak
cp -v ~/.vimrc ~/.vimrc.bak
cp -v ~/.zshrc ~/.zshrc.bak

# Symlink to the home, overwrite
ln -sf $DIR/.tmux.conf ~/.tmux.conf
ln -sf $DIR/.vimrc ~/.vimrc
ln -sf $DIR/.zshrc ~/.zshrc
