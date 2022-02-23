#!/bin/sh

set -e

export STOW_FOLDERS="git, fonts, zsh, nvim, i3, picom, polybar, rofi, kitty, dunst"

# remove possibly pre-existing files that would conflict with stow
rm -rf ~/.zshrc

sudo pacman -Syy
if ! [ -x "$(command -v stow)" ]; then
    sudo pacman -S stow --noconfirm
fi

# spotify public key
curl -sS https://download.spotify.com/debian/pubkey_0D811D58.gpg | gpg --import -

# install packages
packages=(
    # Shells
    zsh

    # CLIs
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
    vscode
    rofi
    dunst
    i3-gaps
    peek
    # picom

    # Langs/runtimes/compilers
    nodejs
    npm
    go
    python
    python-pip
    gcc
    meson
    ninja
    rust

    # Fonts
    powerline-fonts
    ttf-fira-sans
    ttf-fira-code
    ttf-font-awesome
    noto-fonts-emoji

    # LSPs
    gopls
    bash-language-server
    vscode-css-languageserver
    yaml-language-server
    rust-analyzer
    lua-language-server

    # Others
    cmake
    libev
    grc
    tlp
    powertop
    python-pynvim
    python-pytorch
)

npm_packages=(
    yarn
    pnpm
    tsun
    typescript
    typescript-language-server
    svelte-language-server
    graphql-language-service-cli
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
    robo3t-bin
    google-chrome
)

aur_packages=(
    xcwd-git
    siji-git
    i3lock-color
    betterlockscreen
    android-studio
    httpstat-go
    ttf-poppins
    slack-desktop
    write-good
    vim-language-server
    dockerfile-language-server
    nosqlbooster-mongodb
    dive
    picom-git
    watchman
    spotify
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

# install nvim plugins
if ! [ -e $HOME/.local/share/nvim/site/autoload/plug.vim ]; then
    curl -fLo $HOME/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    nvim --headless +PlugInstall +qall 2> /dev/null
fi

# install oh-my-zsh
if ! [ -e $HOME/.oh-my-zsh ]; then
    sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh) --unattended"
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    git clone https://github.com/softmoth/zsh-vim-mode ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-vim-mode
    git clone https://github.com/Aloxaf/fzf-tab ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-tab
fi

# refresh fonts
fc-cache -r

# create docker group
if ! [ "$(groups | grep docker)" ]; then
    sudo groupadd docker
    sudo usermod -aG docker $USER
fi

# start docker socket on boot
if ! [ -e /usr/lib/systemd/system/docker.service ]; then
    sudo systemctl enable --now docker.service
fi

# create nosqlbooster bin
if ! [ -e /usr/bin/nosqlbooster ]; then
    sudo ln -s /opt/nosqlbooster-mongodb/nosqlbooster4mongo /usr/bin/nosqlbooster
fi

# set zsh as the default shell
sudo usermod -s $(which zsh) $USER
sudo chsh -s $(which zsh)

# remove possibly pre-existing files so Stow doesn't conflict with them
rm ~/.zshrc || true

# link dotfiles
STOW_FOLDERS=$STOW_FOLDERS ./link.sh
