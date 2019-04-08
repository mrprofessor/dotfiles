#!/bin/zsh

# Setiing up vundle : a package manager for vim
# git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# neovim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.config/neovim/bundle/Vundle.vim


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
