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
  boot.initrd.luks.devices."luks-ebcbe638-86cd-4b00-a52d-7db57af258dd".device = "/dev/disk/by-uuid/ebcbe638-86cd-4b00-a52d-7db57af258dd";

  system.stateVersion = "26.05";
}
