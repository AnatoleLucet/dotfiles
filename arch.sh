#!/bin/sh

set -e

export STOW_FOLDERS="git, fonts, zsh, nvim, i3, picom, polybar, rofi, kitty, dunst"

if ! [ -x "$(command -v stow)" ]; then
    sudo pacman -S stow --noconfirm
fi

# link dotfiles
STOW_FOLDERS=$STOW_FOLDERS ./link.sh

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

    # Langs/runtimes/compilers
    nodejs
    npm
    go
    python
    gcc
    meson
    ninja

    # Fonts
    powerline-fonts
    ttf-fira-code
    ttf-font-awesome
    noto-fonts-emoji

    # Others
    cmake
    libev
    grc
    tlp
)

npm_packages=(
    yarn
    tsun
    typescript
    typescript-language-server
    prettier
    eslint_d
    @fsouza/prettierd
)

aur_packages=(
    xcwd-git
    google-chrome
    picom-git
    i3lock-color
    betterlockscreen
    android-studio
)

# install packages
sudo pacman -Syy
for package in "${packages[@]}"; do
    if ! [ "$(pacman -Qi $package 2> /dev/null)" ]; then
        sudo pacman -S $package --noconfirm
    fi
done

# install npm packages
for package in "${npm_packages[@]}"; do
    if ! [ "$(npm list -g | grep $package)" ]; then
        sudo npm i -g $package
    fi
done

# install aura
if ! [ "$(pacman -Qm | grep aura)" ]; then
    sudo pacman -S --needed base-devel --noconfirm
    git clone https://aur.archlinux.org/aura-bin.git /tmp/aura-bin
    cd /tmp/aura-bin
    makepkg
    sudo pacman -U $(find . -maxdepth 1 -name "*.tar.zst") --noconfirm
    cd -
    rm -rf /tmp/aura-bin
fi

# install aur packages
aura_build_path=$HOME/.cache/aura-build
mkdir -p $aura_build_path
for package in "${aur_packages[@]}"; do
    if ! [ "$(pacman -Qm | grep $package)" ]; then
        sudo aura -A $package --noconfirm --build $aura_build_path
    fi
done
rm -rf $aura_build_path

# install insomnia
if ! [ "$(pacman -Qm | grep insomnia)" ]; then
    cd /tmp
    git clone https://aur.archlinux.org/insomnia-bin.git
    cd /tmp/insomnia-bin
    makepkg -s
    sudo pacman -U $(find . -maxdepth 1 -name "*.tar.zst") --noconfirm
    cd -
    rm -rf /tmp/insomnia-bin
fi

# install robo3t
if ! [ "$(pacman -Qm | grep robo3t)" ]; then
    cd /tmp
    git clone https://aur.archlinux.org/robo3t-bin.git
    cd /tmp/robo3t-bin
    makepkg -s
    sudo pacman -U $(find . -maxdepth 1 -name "*.tar.zst") --noconfirm
    cd -
    rm -rf /tmp/robo3t-bin
fi

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
    #sudo groupadd docker
    sudo usermod -aG docker $USER
fi

# set zsh as the default shell
sudo usermod -s $(which zsh) $USER
sudo chsh -s $(which zsh)
