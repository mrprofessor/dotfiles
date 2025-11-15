#!/bin/bash

# An attempt at installing some basic packages

# Prerequisite:
xcode --select-install

############################################################
# Homebrew - Mac os package manager
############################################################
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
(echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> /Users/rudra.kar/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"


############################################################
# Zsh - My goto shell
############################################################
brew install zsh


############################################################
# Pyenv
############################################################
brew install pyenv


############################################################
# Wezterm - Nice term emulator
############################################################
brew install wezterm
mkdir -p ~/.config/wezterm/
ln -s -f ~/dotfiles/wezterm.lua ~/.config/wezterm/wezterm.lua


# Ghostty - Hashimoto San's pet project
############################################################
mkdir -p ~/.config/ghostty/
ln -s -f ~/dotfiles/ghostty.toml ~/.config/ghostty/config.toml

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
#brew install neovim
#git clone https://github.com/LazyVim/starter ~/.config/nvim
#rm -rf ~/.config/nvim/.git
brew install neovim
mkdir -p ~/.config/nvim/
ln -s ~/dotfiles/vimrc ~/.config/nvim/init.vim


############################################################
# Vundle - Make vim vscode 
############################################################
git clone https://github.com/VundleVim/Vundle.vim.git ~/.config/nvim/bundle/Vundle.vim  # Neovim
nvim +PluginInstall +qall


############################################################
# Vim - Use Neovim config
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

brew install mpv # For Emacs multimedia
