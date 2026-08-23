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
    fastfetch

    # Other stuff
    nixd # Language server for nix
  ];

  # Other essential programs
  programs = {
    steam.enable = true;

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
