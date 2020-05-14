# convenience makefile to boostrap & run buildout
SHELL := /bin/bash
CURRENT_DIR:=$(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))
CURRENT_OS:=$(shell uname -s)
ifeq ($(CURRENT_OS),Linux)
	CURRENT_OS:=$(shell lsb_release -si)
endif


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
	encfs -s $(CURRENT_DIR)/encrypted $(CURRENT_DIR)/sensitive

.PHONY: umount
umount:  ## Umount crypted dir
	@echo "$(YELLOW)==> Umount crypted dir$(RESET)"
	encfs -u $(CURRENT_DIR)/sensitive

.PHONY: install-apps
install-apps:  ## Install Apps
	@echo "$(GREEN)==> Install Apps$(RESET)"
ifeq ($(CURRENT_OS),Ubuntu)
ifeq (,$(wildcard /usr/bin/google-chrome-stable))
	wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
	sudo dpkg -i google-chrome-stable_current_amd64.deb
	rm google-chrome-stable_current_amd64.deb
endif
	sudo apt -y install                   \
		build-essential                   \
		chrome-gnome-shell                \
		curl                              \
		deluge                            \
		encfs                             \
		git                               \
		gnome-tweak-tool                  \
		handbrake                         \
		handbrake-cli                     \
		htop                              \
		httpie                            \
		jq                                \
		kdiff3                            \
		libappindicator-dev               \
		mkchromecast                      \
		mpv                               \
		neovim                            \
		network-manager-openconnect-gnome \
		ranger                            \
		rcm                               \
		scrcpy                            \
		screen                            \
		silversearcher-ag                 \
		smplayer                          \
		ssh                               \
		texlive-full                      \
		tidy                              \
		tilda                             \
		tree                              \
		vim-gtk                           \
		wget                              \
		zsh
	sudo snap install --classic code
	sudo snap install --classic discord
	sudo snap install --classic gitter-desktop
	sudo snap install --classic hub
	sudo snap install --classic signal-desktop
	sudo snap install --classic skype
	sudo snap install --classic slack
endif
ifeq ($(CURRENT_OS),Darwin)
endif

.PHONY: install-plone-deps
install:  ## Install Plone dependencies
	@echo "$(GREEN)==> Install Plone dependencies$(RESET)"
ifeq ($(CURRENT_OS),Ubuntu)
	sudo apt -y install   \
		 htmldoc          \
		 libfreetype6-dev \
		 libjpeg62-dev    \
		 liblcms2-dev     \
		 libldap2-dev     \
		 libpng-dev       \
		 libreadline-dev  \
		 libsasl2-dev     \
		 libxml2-dev      \
		 libxslt1-dev     \
		 libyaml-dev      \
		 lynx             \
		 recode           \
		 zlib1g-dev
endif
ifeq ($(CURRENT_OS),Darwin)
endif

.PHONY: install
install:  ## Install dotfiles
	@echo "$(GREEN)==> Install dotfiles$(RESET)"
ifeq ($(CURRENT_OS),Ubuntu)
	ln -sf $(CURRENT_DIR)/rcrc-linux $(HOME)/.rcrc
endif
ifeq ($(CURRENT_OS),Darwin)
	ln -sf $(CURRENT_DIR)/rcrc-osx $(HOME)/.rcrc
endif
	(cd $(HOME) && rcup)
	(cd $(HOME)/.ssh/ids && chmod 600 *)

.PHONY: install-all
install-all:  ## Install everything
	@echo "$(GREEN)==> Install everything$(RESET)"
	make install-apps
	make install

.PHONY: uninstall
uninstall:  ## Uninstall dotfiles
	@echo "$(RED)==> Uninstall dotfiles$(RESET)"
	(cd $(HOME) && rcdn)
	rm $(HOME)/.rcrc

.PHONY: uninstall
reinstall:  ## Uninstall dotfiles
	make uninstall
	make install

.PHONY: generalfixes
generalfixes:  ## General Fixes
ifeq ($(CURRENT_OS),Ubuntu)
	sed -e '/^\%sudo/ s/\ ALL$/\ NOPASSWD:ALL/' -i /etc/sudoers
	sed -e '/pattern\=\"PDF\"/ s/\(.*\)/\<\!\-\- \1 \-\-\/\>/' -i /etc/ImageMagick-6/policy.xml
	# Fix anaconda shims
	# http https://raw.githubusercontent.com/pyenv/pyenv/master/pyenv.d/rehash/conda.d/default.list | grep -v "\#" | xargs rm
endif
ifeq ($(CURRENT_OS),Darwin)
endif

.PHONY: all
