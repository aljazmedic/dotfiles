
### PLUGINS
# Remove z entry from plugins array in zsh
excl=(z)
plugins=(${plugins:|excl})
### END

### POST COMPINIT
## ERROR! Currently it is auto-sourced pre-compinit, so it's manhually in zshrc
#eval "$(zoxide init --cmd cd zsh)"
# _ZO_FZF_OPTS  
### END