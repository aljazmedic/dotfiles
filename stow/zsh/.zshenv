# echo "Loaded ~/.zshenv"

# This is sourced for all zsh login, interactive shells and scripts.
# Tmux pane splitting doesn't source this file, so anything pane-related
#   needs to be specified in .zprofile
export DOTFILES="${DOTFILES:=$HOME/.dotfiles}"
export WORKSPACE="$HOME/workspace"

# XDG Base Directory Specification
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:=$HOME/.config}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:=$XDG_CONFIG_HOME/cache}"
export XDG_DATA_HOME="${XDG_DATA_HOME:=$XDG_CONFIG_HOME/local/share}"


# Use nvim if availble, else vim
if command -v nvim &> /dev/null; then
    export EDITOR="nvim"
    # export PAGER="nvim +Man!"
else
    export EDITOR="vim"
    export PAGER="less"
fi

# Use code for visual if awailable
if command -v code &> /dev/null; then
    export VISUAL="code --wait"
else
    export VISUAL="$EDITOR"
fi

### BEGIN zsh
export ZDOTDIR="${ZDOTDIR:=$XDG_CONFIG_HOME/zsh}"
export HISTFILE="${ZDOTDIR:-$HOME}/.zsh_history"
export HISTSIZE=50000
export SAVEHIST=10000

export ZSH="$ZDOTDIR/oh-my-zsh" 
export ZSH_CUSTOM="$ZDOTDIR"
export ZSHZ_DATA="$XDG_DATA_HOME/zshz"
### END zsh

# Other
export TMUXP_CONFIGDIR="$XDG_CONFIG_HOME/tmuxp"
export VIMCONFIG="$XDG_CONFIG_HOME/nvim"

### BEGIN nvm
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
### END nvm

### BEGIN direnv
export DIRENV_LOG_FORMAT=""
### END direnv

### BEGIN tmux
export ZSH_TMUX_CONFIG="$XDG_CONFIG_HOME/tmux/tmux.conf"
export ZSH_TMUX_UNICODE="true"
### END tmux


### BEGIN fzf
## When ready, uncomment the following line to disable fzf key bindings and write own.
## By default, fzf key bindings are enabled: CTRL-T, CTRL-R, ALT-C
# DISABLE_FZF_KEY_BINDINGS="true"
### END fzf

# golang
export GOPATH="$WORKSPACE/go"
export GOBIN="$WORKSPACE/go/bin"
export GOCACHE="$XDG_CACHE_HOME/go-build"

# if we have ruby and rbenv command:
if command -v ruby &> /dev/null && command -v rbenv &> /dev/null; then
  export RBENV_ROOT="$XDG_CONFIG_HOME/rbenv"
  export GEM_HOME="$(ruby -e 'puts Gem.user_dir')"
  export PATH="$PATH:$GEM_HOME/bin"
  eval "$(rbenv init -)"
fi
