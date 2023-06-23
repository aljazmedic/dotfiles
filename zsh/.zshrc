# If you come from bash you might have to change your $PATH.
# For GPG commit signing
export GPG_TTY=$(tty)

export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-"$HOME/.config"}

mkdir -p "$XDG_CONFIG_HOME/zsh"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

mkdir -p "$XDG_CONFIG_HOME/oh-my-zsh"
export ZSH="$ZDOTDIR/oh-my-zsh"

export PATH=$HOME/bin:/usr/local/bin:$PATH

export ZSH_CUSTOM=$ZDOTDIR/custom

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="spaceship-prompt/spaceship"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

HIST_STAMPS="yyyy-mm-dd"

# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    gitfast
    docker
    docker-compose
    tmux
    emoji
    history-substring-search
    #spaceship-vi-mode
    zsh-completions
    zsh-autosuggestions
    zsh-syntax-highlighting
    colored-man-pages
)

[ -f "$ZDOTDIR/exports.zsh" ] && source $ZDOTDIR/exports.zsh
[ -f "$ZDOTDIR/configs.zsh" ] && source $ZDOTDIR/configs.zsh
[ -f "$ZDOTDIR/aliases.zsh" ] && source $ZDOTDIR/aliases.zsh

source $ZSH/oh-my-zsh.sh

