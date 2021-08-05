{ pkgs, ... }: {
  home.packages = with pkgs; [
    # CLIs
    curl
    wget
    docker
    docker-compose
    feh
    tree
    ripgrep
    silver-searcher
    fd
    neo-cowsay
    fortune
    lsd
    lolcat
    yarn
    nodePackages.tsun
    nodePackages.typescript
    nodePackages.typescript-language-server
    nodePackages.prettier
    nodePackages.eslint_d
    xcwd
    thefuck
    curl

    # TUIs
    neovim
    htop

    # Apps
    google-chrome
    redshift
    pulseaudio
    pavucontrol
    pasystray
    picom
    polybarFull
    sqlite
    vscode
    rofi
    i3lock-color
    dunst
    betterlockscreen
    insomnia

    # Langs/runtimes/compilers
    nodejs
    go
    python39Full
    gcc
    meson
    ninja

    # Fonts
    powerline-fonts
    (nerdfonts.override { fonts = [ "FiraCode" ]; })
    font-awesome
    noto-fonts-emoji

    # Others
    cmake
    libev
    grc
  ];
}
