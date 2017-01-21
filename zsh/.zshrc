# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Add RVM to PATH for scripting
export PATH="/usr/local/bin:$PATH:$HOME/.rvm/bin"

# bundle open with vim
export BUNDLER_EDITOR=vim
if which nvm &> /dev/null; then
  export NVM_DIR="$HOME/.nvm"
  . "$(brew --prefix nvm)/nvm.sh"
fi

export EDITOR=vim
# :q exit tmux windows
alias :q='exit'

# bundle
alias be="bundle exec"

if which hub &> /dev/null; then
  # alias hub to git
  eval "$(hub alias -s)"
fi


if which xdg-open &> /dev/null; then
  show-pdf() { xdg-open "$*" &; }
  alias show=show-pdf
fi

ZSH_THEME="princess"

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

source $ZSH/oh-my-zsh.sh

export PATH="/usr/local/sbin:$PATH"
showColors() {
  for code in {0..255}; do echo -e "\e[38;05;${code}m $code: Test"; done
}

alias colors=showColors
