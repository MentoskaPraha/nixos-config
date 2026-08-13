{ pkgs, ... }: {
  programs.git = {
    userName = "MentoskaPraha";
    userEmail = "contact+git@mentoskapraha.com";

    extraConfig = {
      init.defaultBranch = "main";
      pull.rebase = true;
      core.editor = "nano";
      credential.helper = "libsecret";
    };
  };
}
