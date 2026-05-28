{pkgs, ...}: {
  imports = [
    ./gtk.nix
    ./niri.nix
    ./noctalia.nix
    ./qt.nix
    ./wayland.nix
  ];
  home.packages = [
    pkgs.nautilus
    pkgs.ddcutil
    pkgs.imv
    pkgs.mpv
    pkgs.tutanota-desktop
    pkgs.gelly
  ];
}
