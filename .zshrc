# Global ZSH/oh-my-zsh configuration
export PATH=$HOME/.bin:/usr/local/bin:$PATH
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME=robbyrussell

# Show the time on the right prompt, and keep it updated until command execution
RPROMPT='%D{%X}'
TMOUT=1
TRAPALRM() {
  zle reset-prompt
}

HISTSIZE=1000000
SAVEHIST=$HISTSIZE

ZSH_TMUX_AUTOSTART=true
ZSH_TMUX_AUTOCONNECT=false
ZSH_TMUX_AUTOQUIT=true
ZSH_TMUX_CONFIG=$HOME/.tmux.conf
plugins=(
  git
  nvm
  tmux
  ubuntu
  urltools
)
source "$ZSH"/oh-my-zsh.sh

# Standard tooling
alias sudo='sudo '

export HOMEBREW_NO_ANALYTICS=1

if command -v code >/dev/null; then
  export EDITOR=code
elif command -v vim >/dev/null; then
  export EDITOR=vim
fi

if command -v firefox >/dev/null; then
  export BROWSER=firefox
fi

export LESS=RFX

# General purpose aliases
case $(uname) in
  Darwin) alias l='LC_COLLATE=C ls -Alh' ;;
  Linux) alias l='LC_COLLATE=C ls -Alh --group-directories-first' ;;
esac
alias ll='l'

export WORKSPACE="$HOME/workspace"
alias ws='cd $WORKSPACE && ls'

mkcd() {
  mkdir -p "$*"
  cd "$*" || return
}

zshrc() {
  "$EDITOR" "$HOME/.zshrc"
  echo "Run $(tput bold)exec zsh -l$(tput sgr0) to reload the configuration"
}

killport() {
  lsof -n -i4TCP:"$1" | grep LISTEN | awk '{ print $2 }' | xargs kill
}

# History
alias h="fc -li 1"
histstats() {
  history | awk '{ CMD[$2]++; count++; } END { for (a in CMD) print CMD[a] " " CMD[a]/count*100 "% " a;}' | grep -v './' | column -c3 -s ' ' -t | sort -nr | nl | head -n10
}

# Git
alias glnp="git --no-pager log --pretty=oneline -n30 --abbrev-commit"

# Go
export GOPATH="$WORKSPACE/go"
export GOROOT="/usr/local/go"
export PATH=$PATH:/usr/local/go/bin
alias gopath='cd $GOPATH/src && tree -fL 3'

# Autojump
[[ -s /home/thiht/.autojump/etc/profile.d/autojump.sh ]] && source /home/thiht/.autojump/etc/profile.d/autojump.sh
autoload -U compinit && compinit -u

# Travis
[ -f /home/thiht/.travis/travis.sh ] && source /home/thiht/.travis/travis.sh

# Yarn
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
