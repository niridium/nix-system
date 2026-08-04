{pkgs, ...}: {
  services.flatpak.enable = true;
  xdg.portal = {
    enable = true;
    extraPortals = [pkgs.xdg-desktop-portal-gtk];
    config.preferred.default = ["gtk"];
  };
  environment.systemPackages = [pkgs.warehouse];
}
