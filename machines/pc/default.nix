{ pkgs, ... }: {
  imports = [
    ./hardware-configuration.nix
  ];

  networking.hostName = "MP-PC";

  time.timeZone = "America/Chicago";

  # Bootloader config
  boot.loader.limine.secureBoot.enable = true;
  environment.systemPackages = with pkgs; [
    sbctl
  ];
  boot.initrd.luks.devices."luks-ebcbe638-86cd-4b00-a52d-7db57af258dd".device = "/dev/disk/by-uuid/ebcbe638-86cd-4b00-a52d-7db57af258dd";

  # Ensure SDDM has the same display configuration as Plasma
  system.activationScripts.sddmKwinOutputConfig = ''
    mkdir -p /var/lib/sddm/.config
    cp -f /home/filip/.config/kwinoutputconfig.json /var/lib/sddm/.config/kwinoutputconfig.json 2>/dev/null || true
    chown sddm:sddm /var/lib/sddm/.config/kwinoutputconfig.json 2>/dev/null || true
  '';

  system.stateVersion = "26.05";
}
