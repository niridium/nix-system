{lib, ...}: {
  flake.modules = {
    nixos.gui = {
      pkgs,
      config,
      ...
    }: {
      options.gui = {
        enable = lib.mkEnableOption "Enable system graphical user interface";
      };
      config = lib.mkIf config.gui.enable {
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
    };
    homeManager.gui = {pkgs, ...}: {
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
}
