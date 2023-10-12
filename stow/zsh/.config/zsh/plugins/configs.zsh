# zsh options


### NAVIGATION ###

# # OLD, need to try it out 
# setopt autopushd pushdminus pushdsilent pushdtohome cdablevars
setopt glob_dots            # Also try to glob the dotfiles
setopt no_case_glob         # Case insensitive globbing
setopt glob_complete        # Don't expand, instead show menu
setopt autocd               # Cd into name of the directory
setopt autopushd            # Pushd current dir when using cd
setopt pushd_ignore_dups    # Don't pushd if the dir is already in the stack
setopt pushd_silent         # Don't print the stack after pushd or popd
setopt interactivecomments  # allow comments in interactive mode
setopt magicequalsubst      # enable filename expansion for arguments of the form ‘anything=expression’
setopt nonomatch            # hide error message if there is no match for the pattern
setopt notify               # report the status of background jobs immediately
setopt numericglobsort      # sort filenames numerically when it makes sense
setopt promptsubst          # enable command substitution in prompt

### HISTORY ###

# HISTFILE set in .zshenv
setopt extended_history       # save timestamp of command
setopt share_history          # share command history data
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_all_dups   # delete all duplicates from history
setopt hist_find_no_dups      # do not display a line previously found
setopt hist_ignore_space      # ignore commands that start with space
setopt append_history         # don't overwrite but append to the history file
setopt inc_append_history     # add commands to HISTFILE right away, not after the session is over
setopt hist_verify            # show command with history expansion to user before running it

### ALIASES ###

source $ZDOTDIR/aliases/aliases


### TIME NOTIFICATION ###

# Send notification when command line done
source $ZDOTDIR/plugins/notifyosd.zsh


### COMPLETION ###

source $ZDOTDIR/plugins/completions.zsh


### LF ###

source $ZDOTDIR/plugins/lf.zsh


### VIM

source $ZDOTDIR/plugins/vim.zsh
