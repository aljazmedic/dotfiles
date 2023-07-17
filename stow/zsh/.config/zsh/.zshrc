# echo "Loaded .config/zsh/.zshrc"

_source_if_exists_f () {
	[[ -r $1 ]] && source $1
}
## NO USER IO BEYOND THIS LINE ##

_source_if_exists_f "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
#																			| This is equal to $NAME ?

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="false"

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
		zsh-completions
		zsh-autosuggestions
		zsh-syntax-highlighting
		colored-man-pages
	)

# rc files may add to plugins
rcdir="$HOME/.config/zsh/rc.d"
[ -d "$rcdir" ] && for rc in "$rcdir"/*.zsh; do
	source "$rc"
	# echo "Loaded $rc"
done

plugins=($(printf "%s\n" "${plugins[@]}" | sort -u | uniq))
source $ZSH/oh-my-zsh.sh

_zlf() {
        emulate -L zsh
        local d=$(mktemp -d) || return 1
        {
            mkfifo -m 600 $d/fifo || return 1
            tmux split -bf zsh -c "exec {ZLE_FIFO}>$d/fifo; export ZLE_FIFO; exec lf" || return 1
            local fd
            exec {fd}<$d/fifo
            zle -Fw $fd _zlf_handler
        } always {
        rm -rf $d
    }
}
zle -N _zlf
bindkey '\ek' _zlf

_zlf_handler() {
    emulate -L zsh
    local line
    if ! read -r line <&$1; then
        zle -F $1
        exec {1}<&-
        return 1
    fi
    eval $line
    zle -R
}
zle -N _zlf_handler

_source_if_exists_f $ZDOTDIR/.p10k.zsh