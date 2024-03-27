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

# Zsh
export ZDOTDIR="${ZDOTDIR:=$XDG_CONFIG_HOME/zsh}"
export HISTFILE="${ZDOTDIR:-$HOME}/.zsh_history"
export HISTSIZE=50000
export SAVEHIST=10000
export HIST_STAMPS="yyyy-mm-dd"

# OMZ vars
export ZSH="$ZDOTDIR/oh-my-zsh" 
export ZSH_CUSTOM="$ZDOTDIR"
export ZSHZ_DATA="$XDG_DATA_HOME/zshz"

# Other
export TMUXP_CONFIGDIR="$XDG_CONFIG_HOME/tmuxp"
export VIMCONFIG="$XDG_CONFIG_HOME/nvim"
export NVM_DIR="$XDG_DATA_HOME/nvm"


# golang
export GOPATH="$WORKSPACE/go"
export GOBIN="$WORKSPACE/go/bin"
export GOCACHE="$XDG_CACHE_HOME/go-build"

