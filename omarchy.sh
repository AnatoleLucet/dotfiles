#!/bin/sh

set -e

export STOW_FOLDERS="git, zsh, nvim, keyd, wezterm, tmux, tms, omarchy"

# install packages
packages=(
    # Shells
    zsh

    # CLIs
    stow
    tree
    lsd
    ripgrep
    fd
    tokei
    fzf
    dnsutils
    parallel
    zoxide
    atuin
    tmux

    # TUIs
    neovim

    # Langs/runtimes/compilers
    deno
    go
    rust
    ninja

    # Fonts
    powerline-fonts
    ttf-fira-sans
    ttf-fira-code
    ttf-font-awesome
    noto-fonts-emoji

    # Others
    keyd
)

npm_packages=(
    yarn
    pnpm
    typescript
)

aur_packages=(
    # Apps
    # google-chrome
    wezterm-git

    # Fonts
    siji-git
    ttf-poppins

    # TUIs
    httpstat-go
    dive
    tidy-viewer

    # Others
    git-delta
    tmux-plugin-manager
)

# install packages
sudo pacman -Syu ${packages[@]} --noconfirm --needed

# install npm packages
npm i -g ${npm_packages[@]}

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

# install sessionizer
cargo install tmux-sessionizer

# refresh fonts
fc-cache -r

# enable services
sudo systemctl enable --now keyd.service

# keyd config
sudo ln -sf ~/.config/keyd/default.conf /etc/keyd/default.conf

# set zsh as the default shell
sudo usermod -s $(which zsh) $USER
sudo chsh -s $(which zsh)

# remove possibly pre-existing files so Stow doesn't conflict with them
rm ~/.zshrc || true
rm ~/.config/fontconfig || true
rm ~/.local/share/fonts/MonoLisa* || true
rm ~/.config/nvim || true
rm ~/.config/hypr || true

# link dotfiles
STOW_FOLDERS=$STOW_FOLDERS ./link.sh

# install tmux plugins
tmux new-session -d 'run-shell "source ~/.tmux.conf; ~/.tmux/plugins/tpm/bin/install_plugins"'
