{
  lib,
  config,
  ...
}: let
  cfg = config.glaciux.zed-editor;
in {
  options.glaciux.zed-editor.enable = lib.mkEnableOption "zed-editor";
  config = lib.mkIf cfg.enable {
    programs.zed-editor = {
      enable = true;
      defaultEditor = true;
      extensions = [
        "opencode"
        "catppuccin-icons"
      ];
      userSettings = {
        autosave = "on_focus_change";
        bottom_dock_layout = "full";
        buffer_font_family = "Iosevka Nerd Font";
        buffer_line_height = "standard";
        calls.mute_on_join = true;
        collaboration_panel.button = false;
        cursor_shape = "bar";
        diagnostics.inline.enabled = true;
        file_finder.file_icons = true;
        focus_follows_mouse.enabled = true;
        format_on_save = "off";
        git.inline_blame.show_commit_summary = true;
        gutter.folds = false;
        helix_mode = true;
        minimap.show = "never";
        outline_panel.button = false;
        scroll_beyond_last_line = "vertical_scroll_margin";
        search.button = false;
        soft_wrap = "editor_width";
        use_smartcase_search = true;
        use_system_window_tabs = true;

        agent = {
          dock = "left";
          single_file_review = true;
          enable_feedback = false;
          show_turn_stats = true;
          play_sound_when_agent_done = "when_hidden";
          default_model = {
            provider = "ollama";
            model = "qwen3.5:9b";
            enable_thinking = true;
          };
        };

        edit_predictions = {
          ollama = {
            model = "qwen2.5-coder:7b-base";
            api_url = "https://ollama.sole-alkaid.ts.net";
          };
          provider = "ollama";
          mode = "eager";
        };

        git_panel = {
          dock = "right";
          tree_view = true;
        };

        icon_theme = {
          mode = "system";
          light = "Catppuccin Latte";
          dark = "Catppuccin Macchiato";
        };

        indent_guides = {
          active_line_width = 10;
          background_coloring = "indent_aware";
          coloring = "indent_aware";
          enabled = true;
          line_width = 2;
        };

        language_models = {
          ollama = {
            context_window = 64000;
            api_url = "https://ollama.sole-alkaid.ts.net";
          };
        };

        project_panel = {
          entry_spacing = "standard";
          git_status = false;
          hide_root = true;
          indent_size = 12;
        };

        tabs = {
          file_icons = true;
          show_close_button = "hidden";
        };

        tab_bar = {
          show_nav_history_buttons = false;
          show_tab_bar_buttons = false;
          show_pinned_tabs_in_separate_row = true;
        };

        terminal = {
          shell = "system";
          font_size = 16;
          font_family = "Iosevka Nerd Font";
          cursor_shape = "bar";
        };

        theme = {
          mode = "system";
          light = "Noctalia Light";
          dark = "Noctalia Dark";
        };

        title_bar = {
          button_layout = "";
          show_sign_in = false;
        };

        languages = {
          ${"Shell Script"} = {
            format_on_save = "on";
            formatter = {
              external = {
                command = "shfmt";
                arguments = [
                  "--filename"
                  "{buffer_path}"
                  "--indent"
                  "4"
                ];
              };
            };
          };
          Nix = {
            language_servers = [
              "!nil"
              "nixd"
            ];
            format_on_save = "on";
            formatter = {
              external = {
                command = "alejandra";
                # arguments = ["--exclude flake.nix"];
              };
            };
          };
        };
      };
    };
  };
}
