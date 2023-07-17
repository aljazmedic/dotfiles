export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"

# Zsh vars
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export ZSH="$ZDOTDIR/oh-my-zsh"
export ZSH_CUSTOM="$ZDOTDIR/custom"

# Dotfiles
export DOTFILES="$HOME/.dotfiles"

# XDG
export XDG_DATA_HOME=$XDG_CONFIG_HOME/local/share
export XDG_CACHE_HOME=$XDG_CONFIG_HOME/cache
export ZSH_COMPDUMP="$XDG_CACHE_HOME/.zcompdump-$HOST"

export DIRSTACKSIZE=5

# System
if command -v nvim >/dev/null; then
	export VISUAL="nvim"
	export MANPAGER='nvim +Man!'
	export EDITOR="nvim"
else
	export VISUAL="vim"
	export EDITOR="vim"
fi

export PASSWORD_STORE_DIR="$HOME/.local/share/password-store"

# Man
export MANWIDTH=999

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ]; then
	PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ]; then
	export PATH="$HOME/.local/bin:$PATH"
fi

#export GO111MODULE=on
export GOPATH="$HOME/go"
export PATH="$PATH:/usr/local/go/bin:$GOPATH/bin"

if [ -f "$HOME/.zlocal" ]; then
	source $HOME/.zlocal
fi
