# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# echo "Loaded .config/zsh/.zshrc"

_source_if_exists_f () {
	[[ -r $1 ]] && source $1
}
## NO USER IO BEYOND THIS LINE ##

_source_if_exists_f "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

zstyle ':omz:update' mode reminder  # just remind me to update when it's time

HIST_STAMPS="yyyy-mm-dd"

export DIRENV_LOG_FORMAT=""
plugins=(
    direnv
	
	git

	docker
	docker-compose
	
	fd
	fzf
	zoxide
	
	tmux
	tmuxinator
	
	zsh-completions
	zsh-autosuggestions
	zsh-syntax-highlighting

	rbenv
	
	common-aliases
	# colored-man-pages # We use bat instead
)

plugins=($(printf "%s\n" "${plugins[@]}" | sort -u | uniq))

source $ZSH/oh-my-zsh.sh

source $ZDOTDIR/plugins/configs.zsh

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f $ZDOTDIR/.p10k.zsh ]] || source $ZDOTDIR/.p10k.zsh

# opam configuration
[[ ! -r $HOME/.opam/opam-init/init.zsh ]] || source $HOME/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null
