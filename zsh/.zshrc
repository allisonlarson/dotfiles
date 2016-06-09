# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Add RVM to PATH for scripting
export PATH="/usr/local/bin:$PATH:$HOME/.rvm/bin"

# bundle open with vim
export BUNDLER_EDITOR=vim

# :q exit tmux windows
alias :q='exit'

# bundle
alias be="bundle exec"

# alias hub to git
eval "$(hub alias -s)"

ZSH_THEME="clean"

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

plugins=(git bundle rails)

source $ZSH/oh-my-zsh.sh

export PATH="/usr/local/sbin:$PATH"
