#!/bin/zsh
# Install programming languages and required tools

# Prerequisite: Run setup.sh first


############################################################
# Pyenv - Safe python
############################################################
brew install pyenv
pyenv install 3.6.0


############################################################
# Node - Safe Node
############################################################
brew install n
n lts


############################################################
# Golang - Parallelism is not concurrency
############################################################
brew install golang
mkdir -p $HOME/go/{bin,src}


############################################################
# Rust - Love
############################################################
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
