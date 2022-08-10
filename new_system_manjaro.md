https://www.fosslinux.com/46741/things-to-do-after-installing-manjaro.htm
- point to fastest mirror
  - sudo pacman-mirrors --fasttrack
- update system
  - sudo pacman -Syyu
- enable aur
- install yay
- install lxdm
    - sudo pamac install lxdm
    - sudo systemctl enable lxdm --force
- make grub menu visible
    - sudo vim /etc/default/grub
       set GRUB_TIMEOUT_STYLE=menu
       sudo update-grub
- install and enable zsh
- create aliasses (ll)
install packages:
    - yay -Syyu betterlockscreen
        - cp /usr/share/doc/betterlockscreen/examples/betterlockscreenrc ~/.config
        - # enable systemd service
           systemctl enable betterlockscreen@$USER
    - pamac install nerd-fonts-source-code-pro
    - sudo pamac install xclip/xsel
    - sudo pamac install xcape
    - sudo pamac install feh
    - sudo pamac install rlwrap
    - sudo pamac install docker
    - sudo pamac install docker-compose
    - sudo pamac install alacritty
    - sudo pamac install keychain
    - sudo pamac install cmake
    - sudo pamac install ctags
    - sudo pamac install treesitter
    - sudo pamac install fzf
    - sudo pamac install tmux
    - install vlime
    -pamac install nordvpn
    - stumpwm
    - stumpwm-contrib
    - neovim
        - sudo pamac install ripgrep
        - sudo pamac install fd
        - sudo pamac install tree-sitter
        - make CMAKE_EXTRA_FLAGS="-DCMAKE_INSTALL_PREFIX:PATH=$HOME/bin/neovim" CMAKE_BUILD_TYPE=RelWithDebInfo && make install

