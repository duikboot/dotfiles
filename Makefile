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

.PHONY: tmux-sessionizer
tmux-sessionizer:
	-rm $(HOME_DIR)/bin/tmux-sessionizer
	ln -s ${PWD}/bin/tmux-sessionizer $(HOME_DIR)/bin/tmux-sessionizer

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
tmux: tpm tmux-sessionizer
	-rm ${HOME_DIR}/.tmux.conf
	ln -s ${PWD}/_tmux.conf ${HOME_DIR}/.tmux.conf

.PHONY: zprofile
zprofile:
	-rm ${HOME_DIR}/.$@
	ln -s ${PWD}/config/zsh/.zprofile ${HOME_DIR}/.$@

.PHONY: profile
profile:
	-rm ${HOME_DIR}/.$@
	ln -s ${PWD}/_$@ ${HOME_DIR}/.$@

.PHONY: zshrc
zshrc: zprofile
	-rm ${HOME_DIR}/.$@
	ln -s ${PWD}/config/zsh/.zshrc ${HOME_DIR}/.$@

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

.PHONY: nvim-ls
nvim-ls:
	-rm ${HOME_DIR}/.config/nvim
	ln -sf ${PWD}/config/nvim ${HOME_DIR}/.config/nvim

rm-treesitter-tmp-make:
	-rm -rf ${HOME_DIR}/.local/share/nvim/

nvim-sessions-dir:
	mkdir -p ${HOME_DIR}/.local/share/nvim/session/

.PHONY: nvim
nvim: nvim-ls vim-venv ctags rm-treesitter-tmp-make nvim-sessions-dir

.PHONY: alactitty
alacritty:
	@echo symlink alaccritty
	-rm ${HOME_DIR}/.config/$@
	ln -s ${PWD}/config/$@ ${HOME_DIR}/.config/$@

.PHONY: kitty
kitty:
	@echo symlink kitty
	-rm ${HOME_DIR}/.config/$@
	ln -s ${PWD}/config/$@ ${HOME_DIR}/.config/$@

.PHONY: git
git:
	-rm $(HOME_DIR)/.gitconfig
	ln -s ${PWD}/_gitconfig $(HOME_DIR)/.gitconfig
	-rm $(HOME_DIR)/.gitignore
	ln -s ${PWD}/_gitignore $(HOME_DIR)/.gitignore
