# function virtualenv_info { 
#     [ $VIRTUAL_ENV ] && echo '('`basename $VIRTUAL_ENV`') '
# }

export GDK_CORE_DEVICE_EVENTS=1

# For dotfiles
export XDG_CONFIG_HOME="$HOME/.config"
#
# # for specific data
export XDG_DATA_HOME="$XDG_CONFIG_HOME/local/share"
#
# # for cached
export XDG_DATA_CACHE="$XDG_CONFIG_HOME/cache"
#
export DOTFILES="$HOME/config/dotfiles"
#
# export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
#
export EDITOR="nvim"
# export VISUAL="nvim"

PATH=${HOME}/bin:${HOME}/.local/bin:$PATH; export PATH;
