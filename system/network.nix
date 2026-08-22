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
}
