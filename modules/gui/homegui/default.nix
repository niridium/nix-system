{
  flake.modules.homeManager.gui = {pkgs, ...}: {
    home.packages = [
      pkgs.nautilus
      pkgs.ddcutil
      pkgs.imv
      pkgs.mpv
      pkgs.tutanota-desktop
      pkgs.gelly
    ];
  };
}
