# Setup

To create own configuration, create a 'module' in `stow` directory.
For example, to create a configuration for `vim`, create a directory `stow/vim`.
Then, create a file `stow/vim/.vimrc` with your configuration.

The structure from `stow/vim/` will be stowed onto `$HOME`.

Optionally you can create a `stow/vim/.stow-local-ignore` file to ignore files.
If you provide a `stow/vim/install.mk` Makefile, it will execute `install` before stowing and `post-link` after stowing.
Both are optional.
