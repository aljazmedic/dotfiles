
install:
# TODO! Check if neovim is above 0.9. If not download via AppImage
	@sudo apt-get install -y neovim python3-neovim

post-install:
# Run :so on $XDG_CONFIG_HOME/nvim/lua/*/packer.lua
	@echo "Installing packer.nvim"