# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

export NVM_DIR="$HOME/.nvm"
# Removing to speedup zsh initialization
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
alias loadnvm='[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"'
alias loadnvm_completion='[ -s "$NVM_DIR/bash_completion" ] && . ""$NVM_DIR/bash_completion"'

export LC_ALL=en_US.UTF-8

user_name=$(id -un)
# Path to your oh-my-zsh installation.
export ZSH="/Users/${user_name}/.oh-my-zsh"

# emacs
#export PATH=$PATH:/usr/local/sbin
#export PATH=/usr/local/Cellar/emacs-plus/26.3:$PATH
export PATH="/Applications/MacPorts/Emacs.app/Contents/MacOS:$PATH"

# Ruby specific
export PATH=/usr/local/opt/ruby/bin:$PATH
export GEM_HOME=$HOME/gems
export PATH=$HOME/gems/bin:$PATH

# Go specific
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# Ctags if exuberent-ctags is present
alias ctags="`brew --prefix`/bin/ctags"

# Setting PATH for Python 3
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# export PATH
#alias python='python2'
#alias py='python2'

# Internet of things
alias findiot='ls /dev/tty.*'

# Node js n
#export N_PREFIX=$HOME/.n
#export PATH=$N_PREFIX/bin:$PATH

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="norm"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Aliases
# Git aliases
gituser() {
	git config --global user.name && git config --global user.email
}
gitturbot() {
  git config --global user.email 'rudra@turbot.com' && git config --global user.name 'Rudra Narayan'
  gituser
}
gitprof() {
	git config --global user.email 'kar.rudra008@gmail.com' && git config --global user.name 'mrprofessor'
  gituser
}
gitlines() {
 git ls-files -- '*.py' ':!:*.' | while read f; do git blame --line-porcelain $f | grep '^author '; done | sort -f | uniq -ic | sort -n
}

# vim ==> nvim
alias vim="nvim"
#alias vi="nvim"
alias oldvim="vim"

# brew/cargo install exa 
# A modern replacement for ls.
alias l="exa -l"

# kubectl
alias k="kubectl $@"

# Support Emacs
if [[ $TERM = dumb ]]; then
    unset zle_bracketed_paste
fi

# Show battery percentage
macBattery() {
  pmset -g batt | grep -Eo '\d+%' | cut -d% -f-2
}

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# The next line updates PATH for the Google Cloud SDK.
#if [ -f '/Users/professor/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/professor/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
#if [ -f '/Users/professor/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/professor/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

# Removed iterm shell integration in favour of emacs
# test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
# source ~/.iterm2_shell_integration.zsh

# export PATH="/usr/local/opt/node@10/bin:$PATH"
# export PATH="/usr/local/opt/node@10/bin:$PATH"

export PATH="/usr/local/opt/ruby/bin:$PATH"
export PATH="/usr/local/opt/ruby/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"

# Rust path
export PATH="$HOME/.cargo/bin:$PATH"


# Objectrocket stuff
alias or-scratchpad='or-infra --kube-context infradev --infra-api-url https://infraapi/.scratchpad.objectrocket.cloud/'
alias or-leappad='or-infra --kube-context infrastg --infra-api-url https://infraapi.leappad.objectrocket.cloud/'
alias or-launchpad='or-infra --kube-context infraprd --infra-api-url https://infraapi.launchpad.objectrocket.cloud/'
export PATH="/usr/local/opt/postgresql@10/bin:$PATH"

# Put this in ~/.bash_aliases or ~/.bash_profile
function kssh(){
  if [ -n "${KLUSTER}" ]; then
     ssh -F ${HOME}/.ssh/config-${KLUSTER} ${1}
  else
    if [ -z "${1}" -o -z "${2}" ]; then
      echo 'to use either export KLUSTER=cluster-name and then kssh host'
      echo 'or use kssh cluster-name host'
    else
      ssh -F ${HOME}/.ssh/config-${1} ${2}
    fi
  fi
}

# aws cli
export PATH=~/bin:$PATH

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
export PATH="/usr/local/opt/go@1.13/bin:$PATH"
export PATH="/opt/homebrew/opt/mongodb-community@5.0/bin:$PATH"
