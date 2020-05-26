#!/bin/zsh

# Install oh my zsh
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Setiing up vundle : a package manager for vim
# git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Alacritty setup
#brew cask install alacritty
# Create alacritty folder
#mkdir -p ~/.config/alacritty/
#ln -s ~/dotfiles/alacritty.yml ~/.config/alacritty/alacritty.yml


# Be advised
# Never worked on first try

# neovim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.config/nvim/bundle/Vundle.vim

# Create nvim folder if not there
mkdir -p ~/.config/nvim/

# Link vimrc
#mkdir -p ~/.vim/
# ln -s ~/dotfiles/vimrc ~/.vim/vimrc

# Link nvim config too
ln -s ~/dotfiles/vimrc ~/.config/nvim/init.vim

# Install neovim plugins
nvim +PluginInstall +qall

# Set up tmux
# git clone https://github.com/gpakosz/.tmux.git ~/.tmux --force
# ln -s -f .tmux/.tmux.conf ~/.tmux.conf
#ln -s -f ~/dotfiles/tmux/tmux.conf ~/.tmux.conf

# Copy my tmux file to root
#ln ~/dotfiles/tmux/tmux.conf.local ~/.tmux.conf.local

ln -s -f ~/dotfiles/tmux.conf ~/.tmux.conf

# zsh setup
ln -s -f ~/dotfiles/zshrc ~/.zshrc

# spacemacs setup
#ln -s -f ~/dotfiles/spacemacs ~/.spacemacs


# doom setup
mkdir -p ~/.doom.d/
ln ~/dotfiles/doom.d/config.el ~/.doom.d/config.el
ln ~/dotfiles/doom.d/init.el ~/.doom.d/init.el
ln ~/dotfiles/doom.d/packages.el ~/.doom.d/packages.el
vim doom.d/packages.el

