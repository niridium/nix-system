{
  config,
  pkgs,
  lib,
  ...
}: let
  cfg = config.glaciux.gui;
in {
  options.glaciux.gui = {
    enable = lib.mkEnableOption "graphical interface";
    defaultUser = lib.mkOption {
      type = lib.types.str;
      default = "";
    };
  };
  config = lib.mkIf cfg.enable {
    #---Backlight control------
    hardware.i2c.enable = true;
    #---Login manager-----------------------------
    services.greetd = {
      enable = true;
      settings.default_session = {
        command = "${pkgs.niri}/bin/niri-session";
        user = config.glaciux.gui.defaultUser;
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
    home-manager.sharedModules = [
      {
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
      }
    ];
  };
}
