# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# NVM setup
export NVM_DIR="$HOME/.nvm"
alias loadnvm='[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"'
alias loadnvm_completion='[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"'

# Set locale
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Oh-My-Zsh setup
user_name=$(id -un)
ZSH_THEME="norm"
plugins=(git)
export ZSH="/Users/${user_name}/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh

# Emacs path
export PATH="/Applications/Emacs.app/Contents/MacOS:$PATH"

# Ruby setup
export PATH="/usr/local/opt/ruby/bin:$PATH"
export GEM_HOME="$HOME/gems"
export PATH="$GEM_HOME/bin:$PATH"

# Go setup
export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin"

# Python setup
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Rust setup
export PATH="$HOME/.cargo/bin:$PATH"

# MongoDB setup
export PATH="/opt/homebrew/opt/mongodb-community@5.0/bin:$PATH"

# PostgreSQL setup
export PATH="/usr/local/opt/postgresql@10/bin:$PATH"

# AWS CLI setup
export PATH="$HOME/bin:$PATH"

# Aliases
# alias vim="nvim"
# alias oldvim="vim"
alias l="exa -l"
alias k="kubectl $@"
alias ctags="`brew --prefix`/bin/ctags"
alias findiot='ls /dev/tty.*'

# Git aliases
gituser() {
	git config --global user.name && git config --global user.email
}
gitprof() {
	git config --global user.email 'rudra.kar@icloud.com' && git config --global user.name 'mrprofessor'
	gituser
}
gitlines() {
 git ls-files -- '*.py' ':!:*.' | while read f; do git blame --line-porcelain $f | grep '^author '; done | sort -f | uniq -ic | sort -n
}

# SSH function for clusters
function kssh(){
  if [ -n "${KLUSTER}" ]; then
     ssh -F ${HOME}/.ssh/config-${KLUSTER} ${1}
  else
    if [ -z "${1}" ] || [ -z "${2}" ]; then
      echo 'Usage: export KLUSTER=cluster-name and then kssh host'
      echo 'Or use: kssh cluster-name host'
    else
      ssh -F ${HOME}/.ssh/config-${1} ${2}
    fi
  fi
}

# Terminal configuration for Emacs
if [[ $TERM = dumb ]]; then
    unset zle_bracketed_paste
fi

# Miscellaneous configurations
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/opt/go@1.13/bin:$PATH"
