#!/bin/bash

set -e

export STOW_FOLDERS="git, zsh, nvim"

if ! [ -x "$(command -v stow)" ]; then
    sudo apt install -y stow
fi

apt_packages=(
    curl
    git
    cowsay
    fortune
    grc
    nodejs
    npm
    zsh
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

brew_packages=(
    bat
    neovim
    fzf
    tokei
    thefuck
    lolcat
    lsd
    fd
    ripgrep
    the_silver_searcher
    tcpdump
    httpstat
    go
    gopls
    rust
    rust-analyzer
    lua-language-server
)

# install apt packages
for package in "${apt_packages[@]}"; do
    if ! [ "$(apt list --installed | grep "^$package")" ]; then
        echo installing $package
        if [ $package = "neovim" ]; then
            sudo add-apt-repository -y ppa:neovim-ppa/unstable
            sudo apt update
        fi

        sudo apt install -y $package
    fi
done

# install npm packages
for package in "${npm_packages[@]}"; do
    if ! [ "$(npm list -g 2> /dev/null | grep $package)" ]; then
        echo $package
        sudo npm i -g $package
    fi
done

# install homebrew packages
if ! [ -x "$(command -v brew)" ]; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" < /dev/null
    echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> ~/.profile
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi
for package in "${brew_packages[@]}"; do
    if ! [ "$(brew list | grep $package)" ]; then
        brew install $package
    fi
done

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

# set zsh as the default shell
printf "\nzsh" >> $HOME/.bashrc

# remove possibly pre-existing files so Stow doesn't conflict with them
rm ~/.zshrc || true

# link dotfiles
STOW_FOLDERS=$STOW_FOLDERS ./link.sh
