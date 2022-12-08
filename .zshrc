# Global ZSH/oh-my-zsh configuration
export PATH=$HOME/.bin:$PATH
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME=robbyrussell

HISTSIZE=1000000
SAVEHIST=$HISTSIZE

plugins=(
  git
  nvm
  urltools
)
source "$ZSH"/oh-my-zsh.sh

# Standard tooling
alias sudo='sudo '

export HOMEBREW_NO_ANALYTICS=1
export LESS=RFX

export WORKSPACE="$HOME/Workspace"
alias ws='cd $WORKSPACE && ls'

killport() {
  lsof -n -i4TCP:"$1" | grep LISTEN | awk '{ print $2 }' | xargs kill
}

# History
alias h="fc -li 1"
histstats() {
  history | awk '{ CMD[$2]++; count++; } END { for (a in CMD) print CMD[a] " " CMD[a]/count*100 "% " a;}' | grep -v './' | column -c3 -s ' ' -t | sort -nr | nl | head -n10
}

# Git
alias glnp='git --no-pager log --pretty=oneline -n30 --abbrev-commit'
alias groot='cd $(git rev-parse --show-toplevel)'
