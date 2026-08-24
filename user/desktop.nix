{ ... }: {
  programs.plasma = {
    enable = true;

    configFile = {
      # Locale Config
      plasma-localerc.Formats = {
        LANG = "en_US";
        LC_ADDRESS = "en_US";
        LC_MEASUREMENT = "C";
        LC_NAME = "en_US";
        LC_PAPER = "C";
        LC_TELEPHONE = "en_US";
        LC_TIME = "C";
      };
      plasma-localerc.Translations.LANGUAGE = "en_US";

      # Other
      kwinrc.Input.TabletMode = "off";
      kwinrc."org.kde.kdecoration2".AlwaysShowExcludeFromCapture = true;
      kwinrc.Effect-overview.BorderActivate = 9;
    };

    workspace = {
      enableMiddleClickPaste = true;
      clickItemTo = "select";
      tooltipDelay = 5;

      # Cursor Config
      cursor = {
        theme = "breeze_cursors";
        size = 24;
        taskManagerFeedback = true;
        cursorFeedback = "Bouncing";
        animationTime = 5;
      };

      # Theming Config
      theme = "breeze-dark";
      colorScheme = "BreezeDark";
      iconTheme = "BreezeDark";
      soundTheme = "ocean";
      widgetStyle = "breeze";
      windowDecorations = {
        library = "org.kde.breeze";
        theme = "Breeze";
      };

      # Wallpaper config
      wallpaper = ./assets/desktop_wallpaper.png;
      wallpaperFillMode = "preserveAspectFit";

      # Disable splash screen
      splashScreen = {
        engine = "none";
        theme = "None";
      };
    };

    # Keyboard setup
    input = {
      keyboard = {
        model = "pc104";
        numlockOnStartup = "on";
        repeatDelay = 600;
        repeatRate = 25.0;
        switchingPolicy = "global";
      };
    };

    krunner = {
      activateWhenTypingOnDesktop = true;
      historyBehavior = "enableSuggestions";
      position = "top";
    };

    kwin = {
      titlebarButtons = {
        left = [
          "application-menu"
          "hide-from-screencast"
        ];
        right = [
          "minimize"
          "maximize"
          "close"
        ];
      };
      nightLight.enable = false;
      edgeBarrier = 0;
      cornerBarrier = false;
      effects.cube.enable = true;
    };
    windows.allowWindowsToRememberPositions = true;

    session = {
      general.askForConfirmationOnLogout = true;
      sessionRestore.restoreOpenApplicationsOnLogin = "startWithEmptySession";
    };

    # Lock Screen setup
    kscreenlocker = {
      lockOnResume = true;
      passwordRequired = true;
      passwordRequiredDelay = 5;
      timeout = 3;
      appearance = {
        alwaysShowClock = true;
        showMediaControls = true;
        wallpaper = ./assets/lockscreen_wallpaper.png;
      };
    };

    # Power setup
    powerdevil = {
      AC = {
        powerButtonAction = "showLogoutScreen";
        inhibitLidActionWhenExternalMonitorConnected = true;
        powerProfile = "performance";
        whenLaptopLidClosed = "sleep";
        whenSleepingEnter = "standbyThenHibernate";
        dimDisplay = {
          enable = true;
          idleTimeout = 120;
        };
        turnOffDisplay = {
          idleTimeout = 240;
          idleTimeoutWhenLocked = 60;
        };
        autoSuspend = {
          action = "sleep";
          idleTimeout = 300;
        };
      };
      battery = {
        powerButtonAction = "showLogoutScreen";
        inhibitLidActionWhenExternalMonitorConnected = true;
        powerProfile = "powerSaving";
        whenLaptopLidClosed = "sleep";
        whenSleepingEnter = "standbyThenHibernate";
        dimDisplay = {
          enable = true;
          idleTimeout = 120;
        };
        turnOffDisplay = {
          idleTimeout = 240;
          idleTimeoutWhenLocked = 60;
        };
        autoSuspend = {
          action = "sleep";
          idleTimeout = 300;
        };
      };
      lowBattery = {
        powerButtonAction = "showLogoutScreen";
        inhibitLidActionWhenExternalMonitorConnected = false;
        powerProfile = "powerSaving";
        whenLaptopLidClosed = "sleep";
        whenSleepingEnter = "standbyThenHibernate";
        dimDisplay = {
          enable = true;
          idleTimeout = 120;
        };
        turnOffDisplay = {
          idleTimeout = 240;
          idleTimeoutWhenLocked = 60;
        };
        autoSuspend = {
          action = "sleep";
          idleTimeout = 300;
        };
      };
    };

    # Custom Window Rules
    window-rules = [
      {
        description = "Fullscreen Minecraft";
        match = {
          window-class = {
            value = "Minecraft";
            type = "substring";
          };
          window-types = [ "normal" ];
        };
        apply = {
          fullscreen = {
            value = true;
            apply = "initially";
          };
          position = {
            value = "0,0";
            apply = "initially";
          };
        };
      }
      {
        description = "Fullscreen Roblox";
        match = {
          window-class = {
            value = "Sober";
            type = "substring";
          };
          window-types = [ "normal" ];
        };
        apply = {
          fullscreen = {
            value = true;
            apply = "initially";
          };
          position = {
            value = "0,0";
            apply = "initially";
          };
        };
      }
    ];

    # Configure Bottom Pannel
    panels = [
      {
        location = "bottom";
        alignment = "center";
        floating = false;
        hiding = "normalpanel";
        opacity = "opaque";
        lengthMode = "fill";
        height = 46;
        widgets = [
          {
            kickoff = {
              icon = "plasma-symbolic";
              compactDisplayStyle = false;
              sortAlphabetically = false;
              sidebarPosition = "left";
              favoritesDisplayMode = "grid";
              applicationsDisplayMode = "list";
              showButtonsFor = "power";
              showActionButtonCaptions = true;
            };
          }
          {
            name = "org.kde.plasma.kickoff";
            config = {
              General = {
                icon = "plasma-symbolic";
                favoritesPortedToKAstats = true;
                highlightNewlyInstalledApps = false;
                switchCategoryOnHover = true;
                systemFavorites= "suspend\\,hibernate\\,reboot\\,shutdown";
              };
            };
          }
          {
            name = "org.kde.plasma.pager";
            config = {
              General = {
                displayedText = "Number";
              };
            };
          }
          {
            iconTasks = {
              launchers = [
                "applications:org.kde.dolphin.desktop"
                "applications:org.kde.konsole.desktop"
                "applications:librewolf.desktop"
                "applications:codium.desktop"
                "applications:systemsettings.desktop"
              ];
            };
          }
          "org.kde.plasma.marginsseparator"
          "org.kde.plasma.systemtray"
          {
            digitalClock = {
              calendar = {
                showWeekNumbers = true;
                firstDayOfWeek = "monday";
              };
              timeZone.format = "code";
              time = {
                format = "24h";
                showSeconds = "always";
              };
              date = {
                enable = true;
                position = "belowTime";
                format.custom = "ddd d MMM yyyy";
              };
            };
          }
        ];
      }
    ];

    # All of my shortcuts
    shortcuts = {
      ActivityManager.switch-to-activity-53ce5775-eed0-4c5c-8337-03f9d543f739 = [ ];
      "KDE Keyboard Layout Switcher"."Switch to Last-Used Keyboard Layout" = [ ];
      "KDE Keyboard Layout Switcher"."Switch to Next Keyboard Layout" = [ ];
      kaccess."Toggle Screen Reader On and Off" = [ ];
      kmix.decrease_microphone_volume = "Microphone Volume Down";
      kmix.decrease_volume = "Volume Down";
      kmix.decrease_volume_small = "Shift+Volume Down";
      kmix.increase_microphone_volume = "Microphone Volume Up";
      kmix.increase_volume = "Volume Up";
      kmix.increase_volume_small = "Shift+Volume Up";
      kmix.mic_mute = ["Microphone Mute" "Meta+Volume Mute"];
      kmix.mute = "Volume Mute";
      kmix.push_to_talk = [ ];
      ksmserver."Halt Without Confirmation" = [ ];
      ksmserver."Lock Session" = "Meta+L";
      ksmserver."Log Out" = "Ctrl+Alt+Del";
      ksmserver."Log Out Without Confirmation" = [ ];
      ksmserver.LogOut = [ ];
      ksmserver.Reboot = [ ];
      ksmserver."Reboot Without Confirmation" = [ ];
      ksmserver."Shut Down" = [ ];
      kwin."Activate Window Demanding Attention" = "Meta+Ctrl+A";
      kwin.Cube = "Meta+C";
      kwin."Cycle Overview" = [ ];
      kwin."Cycle Overview Opposite" = [ ];
      kwin."Decrease Opacity" = [ ];
      kwin."Edit Tiles" = "Meta+T";
      kwin.Expose = ["Ctrl+F9" "Meta+F9"];
      kwin.ExposeAll = ["Launch (C)" "Ctrl+F10" "Meta+F10"];
      kwin.ExposeClass = ["Ctrl+F7" "Meta+F7"];
      kwin.ExposeClassCurrentDesktop = [ ];
      kwin."Grid View" = "Meta+G";
      kwin."Increase Opacity" = [ ];
      kwin."Kill Window" = "Meta+Ctrl+Esc";
      kwin."Move Tablet to Next LogicalOutput" = [ ];
      kwin.MoveMouseToCenter = [ ];
      kwin.MoveMouseToFocus = [ ];
      kwin.MoveZoomDown = [ ];
      kwin.MoveZoomLeft = [ ];
      kwin.MoveZoomRight = [ ];
      kwin.MoveZoomUp = [ ];
      kwin.Overview = "Meta+W";
      kwin."Setup Window Shortcut" = [ ];
      kwin."Show Desktop" = "Meta+D";
      kwin."Switch One Desktop Down" = "Meta+Ctrl+Down";
      kwin."Switch One Desktop Up" = "Meta+Ctrl+Up";
      kwin."Switch One Desktop to the Left" = "Meta+Ctrl+Left";
      kwin."Switch One Desktop to the Right" = "Meta+Ctrl+Right";
      kwin."Switch Window Down" = "Meta+Alt+Down";
      kwin."Switch Window Left" = "Meta+Alt+Left";
      kwin."Switch Window Right" = "Meta+Alt+Right";
      kwin."Switch Window Up" = "Meta+Alt+Up";
      kwin."Switch to Desktop 1" = [ ];
      kwin."Switch to Desktop 10" = [ ];
      kwin."Switch to Desktop 11" = [ ];
      kwin."Switch to Desktop 12" = [ ];
      kwin."Switch to Desktop 13" = [ ];
      kwin."Switch to Desktop 14" = [ ];
      kwin."Switch to Desktop 15" = [ ];
      kwin."Switch to Desktop 16" = [ ];
      kwin."Switch to Desktop 17" = [ ];
      kwin."Switch to Desktop 18" = [ ];
      kwin."Switch to Desktop 19" = [ ];
      kwin."Switch to Desktop 2" = [ ];
      kwin."Switch to Desktop 20" = [ ];
      kwin."Switch to Desktop 21" = [ ];
      kwin."Switch to Desktop 22" = [ ];
      kwin."Switch to Desktop 23" = [ ];
      kwin."Switch to Desktop 24" = [ ];
      kwin."Switch to Desktop 25" = [ ];
      kwin."Switch to Desktop 3" = [ ];
      kwin."Switch to Desktop 4" = [ ];
      kwin."Switch to Desktop 5" = [ ];
      kwin."Switch to Desktop 6" = [ ];
      kwin."Switch to Desktop 7" = [ ];
      kwin."Switch to Desktop 8" = [ ];
      kwin."Switch to Desktop 9" = [ ];
      kwin."Switch to Next Desktop" = [ ];
      kwin."Switch to Next Screen" = [ ];
      kwin."Switch to Previous Desktop" = [ ];
      kwin."Switch to Previous Screen" = [ ];
      kwin."Switch to Screen 0" = [ ];
      kwin."Switch to Screen 1" = [ ];
      kwin."Switch to Screen 2" = [ ];
      kwin."Switch to Screen 3" = [ ];
      kwin."Switch to Screen 4" = [ ];
      kwin."Switch to Screen 5" = [ ];
      kwin."Switch to Screen 6" = [ ];
      kwin."Switch to Screen 7" = [ ];
      kwin."Switch to Screen Above" = [ ];
      kwin."Switch to Screen Below" = [ ];
      kwin."Switch to Screen to the Left" = [ ];
      kwin."Switch to Screen to the Right" = [ ];
      kwin."Toggle Night Color" = [ ];
      kwin."Toggle Window Raise/Lower" = [ ];
      kwin."Walk Through Windows" = ["Alt+Tab" "Meta+Tab"];
      kwin."Walk Through Windows (Reverse)" = ["Alt+Shift+Tab" "Meta+Shift+Tab"];
      kwin."Walk Through Windows Alternative" = [ ];
      kwin."Walk Through Windows Alternative (Reverse)" = [ ];
      kwin."Walk Through Windows of Current Application" = ["Alt+`" "Meta+`"];
      kwin."Walk Through Windows of Current Application (Reverse)" = ["Alt+~" "Meta+~"];
      kwin."Walk Through Windows of Current Application Alternative" = [ ];
      kwin."Walk Through Windows of Current Application Alternative (Reverse)" = [ ];
      kwin."Window Above Other Windows" = [ ];
      kwin."Window Below Other Windows" = [ ];
      kwin."Window Close" = "Alt+F4";
      kwin."Window Custom Quick Tile Bottom" = [ ];
      kwin."Window Custom Quick Tile Left" = [ ];
      kwin."Window Custom Quick Tile Right" = [ ];
      kwin."Window Custom Quick Tile Top" = [ ];
      kwin."Window Fullscreen" = [ ];
      kwin."Window Grow Horizontal" = [ ];
      kwin."Window Grow Vertical" = [ ];
      kwin."Window Lower" = [ ];
      kwin."Window Maximize" = "Meta+F";
      kwin."Window Maximize Horizontal" = [ ];
      kwin."Window Maximize Vertical" = [ ];
      kwin."Window Minimize" = [ ];
      kwin."Window Move" = [ ];
      kwin."Window Move Center" = [ ];
      kwin."Window No Border" = [ ];
      kwin."Window On All Desktops" = [ ];
      kwin."Window One Desktop Down" = "Meta+Ctrl+Shift+Down";
      kwin."Window One Desktop Up" = "Meta+Ctrl+Shift+Up";
      kwin."Window One Desktop to the Left" = "Meta+Ctrl+Shift+Left";
      kwin."Window One Desktop to the Right" = "Meta+Ctrl+Shift+Right";
      kwin."Window One Screen Down" = [ ];
      kwin."Window One Screen Up" = [ ];
      kwin."Window One Screen to the Left" = [ ];
      kwin."Window One Screen to the Right" = [ ];
      kwin."Window Operations Menu" = "Alt+F3";
      kwin."Window Pack Down" = [ ];
      kwin."Window Pack Left" = [ ];
      kwin."Window Pack Right" = [ ];
      kwin."Window Pack Up" = [ ];
      kwin."Window Quick Tile Bottom" = "Meta+Down";
      kwin."Window Quick Tile Bottom Left" = [ ];
      kwin."Window Quick Tile Bottom Right" = [ ];
      kwin."Window Quick Tile Left" = "Meta+Left";
      kwin."Window Quick Tile Right" = "Meta+Right";
      kwin."Window Quick Tile Top" = "Meta+Up";
      kwin."Window Quick Tile Top Left" = [ ];
      kwin."Window Quick Tile Top Right" = [ ];
      kwin."Window Raise" = [ ];
      kwin."Window Resize" = [ ];
      kwin."Window Restore" = "Meta+Backspace";
      kwin."Window Shrink Horizontal" = [ ];
      kwin."Window Shrink Vertical" = [ ];
      kwin."Window to Desktop 1" = [ ];
      kwin."Window to Desktop 10" = [ ];
      kwin."Window to Desktop 11" = [ ];
      kwin."Window to Desktop 12" = [ ];
      kwin."Window to Desktop 13" = [ ];
      kwin."Window to Desktop 14" = [ ];
      kwin."Window to Desktop 15" = [ ];
      kwin."Window to Desktop 16" = [ ];
      kwin."Window to Desktop 17" = [ ];
      kwin."Window to Desktop 18" = [ ];
      kwin."Window to Desktop 19" = [ ];
      kwin."Window to Desktop 2" = [ ];
      kwin."Window to Desktop 20" = [ ];
      kwin."Window to Desktop 21" = [ ];
      kwin."Window to Desktop 22" = [ ];
      kwin."Window to Desktop 23" = [ ];
      kwin."Window to Desktop 24" = [ ];
      kwin."Window to Desktop 25" = [ ];
      kwin."Window to Desktop 3" = [ ];
      kwin."Window to Desktop 4" = [ ];
      kwin."Window to Desktop 5" = [ ];
      kwin."Window to Desktop 6" = [ ];
      kwin."Window to Desktop 7" = [ ];
      kwin."Window to Desktop 8" = [ ];
      kwin."Window to Desktop 9" = [ ];
      kwin."Window to Next Desktop" = [ ];
      kwin."Window to Next Screen" = "Meta+Shift+Right";
      kwin."Window to Previous Desktop" = [ ];
      kwin."Window to Previous Screen" = "Meta+Shift+Left";
      kwin."Window to Screen 0" = [ ];
      kwin."Window to Screen 1" = [ ];
      kwin."Window to Screen 2" = [ ];
      kwin."Window to Screen 3" = [ ];
      kwin."Window to Screen 4" = [ ];
      kwin."Window to Screen 5" = [ ];
      kwin."Window to Screen 6" = [ ];
      kwin."Window to Screen 7" = [ ];
      kwin.disableInputCapture = "Meta+Shift+Esc";
      kwin.view_actual_size = "Meta+0";
      kwin.view_zoom_in = ["Meta++" "Meta+="];
      kwin.view_zoom_out = "Meta+-";
      mediacontrol.mediavolumedown = [ ];
      mediacontrol.mediavolumeup = [ ];
      mediacontrol.nextmedia = "Media Next";
      mediacontrol.pausemedia = "Media Pause";
      mediacontrol.playmedia = [ ];
      mediacontrol.playpausemedia = "Media Play";
      mediacontrol.previousmedia = "Media Previous";
      mediacontrol.seekbackwardmedia = "Media Rewind";
      mediacontrol.seekbackwardmedialong = [ ];
      mediacontrol.seekforwardmedia = "Media Fast Forward";
      mediacontrol.seekforwardmedialong = [ ];
      mediacontrol.stopmedia = "Media Stop";
      org_kde_powerdevil."Decrease Keyboard Brightness" = "Keyboard Brightness Down";
      org_kde_powerdevil."Decrease Screen Brightness" = "Monitor Brightness Down";
      org_kde_powerdevil."Decrease Screen Brightness Small" = "Shift+Monitor Brightness Down";
      org_kde_powerdevil.Hibernate = "Hibernate";
      org_kde_powerdevil."Increase Keyboard Brightness" = "Keyboard Brightness Up";
      org_kde_powerdevil."Increase Screen Brightness" = "Monitor Brightness Up";
      org_kde_powerdevil."Increase Screen Brightness Small" = "Shift+Monitor Brightness Up";
      org_kde_powerdevil.PowerDown = "Power Down";
      org_kde_powerdevil.PowerOff = "Power Off";
      org_kde_powerdevil.Sleep = "Sleep";
      org_kde_powerdevil."Toggle Keyboard Backlight" = "Keyboard Light On/Off";
      org_kde_powerdevil."Turn Off Screen" = [ ];
      org_kde_powerdevil.powerProfile = ["Battery" "Meta+B"];
      plasmashell."Slideshow Wallpaper Next Image" = [ ];
      plasmashell."activate application launcher" = "Meta";
      plasmashell."activate task manager entry 1" = "Meta+1";
      plasmashell."activate task manager entry 10" = [ ];
      plasmashell."activate task manager entry 2" = "Meta+2";
      plasmashell."activate task manager entry 3" = "Meta+3";
      plasmashell."activate task manager entry 4" = "Meta+4";
      plasmashell."activate task manager entry 5" = "Meta+5";
      plasmashell."activate task manager entry 6" = "Meta+6";
      plasmashell."activate task manager entry 7" = "Meta+7";
      plasmashell."activate task manager entry 8" = "Meta+8";
      plasmashell."activate task manager entry 9" = "Meta+9";
      plasmashell."clear history" = [ ];
      plasmashell.clear-history = [ ];
      plasmashell.clipboard_action = "Meta+Ctrl+X";
      plasmashell.cycle-panels = "Meta+Alt+P";
      plasmashell.cycleNextAction = [ ];
      plasmashell.cyclePrevAction = [ ];
      plasmashell.edit_clipboard = [ ];
      plasmashell."manage activities" = "Meta+Q";
      plasmashell."next activity" = "Meta+A";
      plasmashell."previous activity" = "Meta+Shift+A";
      plasmashell.repeat_action = [ ];
      plasmashell."show dashboard" = "Ctrl+F12";
      plasmashell.show-barcode = [ ];
      plasmashell.show-on-mouse-pos = "Meta+V";
      plasmashell."switch to next activity" = [ ];
      plasmashell."switch to previous activity" = [ ];
      plasmashell."toggle do not disturb" = [ ];
      "services/org.kde.kscreen.desktop".ShowOSD = "Display";
      "services/org.kde.plasma-systemmonitor.desktop"._launch = [ ];
      "services/org.kde.spectacle.desktop".ActiveWindowScreenShot = [ ];
      "services/org.kde.spectacle.desktop".CurrentMonitorScreenShot = [ ];
      "services/org.kde.spectacle.desktop".FullScreenScreenShot = [ ];
      "services/org.kde.spectacle.desktop".OpenWithoutScreenshot = [ ];
      "services/org.kde.spectacle.desktop".RecordRegion = [ ];
      "services/org.kde.spectacle.desktop".RecordScreen = [ ];
      "services/org.kde.spectacle.desktop".RecordWindow = [ ];
      "services/org.kde.spectacle.desktop".RectangularRegionScreenShot = [ ];
      "services/org.kde.spectacle.desktop".WindowUnderCursorScreenShot = "Ctrl+Num+Enter";
      "services/org.kde.spectacle.desktop"._launch = "Ctrl+~";
      "services/org.kde.touchpadshortcuts.desktop".ToggleTouchpad = "Touchpad Toggle";
      "services/systemsettings.desktop"._launch = [ ];
    };
  };
}
