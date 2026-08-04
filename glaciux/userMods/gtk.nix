{
  config,
  pkgs,
  lib,
  ...
}: let
  cfg = config.glaciux.gtk;
in {
  options.glaciux.gtk.enable = lib.mkEnableOption "gtk theming";
  config = lib.mkIf cfg.enable {
    gtk = {
      enable = true;
      gtk4.theme = null;
      theme = {
        package = pkgs.adw-gtk3;
        name = "adw-gtk3";
      };
      font = {
        name = "Iosevka Nerd Font";
        size = 11;
      };
      iconTheme = {
        package = pkgs.papirus-icon-theme;
        name = "Papirus";
      };
    };
  };
}
