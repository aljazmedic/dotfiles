# zsh options
setopt autopushd pushdminus pushdsilent pushdtohome cdablevars
setopt autocd extendedglob nomatch menucomplete
setopt appendhistory
stty stop undef		# Disable ctrl-s to freeze terminal.
zle_highlight=('paste:none')

# beeping is annoying
unsetopt BEEP

# completions
autoload -Uz compinit
zstyle ':completion:*' menu select

zmodload zsh/complist
# compinit
_comp_options+=(globdots)		# Include hidden files.

# vi mode
bindkey -v
bindkey "^F" vi-cmd-mode

### PROMPT ###
autoload -Uz vcs_info
autoload -U colors && colors
