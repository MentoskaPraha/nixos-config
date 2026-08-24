{ pkgs, ... }: {
  programs.vscodium = {
    enable = true;
    mutableExtensionsDir = false;
    profiles.default = {
      userSettings = {
        "files.autoSave" = "afterDelay";
        "editor.tabSize" = 2;
        "editor.insertSpaces" = true;
        "nix.enableLanguageServer" = true;
        "nix.serverPath" = "nixd";
        "workbench.iconTheme" = "vscode-icons";
        "extensions.autoUpdate" = "off";
      };
      extensions = [
        # Essential extensions
        pkgs.open-vsx.aaron-bond.better-comments
        pkgs.open-vsx.adpyke.codesnap
        pkgs.open-vsx.mikestead.dotenv
        pkgs.open-vsx.tamasfe.even-better-toml
        pkgs.open-vsx.mhutchie.git-graph
        pkgs.open-vsx.oderwat.indent-rainbow
        pkgs.open-vsx.ibm.output-colorizer
        pkgs.open-vsx.qwtel.sqlite-viewer
        pkgs.open-vsx.vscode-icons-team.vscode-icons
        pkgs.open-vsx.jnoortheen.nix-ide

        # Flutter dev
        pkgs.open-vsx.dart-code.dart-code
        pkgs.open-vsx.dart-code.flutter

        # Webdev extensions
        pkgs.open-vsx.astro-build.astro-vscode
        pkgs.open-vsx.svelte.svelte-vscode
        pkgs.open-vsx.bradlc.vscode-tailwindcss
        pkgs.open-vsx.yoavbls.pretty-ts-errors
        pkgs.open-vsx.ecmel.vscode-html-css
        pkgs.open-vsx.formulahendry.auto-rename-tag
      ];
    };
  };
}
