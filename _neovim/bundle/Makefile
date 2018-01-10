all: update build-vimproc build-jedi build-python-mode

build-vimproc:
	make -C vimproc clean
	make -C vimproc

build-jedi:
	git -C jedi submodule update --init

build-python-mode:
	git -C python-mode submodule update --init

update:
	./update.py
