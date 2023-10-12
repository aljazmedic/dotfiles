#  ____ ___  __  __ ____  _     _____ _____ ___ ___  _   _ 
# / ___/ _ \|  \/  |  _ \| |   | ____|_   _|_ _/ _ \| \ | |
#| |  | | | | |\/| | |_) | |   |  _|   | |  | | | | |  \| |
#| |__| |_| | |  | |  __/| |___| |___  | |  | | |_| | |\  |
# \____\___/|_|  |_|_|   |_____|_____| |_| |___\___/|_| \_|



# Load more completions
fpath=($ZDOTDIR/comp.d/ $fpath)

setopt menu_complete # show menu on tab completion

# Should be called before compinit
zmodload zsh/complist
# When in keymap 'menuselect' use vi bindings
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect '^xi' vi-insert

autoload -Uz compinit
compinit -d "$XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION"
_comp_options+=(globdots) # With dotfiles also

# Ztyle pattern
# :completion:<function>:<completer>:<command>:<argument>:<tag>
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh/.zcompcache"

zstyle ':completion:*:*:*:*:*' menu select
# zstyle ':completion:*' auto-description 'specify: %d'
# If you want to have exact match, remove the _approximate
zstyle ':completion:*' completer _expand _complete _approximate
zstyle ':completion:*' group-name ''

zstyle ':completion:*:*:*:*:messages' format ' %F{purple} -- %d --%f'
zstyle ':completion:*:*:*:*:corrections' format '%F{yellow}!- %d (%e off) -!%f'
zstyle ':completion:*:*:*:*:descriptions' format '%F{blue}-- %D %d --%f'
zstyle ':completion:*:*:*:*:warnings' format ' %F{red}-- no matches found --%f'
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s

# partial words, case insensitiveormat 'Completing %d'
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# Detailed file list completes
zstyle ':completion:*:default' list-colors ${(s.:.)ZLS_COLORS}

# File sorting
zstyle ':completion:*' file-list all # file complete like ls -la
zstyle ':completion:*' file-sort modification
# list files in alphabetical order if you set 'dummyvalue'
# also possible: size, links, modificatoin/date/time, access, change

zstyle ':completion:*' squeeze-slashes true # // -> / instead of /*/
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' rehash true
zstyle ':completion:*' verbose true
# Autocomplete options for cd instead of directory stack
zstyle ':completion:*' complete-options true