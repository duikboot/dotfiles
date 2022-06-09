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
    - xclip/xsel
    - feh
    - rlwrap
    - docker
    - docker-compose
    - alacritty
    - keychain
    - cmake
    - ctags
    - treesitter
    - fzf
    - tmux
    - vlime
    - nordvpn
    - stumpwm
    - stumpwm-contrib
    - neovim
        - sudo pamac install rg
        - sudo pamac install ripgrep
        - sudo pamac install fd
        - sudo pamac install tree-sitter
        - make CMAKE_EXTRA_FLAGS="-DCMAKE_INSTALL_PREFIX:PATH=$HOME/bin/neovim" CMAKE_BUILD_TYPE=RelWithDebInfo && make install

