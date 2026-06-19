{
  flake.modules.homeManager.gui = {pkgs, ...}: {
    home.packages = [pkgs.kdePackages.qt6ct];
    qt = {
      enable = true;
      platformTheme.name = "qt6ct";
      qt6ctSettings = {
        Appearance = {
          color_scheme_path = "/home/nixy/.config/qt6ct/colors/noctalia.conf";
          custom_palette = true;
          style = "Breeze";
        };
        Fonts = {
          fixed = "\"Iosevka Nerd Font Mono,12\"";
          general = "\"Iosevka Nerd Font,12\"";
        };
      };
      style.name = "breeze";
    };
  };
}
