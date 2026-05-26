{pkgs, ...}: {
  home.stateVersion = "25.11";
  imports = [
    ../core
    ../tui
    ../tui/beets.nix
    ../gui
    ../browsers/firefox.nix
    # ../browsers/ladybird.nix
    ../editors/zed-editor.nix
    ../gaming/factorio.nix
  ];

  home.packages = [
    pkgs.handbrake
    pkgs.immich-cli
  ];
}
