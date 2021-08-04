{ config, pkgs, ... }: {
  imports = [
    ./packages.nix
    ./zsh/zsh.nix
    ./kitty/kitty.nix
    ./git/git.nix
  ];

  programs.home-manager.enable = true;

  home.username = "$USER";
  home.homeDirectory = "/home/$USER";

  home.stateVersion = "21.11";

  nixpkgs.config.allowUnfree = true;

  fonts.fontconfig.enable = true;

  home.file.".config/nvim".source = ./nvim;
  home.file.".config/i3".source = ./i3;
  home.file.".config/picom".source = ./picom;
  home.file.".config/polybar".source = ./polybar;
  home.file.".config/dunst".source = ./dunst;
  home.file.".config/rofi".source = ./rofi;
  home.file.".local/share/fonts" = {
    source = ./.local/share/fonts;
    onChange = "fc-cache -f -v";
    recursive = true;
  };
  home.file.".config/fontconfig/fonts.conf".source = ./fontconfig/fonts.conf;
  home.file.".local/bin" = {
    source = ./.local/bin;
    recursive = true;
  };
  home.file.".gitconfigs".source = ./git/.gitconfigs;

  # TODO: i3lock wrong password
}

