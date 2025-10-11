#!/bin/sh

set -e

export STOW_FOLDERS="git, fonts, zsh, nvim, gnome, keyd, wezterm, tmux, tms"

# install packages
packages=(
    # Shells
    zsh

    # CLIs
    yay
    stow
    git
    bat
    curl
    docker
    docker-compose
    feh
    tree
    ripgrep
    the_silver_searcher
    fd
    # cowsay
    # fortune-mod
    lsd
    # lolcat
    # thefuck
    tokei
    fzf
    # github-cli
    dnsutils
    openvpn
    tcpdump
    nmap
    bat
    parallel
    zoxide
    atuin
    tmux
    
    # TUIs
    neovim
    htop

    # Apps
    # kitty
    redshift
    pavucontrol
    pasystray
    # polybar
    sqlite
    # rofi
    # dunst
    # i3-gaps
    # peek
    # solaar
    # picom
    wezterm

    # Langs/runtimes/compilers
    nodejs
    deno
    npm
    go
    python
    python-pip
    gcc
    meson
    ninja
    rust
    jdk11-openjdk

    # Fonts
    powerline-fonts
    ttf-fira-sans
    ttf-fira-code
    ttf-font-awesome
    noto-fonts-emoji

    # LSPs
    # gopls
    # yaml-language-server
    # rust-analyzer
    # lua-language-server

    # Others
    base-devel
    cmake
    libev
    grc
    tlp
    powertop
    python-pynvim
    python-pytorch
    xdotool
    bluez
    bluez-utils
    brightnessctl
    xclip
    xsel
)

npm_packages=(
    yarn
    pnpm
    tsun
    typescript
    # typescript-language-server
    # svelte-language-server
    # graphql-language-service-cli
    # bash-language-server
    # vscode-langservers-extracted
    # vls
    # prettier
    # eslint_d
    # @fsouza/prettierd
    nodemon
    # fnm
)

aur_packages=(
    google-chrome
    # xcwd-git
    siji-git
    # i3lock-color
    # betterlockscreen
    httpstat-go
    ttf-poppins
    # slack-desktop
    write-good
    # vim-language-server
    # dockerfile-language-server
    dive
    # picom-git
    # spotify
    dyn-wall-rs
    tidy-viewer
    # mongodb-compass
    keyd-git
    # bunjs-bin
    visual-studio-code-bin
    git-delta
    tmux-plugin-manager
)

# install packages
sudo pacman -Syu ${packages[@]} --noconfirm --needed

# install npm packages
sudo npm i -g ${npm_packages[@]}

# install aur packages
yay -Syu ${aur_packages[@]} --noconfirm --needed

# install oh-my-zsh
if ! [ -e $HOME/.oh-my-zsh ]; then
  sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh) --unattended"

  plugin_dir=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${plugin_dir}/zsh-syntax-highlighting
  git clone https://github.com/zsh-users/zsh-autosuggestions ${plugin_dir}/zsh-autosuggestions
  git clone https://github.com/softmoth/zsh-vim-mode ${plugin_dir}/zsh-vim-mode
  git clone https://github.com/Aloxaf/fzf-tab ${plugin_dir}/fzf-tab
fi

# install cht.sh
curl -s https://cht.sh/:cht.sh | sudo tee /usr/local/bin/cht && sudo chmod +x /usr/local/bin/cht

# install sessionizer
cargo install tmux-sessionizer

# install tmux plugins
tmux new-session -d 'run-shell "source ~/.tmux.conf; ~/.tmux/plugins/tpm/bin/install_plugins"'

# TODO: move theses configs to independent postinstall scripts

# refresh fonts
fc-cache -r

# create docker group
if ! [ "$(groups | grep docker)" ]; then
    sudo groupadd docker || true
    sudo usermod -aG docker $USER
fi

# enable services
sudo systemctl enable --now docker.service
sudo systemctl enable --now keyd.service

# keyd config
sudo ln -sf ~/.config/keyd/default.conf /etc/keyd/default.conf

# set zsh as the default shell
sudo usermod -s $(which zsh) $USER
sudo chsh -s $(which zsh)

# remove possibly pre-existing files so Stow doesn't conflict with them
rm ~/.zshrc || true

# link dotfiles
STOW_FOLDERS=$STOW_FOLDERS ./link.sh
