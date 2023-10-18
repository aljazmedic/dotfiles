

TPM_DIR=$(HOME)/.config/tmux/plugins/tpm

install:
	@sudo apt-get install -y tmux

post-link: $(TPM_DIR)
	@$(TPM_DIR)/bin/install_plugins

$(TPM_DIR):
	@git clone https://github.com/tmux-plugins/tpm $(TPM_DIR)
