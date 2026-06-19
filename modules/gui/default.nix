{
  flake.modules = {
    nixos.gui = {pkgs, ...}: {
      #---Backlight control------
      hardware.i2c.enable = true;
      #---Login manager-----------------------------
      services.greetd = {
        enable = true;
        settings.default_session = {
          command = "${pkgs.niri}/bin/niri-session";
        };
      };
      #---Filesystems tool for Nautilus---
      services.gvfs.enable = true;
      #---Home Manager + DE requirement---
      environment.pathsToLink = [
        "/share/applications"
        "/share/xdg-desktop-portal"
      ];
      #----------------------------
    };
    homeManager.gui = {pkgs, ...}: {
      #---Packages with no custom config------
      home.packages = with pkgs; [
        localsend # Serverless file transfer
        kdePackages.dolphin # File manager
        ddcutil # Backlight control
        imv # Image viewer
        mpv # Video player
        tutanota-desktop # E-mail client
        gelly # Subsonic/Jellyfin client
        xwayland-satellite # X11 compatibility
      ];
      #---------------------------------------
    };
  };
}
