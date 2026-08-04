{pkgs, ...}: {
  home.packages = [pkgs.immich-cli];
  glaciux = {
    firefox.enable = true;
    zed-editor.enable = true;
    qt.enable = true;
    noctalia.enable = true;
    gtk.enable = true;
    cava.enable = true;
    niri.enable = true;
  };
}
