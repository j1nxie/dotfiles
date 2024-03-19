{ configs, pkgs, ... }:

{
  programs.git = {
    enable = true;
    lfs.enable = true;
    userName = "j1nxie";
    userEmail = "rylieeeeexd@gmail.com";
    extraConfig = {
      init = {
        defaultBranch = "main";
      };
      user = {
        signingkey = "/home/lumi/.ssh/id_ed25519.pub";
      };
      core = {
        editor = "nvim";
        pager = "delta";
        autocrlf = "input";
        excludesfile = "/home/lumi/.gitignore_global";
      };
      pull = {
        rebase = true;
      };
      color = {
        ui = "auto";
      };
      credential = {
        helper = "store";
      };
      gpg = {
        format = "ssh";
      };
      commit = {
        gpgsign = true;
      };
      push = {
        autoSetupRemote = true;
      };
      interactive = {
        diffFilter = "delta --color-only";
      };
      delta = {
        navigate = true;
        light = true;
      };
      merge = {
        conflictstyle = "diff3";
      };
      diff = {
        colorMoved = "default";
      };
      "filter \"lfs\"" = {
        clean = "git-lfs clean -- %f";
        smudge = "git-lfs smudge -- %f";
        process = "git-lfs filter-process";
        required = true;
      };
    };
  };
}