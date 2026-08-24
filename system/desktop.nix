{ pkgs, lib, ... }: {
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

  # Plasma DE
  services.desktopManager.plasma6 = {
    enable = true;
    enableQt5Integration = true;
  };

  # Exclude unneeded packages
  environment.plasma6.excludePackages = with pkgs; [
    kdePackages.kate
    kdePackages.discover
    kdePackages.khelpcenter
    kdePackages.elisa
    xterm
  ];

  # X11 Stuff
  services = {
    libinput.enable = true;
    xserver = {
      enable = true;
      desktopManager.xterm.enable = lib.mkForce false;
      xkb = {
        layout = "us";
        variant = "";
      };
    };
  };
}
