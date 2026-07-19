{
  flake.aspects = {aspects, ...}: {
    gui = {
      includes = [
        aspects.niri
        aspects.noctalia
        aspects.gtk
        aspects.qt
        aspects.cava
      ];
      provides.autoStart = {userName ? ""}: {
        nixos.services.greetd.settings.default_session.user = userName;
      };
      nixos = {pkgs, ...}: {
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
        programs.localsend.enable = true;
      };
      homeManager = {pkgs, ...}: {
        #---Packages with no custom config------
        home.packages = with pkgs; [
          localsend # Serverless file transfer
          nautilus # File manager
          ddcutil # Backlight control
          imv # Image viewer
          mpv # Video player
          tutanota-desktop # E-mail client
          gelly # Subsonic/Jellyfin client
          xwayland-satellite # X11 compatibility
          sioyek # PDF reader
        ];
        #---------------------------------------
        home.pointerCursor = {
          enable = true;
          package = pkgs.catppuccin-cursors.mochaDark;
          name = "catppuccin-mocha-dark-cursors";
          size = 24;
          x11.enable = true;
          gtk.enable = true;
        };
      };
    };
  };
}
