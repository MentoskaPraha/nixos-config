{ pkgs, ... }: {
  # We use the latest and greatest in this house
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Gaming Graphics config
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  # Hibernation timer config
  systemd.sleep.settings.Sleep = {
    HibernateDelaySec="15m";
  };

  # Nix settings
  nix.settings = {
    trusted-users = ["root" "@wheel"];
    experimental-features = [ "nix-command" "flakes" ];
  };
  nixpkgs.config.allowUnfree = true;
}
