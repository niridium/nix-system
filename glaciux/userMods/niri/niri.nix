{
  config,
  pkgs,
  lib,
  ...
}: let
  cfg = config.glaciux.niri;
in {
  options.glaciux.niri.enable = lib.mkEnableOption "niri";
  config = lib.mkIf cfg.enable {
    home.packages = [pkgs.niri pkgs.kdlfmt];
    xdg = {
      configFile."niri/config.kdl".source = ./config.kdl;
      portal = {
        enable = true;
        configPackages = [pkgs.niri];
        extraPortals = [pkgs.xdg-desktop-portal-gnome];
      };
    };
  };
}
