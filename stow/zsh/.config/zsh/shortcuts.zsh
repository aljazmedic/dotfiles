# Utils
alias path='echo $PATH | tr -s ":" "\n"'
alias mkdir="mkdir -p"
alias c='cd'


# easier to read disk
alias df='df -h'     # human-readable sizes
alias free='free -m' # show sizes in MB

# Why vim use when you can nvim use
if [ -x "$(command -v nvim)" ]; then
	alias vim="nvim"
fi

export SEDITOR="sudo -E $EDITOR"
alias svim="sudo -E $EDITOR"

# confirm before overwriting something
#alias cp="cp -i"
#alias mv='mv -i'
#alias rm='rm -i'

alias ls='ls --color=tty'
alias la='ls -la'
alias ll='ls -lAFh'

ssha () {
	[ -z $SSH_AUTH_SOCK ] && eval `ssh-agent`
	ssh-add $@
}

# Use lf to switch directories and bind it to ctrl-o
lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}
bindkey -s '^o' 'lfcd\n' 


nmap-bstrap () {
	performance="-T4 --min-rate 300"
	_c="nmap -p- $performance -oN nmap.initial $1"
	echo "$_c"
	eval $_c && PORTS=$(grep -oP '\d+(?=/tcp)' initial | paste -sd ',')
	_c2="nmap -sC -sV $performance -oA nmap.all $1 -p$PORTS"
	echo "$_c2"
	eval $_c2
}
