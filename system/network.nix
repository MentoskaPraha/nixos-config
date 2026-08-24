{ ... }: {
  # Networking Config
  networking = {
    networkmanager.enable = true;

    firewall = {
      enable = true;
      allowPing = true;
    };
  };

  # Printing baby!
  services.printing.enable = true;
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };

  # the blutooth device is disconnected
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = false;
    settings = {
      General = {
        Experimental = true;
        FastConnectable = false;
      };
      Policy = {
        AutoEnable = true;
      };
    };
  };
}
