{ ... }: {
  # Printing baby!
  services.printing.enable = true;

  # Networking Config
  networking = {
    networkmanager.enable = true;

    firewall = {
      enable = true;
      allowPing = true;
    };
  };

  hardware.bluetooth = {
    enable = true;
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
