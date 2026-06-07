{
  flake.modules.homeManager.gui = {pkgs, ...}: {
    programs.niri = {
      enable = true;
      package = pkgs.niri;
      settings = {
        spawn-at-startup = [
          {
            command = [
              "noctalia"
            ];
          }
        ];
        input = {
          keyboard.xkb = {
            layout = "us";
            variant = "colemak";
          };
          focus-follows-mouse.enable = true;
        };
        outputs = {
          eDP-1 = {
            mode = {
              height = 1200;
              width = 1920;
              refresh = 60.003;
            };
          };
          HDMI-A-1 = {
            mode = {
              height = 1440;
              width = 2560;
              refresh = 143.999;
            };
            position = {
              x = -1536;
              y = -240;
            };
            focus-at-startup = true;
          };
        };

        window-rules = [
          {
            clip-to-geometry = true;
            geometry-corner-radius = let
              r = 10.;
            in {
              top-left = r;
              top-right = r;
              bottom-left = r;
              bottom-right = r;
            };
          }
        ];
        layout = {
          gaps = 8;
          always-center-single-column = true;
          default-column-width = {
            proportion = 1. / 2.;
          };
          focus-ring = {
            active.color = "#635f4a";
            inactive.color = "#fdf8f5";
            urgent.color = "#ba1a1a";
          };
          border = {
            active.color = "#635f4a";
            inactive.color = "#fdf8f5";
            urgent.color = "#ba1a1a";
          };
          shadow = {
            enable = false;
            color = "#00000070";
          };
          tab-indicator = {
            active.color = "#635f4a";
            inactive.color = "#eae2c9";
            urgent.color = "#ba1a1a";
          };
          insert-hint = {
            display.color = "635f4a80";
          };
        };

        debug.honor-xdg-activation-with-invalid-serial = true;
        prefer-no-csd = true;
        hotkey-overlay.skip-at-startup = true;

        cursor = {
          hide-after-inactive-ms = 4000;
          hide-when-typing = true;
        };

        binds = let
          spawnLocked = command: {
            action.spawn = command;
            allow-when-locked = true;
          };
          noRepeat = {
            repeat = false;
          };
        in {
          "Mod+Space".action.spawn-sh = "noctalia msg panel-toggle launcher";
          "Mod+S".action.spawn-sh = "noctalia msg panel-toggle control-center";
          "Mod+Shift+G".action.spawn-sh = "noctalia msg session lock";
          "Mod+C" = noRepeat // {action.close-window = [];};
          "Mod+O" = noRepeat // {action.toggle-overview = [];};
          "Mod+Page_Down".action.focus-workspace-down = [];
          "Mod+Page_Up".action.focus-workspace-up = [];
          "Mod+H".action.focus-column-left = [];
          "Mod+J".action.focus-window-down = [];
          "Mod+K".action.focus-window-up = [];
          "Mod+L".action.focus-column-right = [];
          "Mod+Left".action.focus-column-left = [];
          "Mod+Down".action.focus-window-down = [];
          "Mod+Up".action.focus-window-up = [];
          "Mod+Right".action.focus-column-right = [];
          "Mod+WheelScrollRight".action.focus-column-right = [];
          "Mod+WheelScrollLeft".action.focus-column-left = [];
          "Mod+Shift+H".action.move-column-left = [];
          "Mod+Shift+J".action.move-window-down = [];
          "Mod+Shift+K".action.move-window-up = [];
          "Mod+Shift+L".action.move-column-right = [];
          "Mod+R".action.switch-preset-column-width = [];
          "Mod+Shift+R".action.switch-preset-window-height = [];
          "Mod+Ctrl+R".action.reset-window-height = [];
          "Mod+F".action.maximize-column = [];
          "Mod+V".action.toggle-window-floating = [];
          "XF86AudioRaiseVolume" = (
            spawnLocked [
              "noctalia"
              "msg"
              "volume-up"
            ]
          );
          "XF86AudioLowerVolume" = (
            spawnLocked [
              "noctalia"
              "msg"
              "volume-down"
            ]
          );
          "XF86AudioPlay" = (
            spawnLocked [
              "noctalia"
              "msg"
              "media"
              "toggle"
            ]
          );
          "XF86AudioNext" = (
            spawnLocked [
              "noctalia"
              "msg"
              "media"
              "next"
            ]
          );
          "XF86AudioPrev" = (
            spawnLocked [
              "noctalia"
              "msg"
              "media"
              "previous"
            ]
          );
          "XF86AudioMute" = (
            spawnLocked [
              "noctalia"
              "msg"
              "volume-mute"
            ]
          );
          "XF86AudioMicMute" = (
            spawnLocked [
              "noctalia"
              "msg"
              "mic-mute"
            ]
          );
          "XF86MonBrightnessUp" = (
            spawnLocked [
              "noctalia"
              "msg"
              "brightness-up"
            ]
          );
          "XF86MonBrightnessDown" = (
            spawnLocked [
              "noctalia"
              "msg"
              "brightness-down"
            ]
          );
        };
      };
    };
  };
}
