
HOME_DIR = $${HOME}
BIN = $(HOME_DIR)/bin
PWD = $${PWD}
SUBDIRS = $(PWD)/CONFIG


all: bin nvim test subs

.PHONY: bin
bin:
	mkdir -p $${HOME}/bin

stumpwm:
	ln -s ${PWD}/_stumpwmrc ${HOME_DIR}/.stumpwmrc

nvim: vim-plug
	ln -s ${PWD}/config/$@ $(HOME_DIR)/.config/$@

test:
	ln -s ${PWD}/config/test $(HOME_DIR)/.config/test

vim-plug:
	curl -fLo "$${XDG_DATA_HOME:-$$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
