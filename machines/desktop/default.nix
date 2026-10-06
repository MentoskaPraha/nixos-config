{ pkgs, ... }: {
  imports = [
    ./hardware-configuration.nix
  ];

  networking.hostName = "MP-Desktop";

  time.timeZone = "Europe/London";

  # Bootloader config
  boot.loader.limine.secureBoot.enable = true;
  environment.systemPackages = with pkgs; [
    sbctl
  ];
  boot.initrd.luks.devices."luks-3bb8ecd6-e3d4-46d2-b2e8-cf132005ad10".device = "/dev/disk/by-uuid/3bb8ecd6-e3d4-46d2-b2e8-cf132005ad10";
  boot.resumeDevice = "/dev/mapper/luks-3bb8ecd6-e3d4-46d2-b2e8-cf132005ad10";

  # Ensure SDDM has the same display configuration as Plasma
  system.activationScripts.sddmKwinOutputConfig = ''
    mkdir -p /var/lib/sddm/.config
    cp -f /home/filip/.config/kwinoutputconfig.json /var/lib/sddm/.config/kwinoutputconfig.json 2>/dev/null || true
    chown sddm:sddm /var/lib/sddm/.config/kwinoutputconfig.json 2>/dev/null || true
  '';

  # Enable firmware updates
  services.fwupd.enable = true;

  system.stateVersion = "26.05";
}
