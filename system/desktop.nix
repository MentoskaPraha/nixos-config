{ pkgs, lib, ... }:
let
  lockscreen_wallpaper = pkgs.runCommand "lockscreen_wallpaper" {} ''
    cp ${../assets/lockscreen_wallpaper.png} $out
  '';
  sddm_kdeglobals = pkgs.writeText "sddm_kdeglobals" ''
    [General]
    ColorScheme=BreezeDark
    Name=Breeze Dark

    [KDE]
    widgetStyle=Breeze
  '';
  sddm_plasmarc = pkgs.writeText "sddm_plasmarc" ''
    [Theme]
    name=breeze-dark
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
  system.activationScripts.sddmDarkTheme = ''
    mkdir -p /var/lib/sddm/.config
    cp ${sddm_kdeglobals} /var/lib/sddm/.config/kdeglobals
    cp ${sddm_plasmarc} /var/lib/sddm/.config/plasmarc
    chown -R sddm:sddm /var/lib/sddm/.config
  '';

  # Plasma DE
  services.desktopManager.plasma6 = {
    enable = true;
    enableQt5Integration = true;
  };
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [ 
      xdg-desktop-portal-gtk
      kdePackages.xdg-desktop-portal-kde
    ];
    xdgOpenUsePortal = true;
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
