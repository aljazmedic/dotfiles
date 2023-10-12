
# Enable vim mode

# bindkey -v # <- this makes Alt vim move key. Disables Alt+. etc.

export KEYTIMEOUT=1

# Ctrl-F To edit the line
bindkey "^F" vi-cmd-mode

# Make cursor blinky
source "$ZDOTDIR/plugins/cursor_mode"
# Add Vi text-objects for brackets and quotes
autoload -Uz select-bracketed select-quoted
zle -N select-quoted
zle -N select-bracketed
for km in viopp visual; do
  bindkey -M $km -- '-' vi-up-line-or-history
  for c in {a,i}${(s..)^:-\'\"\`\|,./:;=+@}; do
    bindkey -M $km $c select-quoted
  done
  for c in {a,i}${(s..)^:-'()[]{}<>bB'}; do     #' # for syntax highlighting
    bindkey -M $km $c select-bracketed
  done
done