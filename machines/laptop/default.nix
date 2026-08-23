{ pkgs, ... }: {
  imports = [
    ./hardware-configuration.nix
  ];

  networking.hostName = "MP-Laptop";

  time.timeZone = "America/Chicago";

  services.fwupd.enable = true;
  services.fwupd.extraRemotes = [ "lvfs-testing" ];

  hardware.graphics = {
    extraPackages = with pkgs; [ intel-media-driver intel-ocl intel-vaapi-driver ];
    extraPackages32 = with pkgs.pkgsi686Linux; [ intel-media-driver intel-vaapi-driver ];
  };

  services.logind.settings.Login = {
    HandleLidSwitch = "suspend-then-hibernate";
    HandleLidSwitchExternalPower = "suspend-then-hibernate";
  };

  # Bootloader config
  boot.loader.limine.secureBoot.enable = true;
  environment.systemPackages = with pkgs; [
    sbctl
  ];
  boot.initrd.luks.devices."luks-0b1320b7-c7c9-48ff-a660-d24689b99d52".device = "/dev/disk/by-uuid/0b1320b7-c7c9-48ff-a660-d24689b99d52";

  system.stateVersion = "26.05";
}
