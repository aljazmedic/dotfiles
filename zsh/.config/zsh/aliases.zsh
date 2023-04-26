# Utils
alias path='echo $PATH | tr -s ":" "\n"'
alias mkdir="mkdir -p"
alias c='cd'


# easier to read disk
alias df='df -h'     # human-readable sizes
alias free='free -m' # show sizes in MB

# EDITOR
if [ -x "$(command -v nvim)" ]; then
	alias vim="nvim"
	alias svim="sudo nvim"
fi


# confirm before overwriting something
#alias cp="cp -i"
#alias mv='mv -i'
#alias rm='rm -i'

alias ls='ls --color=tty'
alias la='ls -la'
alias ll='ls -lAFh'

