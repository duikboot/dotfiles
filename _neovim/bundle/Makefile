all: update build-vimproc build-jedi build-python-mode build-parinfer-rust

build-vimproc:
	make -C vimproc clean
	make -C vimproc

build-jedi:
	git -C jedi submodule update --init

build-python-mode:
	git -C python-mode submodule update --init

build-parinfer-rust:
	cd parinfer-rust/cparinfer && cargo clean && cargo build --release

update:
	./update.py
