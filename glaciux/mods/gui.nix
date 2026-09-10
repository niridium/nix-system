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
    services = {
      displayManager = {
        noctalia-greeter.enable = true;
        sessionPackages = [
          # inputs.umbriel.packages.${pkgs.stdenv.hostPlatform.system}.default
          pkgs.niri
        ];
      };
      greetd.settings.default_session.user = config.glaciux.gui.defaultUser;
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
          xwayland-satellite # X11 compatibility
          ddcutil # Backlight control
          nautilus # File manager
          imv # Image viewer
          mpv # Video player
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
