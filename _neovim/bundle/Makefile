.PHONY: all deoplete-jedi jedi-vim update build-parinfer-rust

all: update build-parinfer-rust deoplete-jedi jedi-vim
# all: update deoplete-jedi jedi-vim

deoplete-jedi:
	git -C deoplete-jedi submodule update --init --recursive

jedi-vim:
	git -C jedi-vim submodule update --init --recursive

build-parinfer-rust:
	cd parinfer-rust && cargo clean && cargo build --release

update: update.py modules
	./update.py
