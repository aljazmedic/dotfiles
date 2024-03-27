
install:
	@sudo apt-get install -y fd-find fzf
	@sudo ln -s $(which fdfind) ~/.local/bin/fd
