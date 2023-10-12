


# Remove everything starting with wsl-
STOW_PACKAGES=$(shell ls ./stow | grep -v '^wsl-')
BASE_PACKAGES=git tmux

.PHONY: link/* install/* clean/*
link/%: tools submodules install/%
	@echo " == Linking $* == "
	@stow -R -v -t $$HOME -d ./stow $*
	@make -C ./stow/$* -f install.mk post-link || true

install/%:
	@echo " == Installing $* == "
	@$[ -f ./stow/$*/install.mk $] && make -C ./stow/$* -f install.mk install

clean/%:
	@echo " == Cleaning $* == "
	@stow -D -v -t $$HOME -d ./stow $*

.PHONY: submodules
submodules:
	@git submodule update --init --recursive

.PHONY: tools
tools:
	@command -v stow >/dev/null 2>&1 || sudo apt-get install -y stow

.PHONY: link-base
link-base: $(BASE_PACKAGES:%=link/%)
