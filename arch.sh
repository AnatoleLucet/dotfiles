#!/bin/sh

set -e

export STOW_FOLDERS="git, fonts, zsh, nvim, i3, picom, polybar, rofi, kitty, dunst, gnome, keyd, wezterm"

sudo pacman -Syy

# spotify public key
if ! [ "$(gpg --list-keys | grep Spotify)" ]; then
    curl -sS https://download.spotify.com/debian/pubkey_5E3C45D7B312C643.gpg | gpg --import -
fi

# install packages
packages=(
    # Shells
    zsh

    # CLIs
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
    cowsay
    fortune-mod
    lsd
    lolcat
    thefuck
    tokei
    fzf
    github-cli
    dnsutils
    openvpn
    tcpdump
    nmap
    bat
    parallel
    zoxide
    atuin
    
    # TUIs
    neovim
    htop

    # Apps
    kitty
    redshift
    pavucontrol
    pasystray
    polybar
    sqlite
    rofi
    dunst
    i3-gaps
    peek
    solaar
    # picom

    # Langs/runtimes/compilers
    nodejs
    nvm
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
    gopls
    yaml-language-server
    rust-analyzer
    lua-language-server

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
)

npm_packages=(
    yarn
    pnpm
    tsun
    typescript
    typescript-language-server
    svelte-language-server
    graphql-language-service-cli
    bash-language-server
    vscode-langservers-extracted
    vls
    prettier
    eslint_d
    @fsouza/prettierd
    nodemon
)

bin_aur_packages=(
    aura-bin
    # neovim-nightly-bin
    insomnia-bin
    # robo3t-bin
    google-chrome
)

aur_packages=(
    xcwd-git
    siji-git
    i3lock-color
    betterlockscreen
    httpstat-go
    ttf-poppins
    slack-desktop
    write-good
    vim-language-server
    dockerfile-language-server
    # dive
    picom-git
    # spotify
    dyn-wall-rs
    onedrive-abraunegg
    tidy-viewer
    mongodb-compass
    keyd-git
    # bunjs-bin
    visual-studio-code-bin
)

# install packages
for package in "${packages[@]}"; do
    if ! [ "$(pacman -Qi $package 2> /dev/null)" ]; then
        sudo pacman -S $package --noconfirm
    fi
done

# install npm packages
for package in "${npm_packages[@]}"; do
    if ! [ "$(npm list -g --depth=0 | grep $package@)" ]; then
        sudo npm i -g $package
    fi
done

# install bin aur packages
for package in "${bin_aur_packages[@]}"; do
    if ! [ "$(pacman -Qm | grep $package)" ]; then
        tmpfolder=$(mktemp -d /tmp/$package.XXXXX)
        cd $tmpfolder
        git init -b tmp
        git remote add origin https://aur.archlinux.org/$package.git
        git fetch
        git checkout master
        makepkg -s
        sudo pacman -U $(find . -maxdepth 1 -name "*.tar.zst") --noconfirm
        cd -
        rm -rf $tmpfolder
    fi
done

# install aur packages
aura_build_path=$HOME/.cache/aura-build
mkdir -p $aura_build_path
for package in "${aur_packages[@]}"; do
    if ! [ "$(pacman -Qm | grep $package)" ]; then
        sudo aura -A $package --noconfirm --build $aura_build_path
    fi
done
rm -rf $aura_build_path

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

# TODO: move theses configs to independent postinstall scripts

# refresh fonts
fc-cache -r

# create docker group
if ! [ "$(groups | grep docker)" ]; then
    sudo groupadd docker || true
    sudo usermod -aG docker $USER
fi

# start docker socket on boot
if ! [ -e /usr/lib/systemd/system/docker.service ]; then
    sudo systemctl enable --now docker.service
fi
#
# start keyd socket on boot
if ! [ -e /usr/lib/systemd/system/docker.service ]; then
    sudo systemctl enable --now keyd.service
fi

# start onedrive monitor on boot
if ! [ -e /usr/lib/systemd/system/onedrive@.service ]; then
    # sudo systemctl enable --now onedrive@$USER
   echo ""
fi

# sync onedrive if not already
if ! [ -e ~/OneDrive ]; then
    # onedrive --synchronize
   echo ""
fi

# keyd config
sudo ln -sf ~/.config/keyd/default.conf /etc/keyd/default.conf

# set zsh as the default shell
sudo usermod -s $(which zsh) $USER
sudo chsh -s $(which zsh)

# remove possibly pre-existing files so Stow doesn't conflict with them
rm ~/.zshrc || true

# link dotfiles
STOW_FOLDERS=$STOW_FOLDERS ./link.sh
