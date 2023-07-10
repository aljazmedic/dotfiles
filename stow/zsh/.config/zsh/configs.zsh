# zsh options

#if [ -d $XDG_CONFIG_HOME/lf ] ; then
#	fpath=($XDG_CONFIG_HOME/lf/_lf $fpath)
#fi

# completions
autoload -Uz compinit
compinit
setopt autopushd pushdminus pushdsilent pushdtohome cdablevars
setopt autocd extendedglob nomatch menucomplete
setopt appendhistory
zle_highlight=('paste:none')

fpath+=~/.config/zcomp

# beeping is annoying
unsetopt BEEP

setopt globdots
zstyle ':completion:*' menu select
#zstyle ':completion:*' special-dirs true

zmodload zsh/complist
# compinit
#_comp_options+=(globdots)		# Include hidden files.

# vi mode
bindkey -v
bindkey "^F" vi-cmd-mode

### PROMPT ###
autoload -Uz vcs_info
autoload -U colors && colors
