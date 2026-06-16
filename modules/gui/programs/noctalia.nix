{
  flake.modules.homeManager.gui = {
    programs.noctalia = {
      enable = true;
      settings = {
        audio = {
          enable_sounds = true;
        };
        bar = {
          order = ["widgets"];
          widgets = {
            background_opacity = 0.7;
            border_width = 4.0;
            center = ["clock"];
            font_weight = 300;
            contact_shadow = true;
            end = ["tray" "notifications" "clipboard" "brightness" "volume" "bluetooth" "network" "battery"];
            margin_edge = 4;
            margin_ends = 4;
            position = "top";
            radius = 14;
            scale = 1.1;
            shadow = false;
            start = ["cpu" "ram" "weather"];
            thickness = 40;
            widget_spacing = 15;
          };
        };
        brightness.enable_ddcutil = true;
        control_center = {
          sidebar = "full";
          sidebar_section = "none";
        };
        desktop_widgets.enabled = false;
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
          app_icon_colorize = true;
          corner_radius_scale = 0.5;
          font_family = "Iosevka NF Light";
          password_style = "random";
          polkit_agent = true;
          telemetry_enabled = true;
          panel = {
            clipboard_placement = "attached";
            launcher_categories = false;
            launcher_compact = true;
            launcher_placement = "centered";
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
            community_ids = ["pywalfox" "zed" "yazi"];
          };
        };
        widget = {
          battery = {
            display_mode = "graphic";
            hide_when_full = true;
            show_label = false;
          };
          brightness.show_label = false;
          clock.format = "{:%d / %H:%M}";
          cpu.display = "text";
          network.show_label = false;
          notifications.hide_when_no_unread = true;
          ram.display = "text";
          volume.show_label = false;
          workspaces.minimal = true;
        };
      };
    };
  };
}
