# echo "Loaded .config/zsh/.zprofile"

# This is sourced on tmux new pane for example

# Zsh vars
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:=$HOME/.config}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:=$XDG_CONFIG_HOME/cache}"
export ZDOTDIR="${ZDOTDIR:=$XDG_CONFIG_HOME/zsh}"
export ZSH="$ZDOTDIR/oh-my-zsh" 
export ZSH_CUSTOM="$ZDOTDIR/custom"
export DIRSTACKSIZE=8

# Gpg sometimes funny
export GPG_TTY=$(tty)

# System
if command -v nvim >/dev/null; then
	export VISUAL="nvim"

	export MANPAGER='nvim +Man!'
else
	export VISUAL="vim"
fi
export EDITOR="$VISUAL"
export PASSWORD_STORE_DIR="$HOME/.local/share/password-store"

# Man
export MANWIDTH=999

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
	PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
	export PATH="$HOME/.local/bin:$PATH"
fi

#export GO111MODULE=on
export GOPATH="$HOME/go"
export PATH="$PATH:/usr/local/go/bin:$GOPATH/bin"

if [ -f "$HOME/.zlocal" ] ; then
	source $HOME/.zlocal
fi
