

INSTALL_DIR=$(HOME)/.local/share/pwninit
PATH_DIR=$(HOME)/.local/bin
CURRENT_TAG=$(shell ($(INSTALL_DIR)/pwninit -V | cut -d' ' -f2) || echo "0.0.0")
# Check if PATH_DIR in PATH and warn if not
ifeq (,$(findstring $(PATH_DIR),$(PATH)))
$(warning $(PATH_DIR) is not in your PATH)
endif

.PHONY: install
install: $(PATH_DIR)/pwninit
$(PATH_DIR)/pwninit: $(INSTALL_DIR)/pwninit
	@mkdir -p $(PATH_DIR)
	@ln -sf $(INSTALL_DIR)/pwninit $(PATH_DIR)/pwninit
	@echo "Installed pwninit to $(PATH_DIR)"

$(INSTALL_DIR)/pwninit: release
# Compare tags and download if newer or if not exists
	$(info Latest tag: $(shell cat $(INSTALL_DIR)/release.json | jq .tag_name -r), Current tag: $(CURRENT_TAG))
ifneq ("$(CURRENT_TAG)","$(shell cat $(INSTALL_DIR)/release.json | jq .tag_name -r)")
	@echo "Downloading pwninit to $(INSTALL_DIR)"
	@wget -q $$(cat $(INSTALL_DIR)/release.json | jq .assets[0].browser_download_url -r) -O $@
else
	@echo "pwninit is up to date"
endif
	@chmod 755 $@
	@chown $(USER):$(USER) $@

.PHONY: download release
release:
	@mkdir -p $(INSTALL_DIR)
	@curl -sSLq https://api.github.com/repos/io12/pwninit/releases/latest -o $(INSTALL_DIR)/release.json

update: download
download: release
	@wget -q $$(cat $(INSTALL_DIR)/release.json | jq .assets[0].browser_download_url -r) -O $@;
	@echo "Downloaded pwninit to $(INSTALL_DIR)"
