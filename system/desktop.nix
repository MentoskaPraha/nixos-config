{ ... }: {
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
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    autoNumlock = true;
  };

  # Plasma
  services.desktopManager.plasma6.enable = true;

  # X11 Stuff
  services.xserver = {
    enable = true;
    libinput.enable = true;
    xkb = {
      layout = "us";
      variant = "";
    };
  };
}
