
HOME_DIR = $${HOME}
BIN = $(HOME_DIR)/bin
PWD = $${PWD}
SUBDIRS = $(PWD)/CONFIG
VIM_VIRTUALENV = $(HOME_DIR)/.dotfiles/.venv


all: bin nvim stumpwm zprofile zsh

.PHONY: bin
bin:
	mkdir -p $${HOME}/bin

stumpwm:
	ln -s ${PWD}/_stumpwmrc ${HOME_DIR}/.stumpwmrc


tmux:
	ln -s ${PWD}/_tmux.conf ${HOME_DIR}/.tmux.conf

oh-my-zsh:
	git clone https://github.com/ohmyzsh/ohmyzsh.git ${HOME_DIR}/.oh-my-zsh

zprofile:
	ln -s ${PWD}/_zprofile ${HOME_DIR}/.zprofile

zsh: oh-my-zsh
	ln -s ${PWD}/_zshrc ${HOME_DIR}/.zshrc

vim-venv:
	mkdir -p $(VIM_VIRTUALENV)
	python3 -m venv  $(VIM_VIRTUALENV)
	$(VIM_VIRTUALENV)//bin/pip install pip -U
	$(VIM_VIRTUALENV)/bin/pip install -r config/nvim/requirements.txt

nvim: vim-plug
	ln -s ${PWD}/config/$@ $(HOME_DIR)/.config/$@

alacritty:
	ln -s ${PWD}/config/$@ $(HOME_DIR)/.config/$@

vim-plug:
	curl -fLo "$${XDG_DATA_HOME:-$$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
