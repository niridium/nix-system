{
  flake.modules.homeManager.gui = {pkgs, ...}: {
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
