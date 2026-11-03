{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.glaciux.flatpak;
in {
  options.glaciux.flatpak.enable = lib.mkEnableOption "Flatpak support";
  config = lib.mkIf cfg.enable {
    services.flatpak.enable = true;
    xdg.portal = {
      enable = true;
      extraPortals = [pkgs.xdg-desktop-portal-gtk];
      config.preferred.default = ["gtk"];
    };
    environment.systemPackages = [pkgs.warehouse];
  };
}
