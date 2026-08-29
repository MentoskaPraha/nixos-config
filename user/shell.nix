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

    direnv = {
      enable = true;
      nix-direnv.enable = true;
      enableZshIntegration = true;
    };

    fastfetch = {
      enable = true;
      settings = {
        modules = [
          "title"
          "separator"
          "os"
          "host"
          "kernel"
          "uptime"
          "packages"
          "shell"
          "display"
          "de"
          "wm"
          "wmtheme"
          "theme"
          "icons"
          "font"
          "cursor"
          {
            type = "terminal";
            format = "{process-name} {version}";
          }
          "terminalfont"
          "cpu"
          "gpu"
          "memory"
          "swap"
          "disk"
          "battery"
          "poweradapter"
          "localip"
          "locale"
          "break"
          "colors"
        ];
      };
    };
  };
}
