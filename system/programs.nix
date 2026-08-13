{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    nano
    curl
    wget
    p7zip
    dust
    fzf
    kitty
  ];

  programs = {
    steam.enable = true;

    git = {
      enable = true;
      lfs.enable = true;
    };

    librewolf = {
      enable = true;
      settings = {
        "webgl.disabled" = false;
        "privacy.clearOnShutdown.history" = false;
        "extensions.activeThemeID" = "firefox-compact-dark@mozilla.org";
        "ui.systemUsesDarkTheme" = 1;
        "layout.css.prefers-color-scheme.content-override" = 0;
      };
      policies = {
        DisableTelemetry = true;
        DisableFirefoxStudies = true;
        ExtensionSettings = {
          "*" = {
            installation_mode = "blocked";
          };
          "uBlock0@raymondhill.net" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
            installation_mode = "force_installed";
            default_area = "navbar";
          };
          "{446900e4-71c2-419f-a6a7-df9c091e268b}" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/bitwarden-password-manager/latest.xpi";
            installation_mode = "force_installed";
            default_area = "navbar";
          };
          "addon@darkreader.org" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/darkreader/latest.xpi";
            installation_mode = "force_installed";
            default_area = "navbar";
          };
          "{61a05c39-ad45-4086-946f-32adb0a40a9d}" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/linkding-extension/latest.xpi";
            installation_mode = "force_installed";
            default_area = "navbar";
          };
          "@crw-extension-firefox" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/consumer-rights-wiki/latest.xpi";
            installation_mode = "force_installed";
            default_area = "menupanel";
          };
          "jid1-BoFifL9Vbdl2zQ@jetpack" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/decentraleyes/latest.xpi";
            installation_mode = "force_installed";
            default_area = "menupanel";
          };
          "{cb31ec5d-c49a-4e5a-b240-16c767444f62}" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/indie-wiki-buddy/latest.xpi";
            installation_mode = "force_installed";
            default_area = "menupanel";
          };
          "{762f9885-5a13-4abd-9c77-433dcd38b8fd}" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/return-youtube-dislikes/latest.xpi";
            installation_mode = "force_installed";
            default_area = "menupanel";
          };
          "sponsorBlocker@ajay.app" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/sponsorblock/latest.xpi";
            installation_mode = "force_installed";
            default_area = "menupanel";
          };
          "myallychou@gmail.com" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/youtube-recommended-videos/latest.xpi";
            installation_mode = "force_installed";
            default_area = "menupanel";
          };
        };
      };
    };
  };
}
