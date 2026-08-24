{ pkgs, ... }: {
  imports = [
    ./hardware-configuration.nix
  ];

  networking.hostName = "MP-PC";

  time.timeZone = "America/Chicago";

  # Bootloader config
  #boot.loader.limine.secureBoot.enable = true;
  environment.systemPackages = with pkgs; [
    sbctl
  ];

  system.stateVersion = "26.05";
}
