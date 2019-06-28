#!/bin/zsh

# Setiing up vundle : a package manager for vim
# git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Be advised
# Never worked on first try

# neovim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.config/nvim/bundle/Vundle.vim

# Create nvim folder if not there
mkdir -p ~/.config/nvim/

# Link vimrc
# ln -s ~/dotfiles/.vimrc ~/.vim/vimrc

# Link nvim config too
ln -s ~/dotfiles/.vimrc ~/.config/nvim/init.vim

# Install neovim plugins
nvim +PluginInstall +qall

# Set up tmux
# git clone https://github.com/gpakosz/.tmux.git ~/.tmux
# ln -s -f .tmux/.tmux.conf ~/.tmux.conf
ln -s -f ~/dotfiles/.tmux/.tmux.conf ~/.tmux.conf

# Copy my tmux file to root
cp ~/dotfiles/.tmux.conf.local ~/.tmux.conf.local

# zsh setup
ln -s -f ~/dotfiles/.zshrc ~/.zshrc
