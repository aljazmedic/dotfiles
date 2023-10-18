
GIT_ROOT=$(shell git rev-parse --show-toplevel || echo .)

# Remove everything starting with wsl-
STOW_PACKAGES=$(shell ls ./stow | grep -v '^wsl-')
BASE_PACKAGES=git tmux

.DEFAULTTARGET:

.PHONY: link/* install/* clean/*
link/%: decrypt install/%
	@echo " == Linking $* == "
	@stow -R -v -t $$HOME -d ./stow $*
	@[ -f ./stow/$*/install.mk ] && ( \
		echo " == Post-install $* == " && \
		make -C ./stow/$* -f install.mk post-link || true ) || \
	echo " == No install.mk for $* == "

install/%:
# check ./stow/$*/install.mk exists
	@[ -f ./stow/$*/install.mk ] && ( \
		echo " == Installing $* == " && \
		make -C ./stow/$* -f install.mk install ) || \
	echo " == No install.mk for $* == "

clean/%:
	@echo " == Cleaning $* == "
	@stow -D -v -t $$HOME -d ./stow $*

.PHONY: submodules
submodules:
	@git submodule update --init --recursive

.PHONY: tools
tools:
	@command -v stow >/dev/null 2>&1 || sudo apt-get install -y stow
	@command -v git-crypt >/dev/null 2>&1 || sudo apt-get install -y git-crypt

.PHONY: decrypt
decrypt: tools
	@git-crypt unlock || true

.PHONY: link-base
link-base: $(BASE_PACKAGES:%=link/%)
