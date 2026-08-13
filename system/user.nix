{ pkgs, ... }: {
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;

  users.groups.filip = {};
  users.users.filip = {
    isNormalUser = true;
    group = "filip";
    extraGroups = [ "networkmanager" "wheel" ];
  };
  users.users.root.hashedPassword = "!";

  security.sudo = {
    enable = true;
    execWheelOnly = true;
    wheelNeedsPassword = true;
  };
}
