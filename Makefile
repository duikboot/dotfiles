
HOME_DIR = $${HOME}
BIN = $(HOME_DIR)/bin
PWD_DIR = $${PWD}
SUBDIRS = $(PWD)/CONFIG
VIM_VIRTUALENV = $(HOME_DIR)/.dotfiles/.venv


# all: bin nvim stumpwm zprofile zsh

.PHONY: bin
bin:
	mkdir -p $${HOME}/bin

.PHONY: stumpwm
stumpwm:
	-rm ${HOME_DIR}/.stumpwmrc
	ln -s ${PWD}/_stumpwmrc ${HOME_DIR}/.stumpwmrc

.PHONY: inputrc
inputrc:
	-rm ${HOME_DIR}/.inputrc
	ln -s ${PWD}/_inputrc ${HOME_DIR}/.inputrc


.PHONY: tmux
tmux:
	-rm ${HOME_DIR}/.tmux.conf
	ln -s ${PWD}/_tmux.conf ${HOME_DIR}/.tmux.conf

.PHONY: oh-my-zsh
oh-my-zsh:
	git clone https://github.com/ohmyzsh/ohmyzsh.git ${HOME_DIR}/.oh-my-zsh

.PHONY: zprofile
zprofile:
	-rm ${HOME_DIR}/.$@
	ln -s ${PWD}/_$@ ${HOME_DIR}/.$@

.PHONY: zsh
zsh: oh-my-zsh
	-rm ${HOME_DIR}/.$@
	ln -s ${PWD}/_$@ ${HOME_DIR}/.$@

.PHONY: vim-venv
vim-venv:
	rm -rf $(VIM_VIRTUALENV)
	mkdir -p $(VIM_VIRTUALENV)
	python3 -m venv  $(VIM_VIRTUALENV)
	$(VIM_VIRTUALENV)//bin/pip install pip -U
	$(VIM_VIRTUALENV)/bin/pip install -r config/nvim/requirements.txt

.PHONY: ctags
ctags:
	-rm ${HOME_DIR}/.$@
	ln -s ${PWD}/_$@ ${HOME_DIR}/.$@

.PHONY: nvim
nvim: vim-venv vim-plug ctags
	-rm ${HOME_DIR}/.config/$@
	ln -sf ${PWD}/config/$@ ${HOME_DIR}/.config/$@

.PHONY: alactitty
alacritty:
	@echo symlink alaccritty
	-rm ${HOME_DIR}/.config/$@
	ln -s ${PWD}/config/$@ ${HOME_DIR}/.config/$@

.PHONY: vim-plug
vim-plug:
	curl -fLo "$${XDG_DATA_HOME:-$$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

.PHONY: git
git:
	-rm $(HOME_DIR)/.gitconfig
	ln -s ${PWD}/_gitconfig $(HOME_DIR)/.gitconfig
	-rm $(HOME_DIR)/.gitignore
	ln -s ${PWD}/_gitignore $(HOME_DIR)/.gitignore
