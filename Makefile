
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


tmux:
	ln -s ${PWD}/_tmux.conf ${HOME_DIR}/.tmux.conf

zsh:
	git clone https://github.com/ohmyzsh/ohmyzsh.git ${HOME_DIR}/.oh-my-zsh
	ln -s ${PWD}/_zshrc ${HOME_DIR}/.zshrc



nvim: vim-plug
	ln -s ${PWD}/config/$@ $(HOME_DIR)/.config/$@

alacritty:
	ln -s ${PWD}/config/$@ $(HOME_DIR)/.config/$@

vim-plug:
	curl -fLo "$${XDG_DATA_HOME:-$$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
