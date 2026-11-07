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
        "kdl"
        "git-firefly"
        "nix"
        "html"
        "typst"
        "html-snippets"
        "live-server"
        "dockerfile"
        "xml"
        "toml"
        "sql"
        "emmet"
        "codebook"
        "java"
        "lua"
      ];
      userSettings = {
        autosave = "on_focus_change";
        auto_update = false;
        bottom_dock_layout = "full";
        buffer_font_family = "Iosevka Nerd Font";
        buffer_font_size = 18;
        buffer_font_weight = 400;
        buffer_line_height = "standard";
        ui_font_family = "Iosevka Nerd Font";
        ui_font_size = 18;
        ui_font_weight = 400;
        close_panel_on_toggle = true;
        code_lens = "on";
        diff_view_style = "unified";
        disable_ai = true;
        drop_target_size = 0.5;
        rounded_selection = false;
        gutter = {
          bookmarks = false;
          breakpoints = true;
          folds = false;
          min_line_number_digits = 0;
          runnables = true;
        };
        minimap.show = "never";
        tab_bar = {
          show = true;
          show_nav_history_buttons = false;
          show_pinned_tabs_in_separate_row = true;
          show_tab_bar_buttons = false;
        };
        tabs.show_close_button = "hidden";
        drag_and_drop_selection.enabled = false;
        toolbar = {
          breadcrumbs = false;
          selections_menu = false;
          quick_actions = false;
        };
        extend_comment_on_newline = false;
        focus_follows_mouse = {
          enabled = true;
          debounce_ms = 0;
        };
        diagnostics.inline.enabled = true;
        git.inline_blame = {
          show_commit_summary = true;
          location = "status_bar";
        };
        inlay_hints.enabled = true;
        journal.hour_format = "hour24";
        semantic_tokens = "combined";
        document_folding_ranges = "on";
        soft_wrap = "editor_width";
        theme = {
          mode = "system";
          light = "Noctalia Light";
          dark = "Noctalia Dark";
        };
        title_bar.show_sign_in = false;
        window_decorations = "server";
        vim_mode = true;
        which_key = {
          enabled = true;
          delay_ms = 500;
        };
        project_panel = {
          button = false;
          entry_spacing = "standard";
          git_status = false;
          hide_root = true;
          indent_size = 12;
          file_icons = false;
        };
        collaboration_panel.button = false;
        git_panel = {
          dock = "right";
          tree_view = true;
          commit_editor = "collapsed";
          show_count_badge = true;
        };
        outline_panel.button = false;
        calls.mute_on_join = true;
        completion_menu_item_kind = "symbol";
        completion_menu_scrollbar = "auto";
        completions.words = "enabled";
        text_rendering_mode = "grayscale";
        markdown_preview = {
          font_family = "Iosevka Nerd Font";
          code_font_family = "Iosevka Nerd Font Mono";
        };
        indent_guides = {
          enabled = true;
          line_width = 5;
          active_line_width = 10;
          coloring = "indent_aware";
          background_coloring = "indent_aware";
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
              };
            };
          };
        };
      };
    };
  };
}
