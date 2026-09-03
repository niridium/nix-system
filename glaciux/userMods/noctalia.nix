{
  config,
  lib,
  ...
}: let
  cfg = config.glaciux.noctalia;
in {
  options.glaciux.noctalia.enable = lib.mkEnableOption "noctalia shell";
  config = lib.mkIf cfg.enable {
    programs.noctalia = {
      enable = true;
      settings = {
        audio = {
          enable_sounds = true;
        };
        bar = {
          order = ["widgets"];
          widgets = {
            background_opacity = 1;
            border_width = 0.0;
            capsule = true;
            capsule_opacity = 0.0;
            capsule_padding = 10.0;
            capsule_radius = 0;
            capsule_thickness = 1;
            center = ["clock"];
            contact_shadow = false;
            end = ["tray" "notifications" "wallhaven" "clipboard" "brightness" "volume" "bluetooth" "network" "battery"];
            font_family = "Iosevka NF";
            font_weight = 400;
            margin_edge = 0;
            margin_ends = 0;
            panel_overlap = 0;
            position = "top";
            radius = 0;
            scale = 1;
            shadow = false;
            start = ["cpu" "ram" "weather"];
            thickness = 30;
            widget_spacing = 15;
          };
        };
        brightness.enable_ddcutil = true;
        control_center = {
          sidebar = "full";
          sidebar_section = "none";
          width = 1000;
          calendar.show_events_card = false;
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
        lockscreen = {
          blur_intensity = 0.0;
          tint_intensity = 0.0;
        };
        lockscreen_widgets.enabled = false;
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
          position = "top_center";
        };
        plugins.enabled = ["noctalia/wallhaven"];
        shell = {
          app_icon_colorize = false;
          corner_radius_scale = 0.0;
          font_family = "Iosevka NF";
          launcher = {
            categories = false;
            compact = true;
          };
          password_style = "default";
          polkit_agent = true;
          telemetry_enabled = true;
          panel = {
            clipboard_placement = "attached";
            clipboard_position = "auto";
            launcher_placement = "attached";
            launcher_position = "auto";
            open_near_click_clipboard = true;
            open_near_click_control_center = true;
            open_near_click_session = true;
            open_near_click_wallpaper = true;
            polkit_placement = "attached";
          };
          screen_corners.enabled = false;
        };
        system.monitor.gpu_poll_seconds = 5;
        theme = {
          community_palette = "Breeze";
          mode = "auto";
          pure_black_dark = true;
          source = "community";
          wallpaper_scheme = "faithful";
          templates = {
            builtin_ids = ["btop" "cava" "gtk3" "gtk4" "ghostty" "helix" "niri" "qt" "starship"];
            community_ids = ["pywalfox" "zed" "papirus-icons" "yazi"];
          };
        };
        wallpaper.transition_on_startup = true;
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
          wallhaven.type = "noctalia/wallhaven:wallhaven";
          workspaces.minimal = true;
        };
      };
    };
  };
}
