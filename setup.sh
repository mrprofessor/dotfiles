#!/bin/bash

# An attempt at installing some basic packages

# Prerequisite:
#xcode --select-install

############################################################
# Homebrew - Mac os package manager
############################################################
#/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"


############################################################
# Oh-my-zsh - A better shell
############################################################
#sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
#ln -s -f ~/dotfiles/zshrc ~/.zshrc # Link zshrc
#source ~/.zshrc


############################################################
# tmux - Cool kid's iterm
############################################################
brew install tmux
ln -s -f ~/dotfiles/tmux.conf ~/.tmux.conf


############################################################
# Neovim - An improved/hyped vim??
############################################################
brew install --HEAD neovim
mkdir -p ~/.config/nvim/
ln -s ~/dotfiles/vimrc ~/.config/nvim/init.vim


############################################################
# Vundle - Make vim vscode 
############################################################
git clone https://github.com/VundleVim/Vundle.vim.git ~/.config/nvim/bundle/Vundle.vim  # Neovim
nvim +PluginInstall +qall


############################################################
# Vim - vim config similar to neovim
############################################################
mkdir -p ~/.vim/
ln -s ~/dotfiles/vimrc ~/.vim/vimrc
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim # Vim
cp -rvf ~/.config/nvim/bundle/Vundle.vim ~/.vim/bundle/Vundle.vim


############################################################
# ripgrep - Grep but only faster
############################################################
brew install ripgrep


############################################################
# Cat - But with wings
############################################################
brew install bat
