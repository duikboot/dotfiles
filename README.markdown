Based on https://github.com/sontek/dotfiles

## Neovim
config/nvim
    my neovim configuration

Prerequisites:

    - fd
    - the_silver_searcher
    - bat
    - jedi-language-server (`pip install jedi-language-server --user`)
    - vimls (vim language server)
    - lua-language-server

Then run:
`make vim-venv nvim`

This will create a virtualenv for the necessary python packages and
create the symlinks for the neovim configuration.
The first time you run neovim, it will generate error messages,
because the plugins are not installed yet.
So within neovim run
`:PlugInstall`


Windowmanager:
Install Stumpwm, well, because Lisp!


