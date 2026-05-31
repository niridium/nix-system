{
  flake.modules.homeManager.gui = {pkgs, ...}: {
    home.packages = [
      pkgs.xwayland-satellite
    ];
  };
}
