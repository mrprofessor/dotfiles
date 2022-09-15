#!/bin/bash

# Prerequisite:
#xcode --select-install

############################################################
# Homebrew - Mac os package manager
############################################################
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
sudo chmod -R 755 /usr/local/share/zsh/site-functions
sudo chmod -R 755 /usr/local/share/zsh


############################################################
# Oh-my-zsh - A better shell
############################################################
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
ln -s -f ~/dotfiles/zshrc ~/.zshrc # Link zshrc
source ~/.zshrc


############################################################
# Alacritty setup - A faster terminal emulator
############################################################
#brew cask install alacritty
#mkdir -p ~/.config/alacritty/ # Create alacritty config folder
#ln -s ~/dotfiles/alacritty.yml ~/.config/alacritty/alacritty.yml


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
# Emacs - Old man yells at editor
############################################################
#brew tap d12frosted/emacs-plus
#brew install emacs-plus@28


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
# DOOM - Vim inside emacs
############################################################
#git clone --depth 1 https://github.com/hlissner/doom-emacs ~/.emacs.d
#~/.emacs.d/bin/doom install

#mkdir -p ~/.doom.d/
#ln -f ~/dotfiles/doom.d/config.el ~/.doom.d/config.el
#ln -f ~/dotfiles/doom.d/init.el ~/.doom.d/init.el
#ln -f ~/dotfiles/doom.d/packages.el ~/.doom.d/packages.el
