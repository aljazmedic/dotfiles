# zsh options

zle_highlight=('paste:none')

# beeping is annoying
unsetopt BEEP

_comp_options+=(globdots) # Include hidden files.
#zstyle ':completion:*' special-dirs true

zmodload zsh/complist

### VI KEYMAP ###

# bindkey -v
# export KEYTIMEOUT=1

# # Change cursor
# source "$ZDOTDIR/cursor_mode"

autoload -U colors && colors
