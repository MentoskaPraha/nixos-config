{ pkgs, ... }: {
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

    # Essential Apps
    vscodium # TODO: Replace with more permanent configuration!
  ];

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
  };
}
