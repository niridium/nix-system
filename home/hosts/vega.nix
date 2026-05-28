{pkgs, ...}: {
  home.stateVersion = "25.11";
  imports = [
    ../core
    ../gui

    ../beets.nix
    ../cava.nix

    ../browsers/firefox.nix

    ../editors/zed-editor.nix

    ../gaming/factorio.nix
  ];

  home.packages = [
    pkgs.handbrake
    pkgs.immich-cli
  ];
}
