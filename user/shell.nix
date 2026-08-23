{ ... }: {
  programs = {
    zsh = {
      enable = true;

      initContent = ''
        fastfetch
      '';

      oh-my-zsh = {
        enable = true;
        theme = "clean";
        plugins = [ "git" "sudo" ];
        extraConfig = ''
          ENABLE_CORRECTION="true"
          HIST_STAMPS="dd/mm/yyyy"
        '';
      };
    };

    fzf = {
      enable = true;
      enableZshIntegration = true;
    };

    atuin = {
      enable = true;
      enableZshIntegration = true;
      flags = [ "--disable-ctrl-r" ];
    };
  };
}
