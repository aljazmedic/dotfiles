# Set editor
export VISUAL="nvim"
export EDITOR=$VISUAL
export DIRSTACKSIZE=5

export PATH="$HOME/.local/bin":$PATH
export MANPAGER='nvim +Man!'
export MANWIDTH=999

ssha () {
    [ -z $SSH_AUTH_SOCK ] && eval `ssh-agent`
    ssh-add $@
}
