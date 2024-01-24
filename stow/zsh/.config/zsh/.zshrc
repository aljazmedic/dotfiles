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

plugins=(
		zsh-completions	
		zsh-autosuggestions
		zsh-syntax-highlighting
		colored-man-pages
		z
	)

# rc files may add to plugins
rcdir="$HOME/.config/zsh/rc.d"
[ -d "$rcdir" ] && for rc in "$rcdir"/*.zsh; do
	source "$rc"
	# echo "Loaded $rc"
done
unset rcdir rc
plugins=($(printf "%s\n" "${plugins[@]}" | sort -u | uniq))

source $ZSH/oh-my-zsh.sh

source $ZDOTDIR/plugins/configs.zsh

_source_if_exists_f $ZDOTDIR/.p10k.zsh

# opam configuration
[[ ! -r $HOME/.opam/opam-init/init.zsh ]] || source $HOME/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null
