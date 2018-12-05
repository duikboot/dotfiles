all: update build-vimproc build-python-mode build-parinfer-rust build-jedi

build-vimproc:
	make -C vimproc clean
	make -C vimproc

build-jedi:
	git -C deoplete-jedi submodule update --init

# build-LanguageClient-neovim:
# 	cd LanguageClient-neovim && ./install.sh

build-python-mode:
	git -C python-mode submodule update --init

build-parinfer-rust:
	# cd parinfer-rust/cparinfer && cargo clean && cargo build --release
	cd parinfer-rust/cparinfer  && cargo build --release

update:
	./update.py
