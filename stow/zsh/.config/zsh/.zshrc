# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# If you come from bash you might have to change your $PATH.
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-"$HOME/.config"}

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="spaceship-prompt/spaceship"
#ZSH_THEME="robbyrussell"
ZSH_THEME="powerlevel10k/powerlevel10k"

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
		zsh-completions
		zsh-autosuggestions
		zsh-syntax-highlighting
		colored-man-pages
	)
# TODO! Move configs.zsh to this file
[ -f "$ZDOTDIR/configs.zsh" ] && source $ZDOTDIR/configs.zsh
[ -f "$ZDOTDIR/shortcuts.zsh" ] && source "$ZDOTDIR/shortcuts.zsh"

source $ZSH/oh-my-zsh.sh

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

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
