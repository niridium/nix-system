{
  config,
  lib,
  ...
}: let
  cfg = config.glaciux.qt;
in {
  options.glaciux.qt.enable = lib.mkEnableOption "qt theming";
  config = lib.mkIf cfg.enable {
    qt = {
      enable = true;
      style.name = "breeze";
      platformTheme.name = "gtk3";
      qt6ctSettings = {
        Appearance = {
          color_scheme_path = "/home/nixy/.config/qt6ct/colors/noctalia.conf";
          custom_palette = true;
          style = "Breeze";
          icon_theme = "Papirus";
        };
        Fonts = {
          fixed = "\"Iosevka Nerd Font Mono,11\"";
          general = "\"Iosevka Nerd Font,11\"";
        };
      };
    };
  };
}
