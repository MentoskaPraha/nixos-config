{ ... }: {
  imports = [
    ./git.nix
    ./shell.nix
    ./librewolf.nix
    ./vscodium.nix
    #./desktop.nix
  ];

  home.username = "filip";
  home.homeDirectory = "/home/filip";

  home.sessionVariables.NIXOS_OZONE_WL = "1";

  home.stateVersion = "26.05";
}
