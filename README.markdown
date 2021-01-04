Based on https://github.com/sontek/dotfiles

## Neovim
config/nvim
    my neovim configuration

Prerequisites:
    - fd
    - the_silver_searcher
    - bat

Then run:
`make vim-venv nvim`

This will create a virtualenv for the necessary python packages and
create the symlinks for the neovim configuration.
The first time you run neovim, it wil generate error messages,
because the plugins are not installed yet.
So within neovim run
`:PlugInstall`


Install:
- stumpwm


