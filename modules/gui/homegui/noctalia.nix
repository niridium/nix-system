{
  flake.modules.homeManager.gui = {
    # imports = [
    #   inputs.noctalia.homeModules.default
    # ];
    programs.noctalia = {
      enable = true;
      settings = {
        audio = {
          enable_sounds = true;
        };
        bar = {
          order = ["widgets"];
          widgets = {
            border_width = 3.0;
            center = ["workspaces"];
            contact_shadow = true;
            end = ["tray" "notifications" "clipboard" "volume" "brightness" "bluetooth" "network" "battery"];
            position = "left";
            radius = 10;
            scale = 1.1;
            start = ["weather"];
            thickness = 40;
            widget_spacing = 15;
          };
        };
        brightness.enable_ddcutil = true;
        control_center = {
          sidebar = "full";
          sidebar_section = "none";
        };
        desktop_widgets = {
          enabled = false;
        };
        idle = {
          behavior_order = ["lock" "screen-off" "lock-and-suspend"];
          behavior = {
            lock = {
              action = "lock";
              enabled = true;
              timeout = 600;
            };
            screen-off = {
              action = "screen_off";
              enabled = true;
              timeout = 660;
            };
            lock-and-suspend = {
              action = "lock_and_suspend";
              enabled = true;
              timeout = 900;
            };
          };
        };
        location.auto_locate = true;
        lockscreen.wallpaper_blur_intensity = 0.5;
        nightlight = {
          enabled = true;
          temperature_night = 5500;
        };
        notification = {
          offset_y = 20;
          position = "bottom_center";
        };
        osd = {
          offset_y = 20;
          position = "bottom_center";
        };
        shell = {
          font_family = "Iosevka NF";
          password_style = "random";
          polkit_agent = true;
          telemetry_enabled = true;
          panel = {
            clipboard_placement = "attached";
            launcher_categories = false;
            launcher_compact = true;
            launcher_placement = "attached";
            launcher_show_icons = false;
            open_near_click_clipboard = true;
            open_near_click_control_center = true;
            open_near_click_session = true;
            open_near_click_wallpaper = true;
          };
          screen_corners = {
            enabled = true;
            size = 10;
          };
        };
        theme = {
          mode = "auto";
          source = "wallpaper";
          wallpaper_scheme = "faithful";
          templates = {
            builtin_ids = ["btop" "cava" "gtk3" "gtk4" "ghostty" "helix" "niri" "qt"];
            community_ids = ["zed" "yazi"];
          };
        };
        widget = {
          battery = {
            display_mode = "graphic";
            hide_when_full = true;
            show_label = false;
          };
          brightness.show_label = false;
          network.show_label = false;
          notifications.hide_when_no_unread = true;
          volume.show_label = false;
          workspaces.display = "none";
        };
        #   settingsVersion = 0;
        #   bar = {
        #     barType = "framed";
        #     position = "left";
        #     monitors = [];
        #     density = "spacious";
        #     showOutline = false;
        #     showCapsule = true;
        #     capsuleOpacity = 1;
        #     capsuleColorKey = "none";
        #     widgetSpacing = 6;
        #     contentPadding = 2;
        #     fontScale = 1;
        #     enableExclusionZoneInset = true;
        #     backgroundOpacity = 0.93;
        #     useSeparateOpacity = false;
        #     floating = false;
        #     marginVertical = 4;
        #     marginHorizontal = 4;
        #     frameThickness = 4;
        #     frameRadius = 12;
        #     outerCorners = true;
        #     hideOnOverview = false;
        #     displayMode = "always_visible";
        #     autoHideDelay = 500;
        #     autoShowDelay = 150;
        #     showOnWorkspaceSwitch = true;
        #     widgets = {
        #       left = [
        #         {
        #           id = "Clock";
        #           clockColor = "none";
        #           formatVertical = "HH mm - dd MM yy";
        #           tooltipFormat = "HH:mm ddd dd MMM";
        #         }
        #         {
        #           id = "plugin:privacy-indicator";
        #         }
        #       ];
        #       center = [
        #         {
        #           id = "Workspace";
        #           labelMode = "none";
        #         }
        #       ];
        #       right = [
        #         {
        #           id = "Tray";
        #           drawerEnabled = false;
        #         }
        #         {
        #           id = "NotificationHistory";
        #         }
        #         {
        #           id = "Battery";
        #           displayMode = "graphic";
        #           showPowerProfiles = true;
        #         }
        #         {
        #           id = "Brightness";
        #         }
        #         {
        #           id = "Volume";
        #         }
        #         {
        #           id = "Bluetooth";
        #         }
        #         {
        #           id = "Network";
        #         }
        #         {
        #           id = "ControlCenter";
        #           useDistroLogo = true;
        #           enableColorization = true;
        #         }
        #       ];
        #     };
        #     mouseWheelAction = "none";
        #     reverseScroll = false;
        #     mouseWheelWrap = true;
        #     middleClickAction = "none";
        #     middleClickFollowMouse = false;
        #     middleClickCommand = "";
        #     rightClickAction = "settings";
        #     rightClickFollowMouse = true;
        #     rightClickCommand = "";
        #     screenOverrides = [];
        #   };
        #   general = {
        #     avatarImage = "/home/nixy/Pictures/Wallpapers/wallhaven_we2kkx.jpg";
        #     dimmerOpacity = 0.2;
        #     showScreenCorners = false;
        #     forceBlackScreenCorners = false;
        #     scaleRatio = 1;
        #     radiusRatio = 0.6;
        #     iRadiusRatio = 0.5;
        #     boxRadiusRatio = 1;
        #     screenRadiusRatio = 1;
        #     animationSpeed = 1;
        #     animationDisabled = false;
        #     compactLockScreen = false;
        #     lockScreenAnimations = false;
        #     lockOnSuspend = true;
        #     showSessionButtonsOnLockScreen = true;
        #     showHibernateOnLockScreen = false;
        #     enableLockScreenMediaControls = false;
        #     enableShadows = false;
        #     enableBlurBehind = true;
        #     shadowDirection = "bottom_right";
        #     shadowOffsetX = 2;
        #     shadowOffsetY = 3;
        #     language = "";
        #     allowPanelsOnScreenWithoutBar = true;
        #     showChangelogOnStartup = true;
        #     telemetryEnabled = true;
        #     enableLockScreenCountdown = true;
        #     lockScreenCountdownDuration = 10000;
        #     autoStartAuth = false;
        #     allowPasswordWithFprintd = false;
        #     clockStyle = "custom";
        #     clockFormat = "hh\nmm";
        #     passwordChars = false;
        #     lockScreenMonitors = [];
        #     lockScreenBlur = 0;
        #     lockScreenTint = 0;
        #     keybinds = {
        #       keyUp = [
        #         "Up"
        #       ];
        #       keyDown = [
        #         "Down"
        #       ];
        #       keyLeft = [
        #         "Left"
        #       ];
        #       keyRight = [
        #         "Right"
        #       ];
        #       keyEnter = [
        #         "Return"
        #         "Enter"
        #       ];
        #       keyEscape = [
        #         "Esc"
        #       ];
        #       keyRemove = [
        #         "Del"
        #       ];
        #     };
        #     reverseScroll = false;
        #   };
        #   ui = {
        #     fontDefault = "Sans Serif";
        #     fontFixed = "monospace";
        #     fontDefaultScale = 1;
        #     fontFixedScale = 1;
        #     tooltipsEnabled = true;
        #     scrollbarAlwaysVisible = true;
        #     boxBorderEnabled = false;
        #     panelBackgroundOpacity = 1;
        #     translucentWidgets = false;
        #     panelsAttachedToBar = true;
        #     settingsPanelMode = "attached";
        #     settingsPanelSideBarCardStyle = false;
        #   };
        #   location = {
        #     name = "Marbella";
        #     weatherEnabled = true;
        #     weatherShowEffects = true;
        #     useFahrenheit = false;
        #     use12hourFormat = false;
        #     showWeekNumberInCalendar = false;
        #     showCalendarEvents = true;
        #     showCalendarWeather = true;
        #     analogClockInCalendar = false;
        #     firstDayOfWeek = -1;
        #     hideWeatherTimezone = false;
        #     hideWeatherCityName = false;
        #   };
        #   calendar = {
        #     cards = [
        #       {
        #         enabled = true;
        #         id = "calendar-header-card";
        #       }
        #       {
        #         enabled = true;
        #         id = "calendar-month-card";
        #       }
        #       {
        #         enabled = true;
        #         id = "weather-card";
        #       }
        #     ];
        #   };
        #   wallpaper = {
        #     enabled = true;
        #     overviewEnabled = false;
        #     directory = "/home/nixy/Pictures/Wallpapers";
        #     monitorDirectories = [];
        #     enableMultiMonitorDirectories = false;
        #     showHiddenFiles = false;
        #     viewMode = "single";
        #     setWallpaperOnAllMonitors = true;
        #     fillMode = "crop";
        #     fillColor = "#000000";
        #     useSolidColor = false;
        #     solidColor = "#1a1a2e";
        #     automationEnabled = false;
        #     wallpaperChangeMode = "random";
        #     randomIntervalSec = 300;
        #     transitionDuration = 1500;
        #     transitionType = "random";
        #     skipStartupTransition = false;
        #     transitionEdgeSmoothness = 0.05;
        #     panelPosition = "follow_bar";
        #     hideWallpaperFilenames = false;
        #     overviewBlur = 0.4;
        #     overviewTint = 0.6;
        #     useWallhaven = false;
        #     wallhavenQuery = "";
        #     wallhavenSorting = "relevance";
        #     wallhavenOrder = "desc";
        #     wallhavenCategories = "111";
        #     wallhavenPurity = "100";
        #     wallhavenRatios = "";
        #     wallhavenApiKey = "";
        #     wallhavenResolutionMode = "atleast";
        #     wallhavenResolutionWidth = "";
        #     wallhavenResolutionHeight = "";
        #     sortOrder = "name";
        #     favorites = [];
        #   };
        #   appLauncher = {
        #     enableClipboardHistory = false;
        #     autoPasteClipboard = false;
        #     enableClipPreview = true;
        #     clipboardWrapText = true;
        #     clipboardWatchTextCommand = "wl-paste --type text --watch cliphist store";
        #     clipboardWatchImageCommand = "wl-paste --type image --watch cliphist store";
        #     position = "center";
        #     pinnedApps = ["com.mitchellh.ghostty"];
        #     sortByMostUsed = true;
        #     terminalCommand = "alacritty -e";
        #     customLaunchPrefixEnabled = false;
        #     customLaunchPrefix = "";
        #     viewMode = "list";
        #     showCategories = true;
        #     iconMode = "tabler";
        #     showIconBackground = false;
        #     enableSettingsSearch = true;
        #     enableWindowsSearch = true;
        #     enableSessionSearch = true;
        #     ignoreMouseInput = false;
        #     screenshotAnnotationTool = "";
        #     overviewLayer = false;
        #     density = "default";
        #   };
        #   controlCenter = {
        #     position = "close_to_bar_button";
        #     diskPath = "/";
        #     shortcuts = {
        #       left = [
        #         {
        #           id = "Network";
        #         }
        #         {
        #           id = "Bluetooth";
        #         }
        #         {
        #           id = "plugin:timer";
        #         }
        #       ];
        #       right = [
        #         {
        #           id = "PowerProfile";
        #         }
        #         {
        #           id = "KeepAwake";
        #         }
        #         {
        #           id = "NightLight";
        #         }
        #       ];
        #     };
        #     cards = [
        #       {
        #         enabled = true;
        #         id = "profile-card";
        #       }
        #       {
        #         enabled = true;
        #         id = "shortcuts-card";
        #       }
        #       {
        #         enabled = true;
        #         id = "audio-card";
        #       }
        #       {
        #         enabled = false;
        #         id = "brightness-card";
        #       }
        #       {
        #         enabled = true;
        #         id = "weather-card";
        #       }
        #       {
        #         enabled = true;
        #         id = "media-sysmon-card";
        #       }
        #     ];
        #   };
        #   systemMonitor = {
        #     cpuWarningThreshold = 80;
        #     cpuCriticalThreshold = 90;
        #     tempWarningThreshold = 80;
        #     tempCriticalThreshold = 90;
        #     gpuWarningThreshold = 80;
        #     gpuCriticalThreshold = 90;
        #     memWarningThreshold = 80;
        #     memCriticalThreshold = 90;
        #     swapWarningThreshold = 80;
        #     swapCriticalThreshold = 90;
        #     diskWarningThreshold = 80;
        #     diskCriticalThreshold = 90;
        #     diskAvailWarningThreshold = 20;
        #     diskAvailCriticalThreshold = 10;
        #     batteryWarningThreshold = 20;
        #     batteryCriticalThreshold = 5;
        #     enableDgpuMonitoring = false;
        #     useCustomColors = false;
        #     warningColor = "#e8b9d5";
        #     criticalColor = "#ffb4ab";
        #     externalMonitor = "resources || missioncenter || jdsystemmonitor || corestats || system-monitoring-center || gnome-system-monitor || plasma-systemmonitor || mate-system-monitor || ukui-system-monitor || deepin-system-monitor || pantheon-system-monitor";
        #   };
        #   noctaliaPerformance = {
        #     disableWallpaper = true;
        #     disableDesktopWidgets = true;
        #   };
        #   dock = {
        #     enabled = false;
        #     position = "bottom";
        #     displayMode = "auto_hide";
        #     dockType = "floating";
        #     backgroundOpacity = 1;
        #     floatingRatio = 1;
        #     size = 1;
        #     onlySameOutput = true;
        #     monitors = [];
        #     pinnedApps = [];
        #     colorizeIcons = false;
        #     showLauncherIcon = false;
        #     launcherPosition = "end";
        #     launcherIconColor = "none";
        #     pinnedStatic = false;
        #     inactiveIndicators = false;
        #     groupApps = false;
        #     groupContextMenuMode = "extended";
        #     groupClickAction = "cycle";
        #     groupIndicatorStyle = "dots";
        #     deadOpacity = 0.6;
        #     animationSpeed = 1;
        #     sitOnFrame = false;
        #     showDockIndicator = false;
        #     indicatorThickness = 3;
        #     indicatorColor = "primary";
        #     indicatorOpacity = 0.6;
        #   };
        #   network = {
        #     wifiEnabled = true;
        #     airplaneModeEnabled = false;
        #     bluetoothRssiPollingEnabled = true;
        #     bluetoothRssiPollIntervalMs = 60000;
        #     networkPanelView = "wifi";
        #     wifiDetailsViewMode = "grid";
        #     bluetoothDetailsViewMode = "grid";
        #     bluetoothHideUnnamedDevices = true;
        #     disableDiscoverability = true;
        #     bluetoothAutoConnect = true;
        #   };
        #   sessionMenu = {
        #     enableCountdown = true;
        #     countdownDuration = 10000;
        #     position = "center";
        #     showHeader = true;
        #     showKeybinds = false;
        #     largeButtonsStyle = true;
        #     largeButtonsLayout = "single-row";
        #     powerOptions = [
        #       {
        #         action = "lock";
        #         enabled = true;
        #         keybind = "1";
        #         countdownEnabled = false;
        #       }
        #       {
        #         action = "suspend";
        #         enabled = true;
        #         keybind = "2";
        #         countdownEnabled = false;
        #       }
        #       {
        #         action = "hibernate";
        #         enabled = false;
        #         keybind = "3";
        #       }
        #       {
        #         action = "reboot";
        #         enabled = true;
        #         keybind = "4";
        #       }
        #       {
        #         action = "logout";
        #         enabled = true;
        #         keybind = "5";
        #       }
        #       {
        #         action = "shutdown";
        #         enabled = true;
        #         keybind = "6";
        #       }
        #       {
        #         action = "rebootToUefi";
        #         enabled = false;
        #         keybind = "7";
        #       }
        #     ];
        #   };
        #   notifications = {
        #     enabled = true;
        #     enableMarkdown = false;
        #     density = "default";
        #     monitors = [];
        #     location = "bottom_center";
        #     overlayLayer = true;
        #     backgroundOpacity = 1;
        #     respectExpireTimeout = false;
        #     lowUrgencyDuration = 3;
        #     normalUrgencyDuration = 8;
        #     criticalUrgencyDuration = 15;
        #     clearDismissed = true;
        #     saveToHistory = {
        #       low = true;
        #       normal = true;
        #       critical = true;
        #     };
        #     sounds = {
        #       enabled = true;
        #       volume = 0.5;
        #       separateSounds = false;
        #       criticalSoundFile = "";
        #       normalSoundFile = "";
        #       lowSoundFile = "";
        #       excludedApps = "discordfirefox,chrome,chromium,edge";
        #     };
        #     enableMediaToast = false;
        #     enableKeyboardLayoutToast = true;
        #     enableBatteryToast = true;

        #   };
        #   osd = {
        #     enabled = true;
        #     location = "bottom";
        #     autoHideMs = 2000;
        #     overlayLayer = true;
        #     backgroundOpacity = 1;
        #     enabledTypes = [
        #       0
        #       1
        #       2
        #     ];
        #     monitors = [];
        #   };
        #   audio = {
        #     volumeStep = 5;
        #     volumeOverdrive = false;
        #     spectrumFrameRate = 60;
        #     visualizerType = "linear";
        #     mprisBlacklist = [];
        #     preferredPlayer = "";
        #     volumeFeedback = true;
        #     volumeFeedbackSoundFile = "";
        #   };
        #   brightness = {
        #     brightnessStep = 5;
        #     enforceMinimum = false;
        #     enableDdcSupport = true;
        #     backlightDeviceMappings = [];
        #   };
        #   colorSchemes = {
        #     useWallpaperColors = true;
        #     predefinedScheme = "Noctalia (default)";
        #     darkMode = false;
        #     schedulingMode = "location";
        #     manualSunrise = "06:30";
        #     manualSunset = "18:30";
        #     generationMethod = "faithful";
        #     monitorForColors = "";
        #   };
        #   templates = {
        #     activeTemplates = [
        #       {
        #         id = "niri";
        #         enabled = true;
        #       }
        #       {
        #         id = "helix";
        #         enabled = true;
        #       }
        #       {
        #         id = "btop";
        #         enabled = true;
        #       }
        #       {
        #         id = "qt";
        #         enabled = true;
        #       }
        #       {
        #         id = "gtk";
        #         enabled = true;
        #       }
        #       {
        #         id = "ghostty";
        #         enabled = true;
        #       }
        #       {
        #         id = "cava";
        #         enabled = true;
        #       }
        #       {
        #         id = "yazi";
        #         enabled = true;
        #       }
        #       {
        #         id = "zenBrowser";
        #         enabled = true;
        #       }
        #     ];
        #     enableUserTheming = false;
        #   };
        #   nightLight = {
        #     enabled = true;
        #     forced = false;
        #     autoSchedule = true;
        #     nightTemp = "5500";
        #     dayTemp = "6300";
        #     manualSunrise = "06:30";
        #     manualSunset = "18:30";
        #   };
        #   hooks = {
        #     enabled = false;
        #     wallpaperChange = "";
        #     darkModeChange = "";
        #     screenLock = "";
        #     screenUnlock = "";
        #     performanceModeEnabled = "";
        #     performanceModeDisabled = "";
        #     startup = "";
        #     session = "";
        #   };
        #   plugins = {
        #     autoUpdate = false;
        #   };
        #   idle = {
        #     enabled = true;
        #     screenOffTimeout = 300;
        #     lockTimeout = 600;
        #     suspendTimeout = 1200;
        #     fadeDuration = 5;
        #     screenOffCommand = "";
        #     lockCommand = "";
        #     suspendCommand = "";
        #     resumeScreenOffCommand = "";
        #     resumeLockCommand = "";
        #     resumeSuspendCommand = "";
        #     customCommands = "[]";
        #   };
        #   desktopWidgets = {
        #     enabled = false;
        #     overviewEnabled = true;
        #     gridSnap = false;
        #     gridSnapScale = false;
        #     monitorWidgets = [];
        #   };
      };
    };
  };
}
