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
    imagemagickBig
    btop
    fastfetch

    # Libreoffice
    libreoffice-stable
    hunspellDicts.en_US-large
    hunspellDicts.en_GB-large
    hunspellDicts.fr-any
    hunspellDicts.cs_CZ
    hyphenDicts.en_US
    hyphenDicts.en_GB
    hyphenDicts.fr_FR
    hyphenDicts.cs_CZ

    # VPN Stuff
    proton-vpn
    wireguard-tools

    # Gaming Stuff
    cartridges # Game launcher
    heroic # Game launcher for Epic Games/GOG
    #atlauncher-bin # Minecraft (waiting on upstream for atlauncher-bin packages as source build gets rejected by atlauncher API)

    # Other stuff
    nixd # Language server for nix
    piper # Gaming mouse config UI
    newsflash # RSS Reader
    obsidian # Markdown Based Notes
    vlc # Video Player
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

    localsend = {
      enable = true;
      openFirewall = true;
    };

    # Remember your hotkeys:
    # Alt+z = show overlay; Alt+1 = Save Replay;
    # Alt+2 = Start/Stop Replay; Alt+3 = Start/Stop Recording;
    # Alt+4 = Pause/Resume Recording
    gpu-screen-recorder = {
      enable = true;
      ui.enable = true;
    };
  };

  # Enable config deamon for gaming mouse
  services.ratbagd.enable = true;

  # Enable flatpak
  services.flatpak = {
    enable = true;
    uninstallUnmanaged = true;
    remotes = [
      { name = "flathub"; location = "https://dl.flathub.org/repo/flathub.flatpakrepo"; }
    ];
    packages = [
      { appId = "com.discordapp.Discord"; origin = "flathub"; }
      { appId = "org.vinegarhq.Sober"; origin = "flathub"; }
      { appId = "io.edcd.EDMarketConnector"; origin = "flathub"; }
    ];
    overrides = {
      # Give EDMC access to read journal files
      "io.edcd.EDMarketConnector" = {
        Context.filesystems = [ "/home/filip/Games/Heroic/Prefixes/default/Elite Dangerous/drive_c/users/steamuser/Saved Games/Frontier Developments/Elite Dangerous" ];
      };
    };
  };

  nixpkgs.overlays = [
    # Enable vscode extensions
    inputs.nix-vscode-extensions.overlays.default

    # Fix cartridges crashing
    (final: prev: {
      cartridges = prev.cartridges.overrideAttrs (old: {
        postPatch = (old.postPatch or "") + ''
            substituteInPlace cartridges/window.py \
              --replace-fail "label=games_no," "label=str(games_no),"
          '';
      });
    })
  ];
}
