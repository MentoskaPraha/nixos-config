{ ... }: {
  imports = [
    ./base.nix
    ./network.nix
    ./user.nix
    ./programs.nix
    ./desktop.nix
  ];
}