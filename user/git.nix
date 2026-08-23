{ ... }: {
  programs.git = {
    enable = true;

    settings = {
      user = {
        name = "MentoskaPraha";
        email = "contact+git@mentoskapraha.com";
      };
      init.defaultBranch = "main";
      pull.rebase = true;
      core.editor = "nano";
    };
  };
}
