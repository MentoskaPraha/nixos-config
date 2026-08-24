{ pkgs, ... }: {
  # Audio
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  # Login
  services.displayManager.cosmic-greeter.enable = true;

  # Cosmic DE
  services.desktopManager.cosmic.enable = true;

  # Exclude unneeded packages
  environment.cosmic.excludePackages = with pkgs; [
    cosmic-edit
  ];

  # X11 Stuff
  services = {
    libinput.enable = true;
    xserver = {
      enable = true;
      xkb = {
        layout = "us";
        variant = "";
      };
    };
  };
}
