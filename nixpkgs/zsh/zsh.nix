{ pkgs, ... }: {
  programs.zsh = {
    enable = true;

    initExtra = builtins.readFile ./.zshrc;
    envExtra = builtins.readFile ./.zshenv;

    plugins = [
      {
        name = "zsh-autosuggestions";
        src = pkgs.fetchFromGitHub {
          owner = "zsh-users";
          repo = "zsh-autosuggestions";
          rev = "v0.7.0";
          sha256 = "0z6i9wjjklb4lvr7zjhbphibsyx51psv50gm07mbb0kj9058j6kc";
        };
      }
      {
        name = "zsh-syntax-highlighting";
        src = pkgs.fetchFromGitHub {
          owner = "zsh-users";
          repo = "zsh-syntax-highlighting";
          rev = "v0.7.1";
          sha256 = "03r6hpb5fy4yaakqm3lbf4xcvd408r44jgpv4lnzl9asp4sb9qc0";
        };
      }
      {
        name = "fzf-tab";
        src = pkgs.fetchFromGitHub {
          owner = "Aloxaf";
          repo = "fzf-tab";
          rev = "bc086fc38cfd680a90c694210fa5c5d88e3d1691";
          sha256 = "17in1byqxw8d6av30fpl4dlri2wma543aymp6a9xpibr64lmi373";
        };
      }
    ];

    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
      plugins = [
        "bazel"
        "extract"
        "git"
        "emoji"
        "docker"
        "gitfast"
        "golang"
        "grc"
        "kubectl"
        "thefuck"
        "vi-mode"
      ];
    };
  };

  programs.fzf.enable = true;
}
