{ pkgs, ... }: {
  # Bootloader config - Move to device specific config?
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # We use the latest and greatest in this house
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Gaming Graphics config
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  # Hibernation timer config - Move to device specific config?
  systemd.sleep.extraConfig = ''
    HibernateDelaySec=15m
  '';

  # Nix settings
  nix.settings = {
    trusted-users = ["root" "@wheel"];
    experimental-features = [ "nix-command" "flakes" ];
  };
  nixpkgs.config.allowUnfree = true;
}
