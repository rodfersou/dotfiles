# convenience makefile to boostrap & run buildout
SHELL := /bin/bash
CURRENT_DIR:=$(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))


# We like colors
# From: https://coderwall.com/p/izxssa/colored-makefile-for-golang-projects
RED=`tput setaf 1`
GREEN=`tput setaf 2`
RESET=`tput sgr0`
YELLOW=`tput setaf 3`

version = 2.7

all: mount

# Add the following 'help' target to your Makefile
# And add help text after each target name starting with '\#\#'
.PHONY: help
help: ## This help message
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: mount
mount:  ## Mount crypted dir
	@echo "$(GREEN)==> Mount crypted dir$(RESET)"
	encfs -s  $(CURRENT_DIR)/encrypted $(CURRENT_DIR)/sensitive
	ls $(CURRENT_DIR)/sensitive

.PHONY: umount
umount:  ## Umount crypted dir
	@echo "$(YELLOW)==> Umount crypted dir$(RESET)"
	fusermount -u $(CURRENT_DIR)/sensitive

.PHONY: install
install:  ## Install dotfiles
	@echo "$(GREEN)==> Install dotfiles$(RESET)"
	ln -sf $(CURRENT_DIR)/common/rcrc $(HOME)/.rcrc
	(cd $(HOME) && rcup)

.PHONY: install-linux
install-linux:  ## Install dotfiles for linux
	@echo "$(GREEN)==> Install dotfiles for linux$(RESET)"
	make install
	(cd $(HOME) && rcup -t linux)

.PHONY: install-osx
install-osx:  ## Install dotfiles for osx
	@echo "$(GREEN)==> Install dotfiles for osx$(RESET)"
	make install
	(cd $(HOME) && rcup -t osx)

.PHONY: uninstall
uninstall:  ## Uninstall dotfiles
	@echo "$(RED)==> Uninstall dotfiles$(RESET)"
	(cd $(HOME) && rcdn)
	rm $(HOME)/.rcrc

.PHONY: all
