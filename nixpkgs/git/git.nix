{
  programs.git = {
    enable = true;
    userName = "AnatoleLucet";
    userEmail = "anatole@hey.com";

    extraConfig = {
      core.editor = "nvim";
      pull.rebase = true;
      init.defaultBranch = "main";

      includeIf."gitdir:~/dev/git.ayaline.com/".path = "~/.gitconfigs/ayaline";
    };
  };
}
