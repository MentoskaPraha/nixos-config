{ pkgs, lib, ... }:
let
  lockscreen_wallpaper = pkgs.runCommand "lockscreen_wallpaper" {} ''
    cp ${../assets/lockscreen_wallpaper.png} $out
  '';
  breezePatched = pkgs.runCommand "sddm-breeze-patched" {} ''
    mkdir -p $out/share/sddm/themes
    cp -r ${pkgs.kdePackages.plasma-desktop}/share/sddm/themes/breeze $out/share/sddm/themes/breeze-patched
    chmod -R u+w $out/share/sddm/themes/breeze-patched
    cat > $out/share/sddm/themes/breeze-patched/theme.conf.user <<EOF
    [General]
    background = ${lockscreen_wallpaper}
    EOF
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
    theme = "breeze-patched";
    extraPackages = [ pkgs.kdePackages.qtvirtualkeyboard ];
  };
  environment.systemPackages = [ breezePatched ];

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
  programs.xwayland.enable = true;
  systemd.user.services.kde-baloo.environment.QT_QPA_PLATFORM = "offscreen";

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
