{pkgs, ...}: {
  home.packages = with pkgs; [
    immich-cli
    gelly
    tutanota-desktop
  ];
  glaciux = {
    firefox.enable = true;
    zed-editor.enable = true;
    qt.enable = true;
    noctalia.enable = true;
    gtk.enable = true;
    cava.enable = true;
    niri.enable = true;
    umbriel.enable = true;
    beets.enable = false;
  };
}
