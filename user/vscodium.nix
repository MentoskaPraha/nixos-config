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
        "extensions.autoCheckUpdates" = false;
        "update.mode" = "none";
        "explorer.confirmDragAndDrop" = false;
        "dotnetAcquisitionExtension.enableTelemetry" = false;
      };
      extensions = with pkgs; [
        # Essential extensions
        open-vsx.aaron-bond.better-comments
        open-vsx.adpyke.codesnap
        open-vsx.mikestead.dotenv
        open-vsx.tamasfe.even-better-toml
        open-vsx.mhutchie.git-graph
        open-vsx.oderwat.indent-rainbow
        open-vsx.ibm.output-colorizer
        open-vsx.qwtel.sqlite-viewer
        open-vsx.vscode-icons-team.vscode-icons
        open-vsx.jnoortheen.nix-ide

        # Flutter dev
        open-vsx.dart-code.dart-code
        open-vsx.dart-code.flutter

        # Web dev
        open-vsx.astro-build.astro-vscode
        open-vsx.svelte.svelte-vscode
        open-vsx.bradlc.vscode-tailwindcss
        open-vsx.yoavbls.pretty-ts-errors
        open-vsx.ecmel.vscode-html-css
        open-vsx.formulahendry.auto-rename-tag

        # Game dev
        vscode-marketplace.ms-dotnettools.vscode-dotnet-runtime
        vscode-marketplace.ms-dotnettools.csharp
        #vscode-marketplace.ms-dotnettools.csdevkit
        vscode-marketplace.geequlim.godot-tools
        vscode-marketplace.neikeq.godot-csharp-vscode
      ];
    };
  };
}
