{ pkgs, ... }: {
  # Ensure we using zsh
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;

  # Setup my user
  users.users.filip = {
    description = "Filip J. Stary";
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" "gamemode" ];
    shell = pkgs.zsh;
  };

  # Disable root
  users.users.root.hashedPassword = "!";

  # SUDO
  security.sudo = {
    enable = true;
    execWheelOnly = true;
    wheelNeedsPassword = true;
  };

  # Locale Settings - INCOMPLETE! MUST CONFIGURE!
  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "en_US.UTF-8";
      LC_IDENTIFICATION = "C.UTF-8";
      LC_MEASUREMENT = "C.UTF-8";
      LC_MONETARY = "en_US.UTF-8";
      LC_NAME = "C.UTF-8";
      LC_NUMERIC = "en_US.UTF-8";
      LC_PAPER = "C.UTF-8";
      LC_TELEPHONE = "en_US.UTF-8";
      LC_TIME = "C.UTF-8";
      LC_COLLATE = "C.UTF-8";
    };
  };
}
