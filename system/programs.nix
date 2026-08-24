{ inputs, pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    # Essential Terminal Utilities
    nano
    curl
    wget
    p7zip
    dust
    atuin
    fzf
    ffmpeg-full
    fastfetch

    # Libreoffice
    libreoffice-stable
    hunspellDicts.en_US-large
    hunspellDicts.en_GB-large
    hunspellDicts.fr-moderne
    hunspellDicts.cs_CZ
    hyphenDicts.en_US
    hyphenDicts.en_GB
    hyphenDicts.fr_FR
    hyphenDicts.cs_CZ

    # Other stuff
    nixd # Language server for nix
    heroic # Game launcher
    vlc
  ];

  # Other essential programs
  programs = {
    steam = {
      enable = true;
      extest.enable = true;
      localNetworkGameTransfers.openFirewall = true;
      protontricks.enable = true;
    };

    gamemode = {
      enable = true;
      settings.general.inhibit_screensaver = 0;
    };

    git = {
      enable = true;
      lfs.enable = true;
    };

    firefox = {
      enable = true;
      package = pkgs.librewolf;
    };

    vscode = {
      enable = true;
      package = pkgs.vscodium;
    };
  };

  # Enable vscode extensions
  nixpkgs.overlays = [
    inputs.nix-vscode-extensions.overlays.default
  ];
}
