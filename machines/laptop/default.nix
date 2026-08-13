{ config, pkgs, ... }: {
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

  system.stateVersion = "26.05";
}
