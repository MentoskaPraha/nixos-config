{ pkgs, ... }: {
  # We use the latest and greatest in this house
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Gaming Graphics config
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
  hardware.steam-hardware.enable = true;

  # Hibernation timer config
  systemd.sleep.settings.Sleep = {
    HibernateDelaySec="10m";
  };

  # Bootloader config
  boot.loader.limine.enable = true;
  boot.loader.timeout = 1;
  boot.loader.efi.canTouchEfiVariables = true;

  # Nix settings
  nix = {
    settings = {
      trusted-users = ["root" "@wheel"];
      experimental-features = [ "nix-command" "flakes" ];
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };
  };
  nixpkgs.config.allowUnfree = true;
}
