echo "Include ~/.zshenv"

export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-"$HOME/.config"}
export VAGRANT_DEFAULT_PROVIDER="virtualbox"
export PATH="$XDG_CONFIG_HOME/rbenv/plugins/ruby-build/bin:$XDG_CONFIG_HOME/rbenv/bin:$PATH"
# Zsh vars
export ZDOTDIR="$HOME/.config/zsh"
export ZSH="$ZDOTDIR/oh-my-zsh" 
export ZSH_CUSTOM="$ZDOTDIR/custom"
export ZSH_THEME="robbyrussell"
export DIRSTACKSIZE=5

# Gpg sometimes funny
export GPG_TTY=$(tty)

# System
if command -v nvim >/dev/null; then
	export VISUAL="nvim"

	export MANPAGER='nvim +Man!'
else
	export VISUAL="vim"
fi
export EDITOR="nvim"
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
