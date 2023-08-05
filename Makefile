PYTHON = python3
HOME_DIR = $${HOME}
BIN = $(HOME_DIR)/bin
PWD_DIR = $${PWD}
SUBDIRS = $(PWD)/CONFIG
VIM_VIRTUALENV = $(HOME_DIR)/.dotfiles/.venv


all: bin nvim stumpwm zprofile zsh profile tmux

.PHONY: bin
bin:
	mkdir -p $${HOME}/bin

Wallpapers:
	mkdir -p ${HOME_DIR}/Wallpapers

sbcl:
	-rm ${HOME_DIR}/.sbclrc
	ln -s ${PWD}/_sbclrc ${HOME_DIR}/.sbclrc


.PHONY: stumpish
stumpish:
	-rm $(HOME_DIR)/bin/stumpish
	ln -s $(HOME_DIR)/stumpwm/stumpwm-contrib/util/stumpish/stumpish $(HOME_DIR)/bin/stumpish


.PHONY: stumpwm
stumpwm: Wallpapers
	-rm ${HOME_DIR}/.stumpwmrc
	ln -s ${PWD}/_stumpwmrc ${HOME_DIR}/.stumpwmrc

.PHONY: inputrc
inputrc:
	-rm ${HOME_DIR}/.inputrc
	ln -s ${PWD}/_inputrc ${HOME_DIR}/.inputrc

.PHONY: tpm
tpm:
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

.PHONY: tmux
tmux: tpm
	-rm ${HOME_DIR}/.tmux.conf
	ln -s ${PWD}/_tmux.conf ${HOME_DIR}/.tmux.conf

.PHONY: oh-my-zsh
oh-my-zsh:
	rm -rf ~/.oh-my-zsh
	git clone https://github.com/ohmyzsh/ohmyzsh.git ${HOME_DIR}/.oh-my-zsh

.PHONY: zprofile
zprofile:
	-rm ${HOME_DIR}/.$@
	ln -s ${PWD}/_$@ ${HOME_DIR}/.$@

.PHONY: profile
profile:
	-rm ${HOME_DIR}/.$@
	ln -s ${PWD}/_$@ ${HOME_DIR}/.$@

.PHONY: zshrc
zshrc: oh-my-zsh zprofile
	-rm ${HOME_DIR}/.$@
	ln -s ${PWD}/_$@ ${HOME_DIR}/.$@

.PHONY: vim-venv
vim-venv:
	rm -rf $(VIM_VIRTUALENV)
	mkdir -p $(VIM_VIRTUALENV)
	$(PYTHON) -m venv  $(VIM_VIRTUALENV)
	$(VIM_VIRTUALENV)/bin/pip install pip -U
	$(VIM_VIRTUALENV)/bin/pip install -r config/nvim/requirements.txt

.PHONY: ctags
ctags:
	-rm ${HOME_DIR}/.$@
	ln -s ${PWD}/_$@ ${HOME_DIR}/.$@

packer:
	-git clone --depth 1 https://github.com/wbthomason/packer.nvim\
		~/.local/share/nvim/site/pack/packer/start/packer.nvim

nvim-plugins:
	nvim +PackerInstall

.PHONY: nvim-ls
nvim-ls:
	-rm ${HOME_DIR}/.config/nvim
	ln -sf ${PWD}/config/nvim ${HOME_DIR}/.config/nvim

.PHONY: nvim
nvim: packer nvim-ls vim-venv ctags nvim-plugins

.PHONY: alactitty
alacritty:
	@echo symlink alaccritty
	-rm ${HOME_DIR}/.config/$@
	ln -s ${PWD}/config/$@ ${HOME_DIR}/.config/$@


.PHONY: git
git:
	-rm $(HOME_DIR)/.gitconfig
	ln -s ${PWD}/_gitconfig $(HOME_DIR)/.gitconfig
	-rm $(HOME_DIR)/.gitignore
	ln -s ${PWD}/_gitignore $(HOME_DIR)/.gitignore
