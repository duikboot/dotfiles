.PHONY: all deoplete-jedi jedi-vim update build-python-mode build-deoplete-tabnine

all: update 
# all: update deoplete-jedi jedi-vim

# deoplete-jedi:
# 	git -C deoplete-jedi submodule update --init --recursive
# 
# jedi-vim:
# 	git -C jedi-vim submodule update --init --recursive
# 
# build-LanguageClient-neovim:
# 	cd LanguageClient-neovim && ./install.sh

build-python-mode:
	git -C python-mode submodule update --init

build-parinfer-rust:
	cd parinfer-rust && cargo clean && cargo build --release

build-deoplete-tabnine:
	cd deoplete-tabnine && ./install.sh

update: update.py modules
	./update.py
