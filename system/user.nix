{ pkgs, ... }: {
  imports = [
    ./modules/user_icon.nix
  ];

  # Ensure we using zsh
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;

  # Setup my user
  users.users.filip = {
    description = "Filip J. Stary";
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" "gamemode" ];
    shell = pkgs.zsh;
    icon = ../assets/user_icon.png;
  };

  # Disable root
  users.users.root.hashedPassword = "!";

  # SUDO
  security.sudo = {
    enable = true;
    execWheelOnly = true;
    wheelNeedsPassword = true;
  };

  # Locale Settings
  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "en_US.UTF-8";
      LC_IDENTIFICATION = "en_US.UTF-8";
      LC_MEASUREMENT = "en_GB.UTF-8";
      LC_MONETARY = "en_US.UTF-8";
      LC_NAME = "en_US.UTF-8";
      LC_NUMERIC = "en_US.UTF-8";
      LC_PAPER = "en_GB.UTF-8";
      LC_TELEPHONE = "en_US.UTF-8";
      LC_TIME = "en_GB.UTF-8";
      LC_COLLATE = "en_US.UTF-8";
    };
  };
}
