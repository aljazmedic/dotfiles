# echo "Loaded .config/zsh/.zprofile"

# This is sourced on tmux new pane for example

# Gpg sometimes funny
export GPG_TTY=$(tty)


# PATH should be set in .zprofile
export PATH="$GOBIN:/usr/local/go/bin:$PATH"  #GO

if [ -d "$HOME/bin" ] ; then
	export PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
	export PATH="$HOME/.local/bin:$PATH"
fi
