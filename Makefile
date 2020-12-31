
HOME_DIR = $(HOME)
BIN = $(HOME_DIR)/bin


all: bin nvim test

.PHONY: bin 
bin:
	mkdir -p $(BIN)

nvim:
	ln -s $$PWD/config/nvim $(HOME_DIR)/.config/nvim

test:
	ln -s $$PWD/config/test $(HOME_DIR)/.config/test
