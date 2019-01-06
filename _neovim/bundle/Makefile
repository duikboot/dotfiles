.PHONY: all deoplete-jedi jedi-vim update build-deoplete-tabnine

all: update build-parinfer-rust deoplete-jedi jedi-vim deoplete-tabnine
# all: update deoplete-jedi jedi-vim

deoplete-jedi:
	git -C deoplete-jedi submodule update --init

jedi-vim:
	git -C jedi-vim submodule update --init

# build-LanguageClient-neovim:
# 	cd LanguageClient-neovim && ./install.sh

build-python-mode:
	git -C python-mode submodule update --init

build-parinfer-rust:
	cd parinfer-rust && cargo clean && cargo build --release
	# cd parinfer-rust/cparinfer  && cargo build --release
	#
build-deoplete-tabnine:
	cd deoplete-tabnine && ./install.sh

update:
	./update.py
