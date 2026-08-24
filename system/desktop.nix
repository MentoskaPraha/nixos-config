{ pkgs, lib, ... }:
let
  lockscreen_wallpaper = pkgs.runCommand "lockscreen_wallpaper" {} ''
    cp ${../assets/lockscreen_wallpaper.png} $out
  '';
in {
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
    theme = "breeze";
  };
  environment.systemPackages = [
    (pkgs.writeTextDir "share/sddm/themes/breeze/theme.conf.user" ''
      [General]
      background = ${lockscreen_wallpaper}
    '')
  ];

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
