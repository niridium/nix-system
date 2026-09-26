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
    hardware.i2c.enable = true;
    programs.localsend.enable = true;
    environment.pathsToLink = ["/share/applications" "/share/xdg-desktop-portal"]; # Home Manager + DE requirement
    services = {
      gvfs.enable = true; # Filesystems tool for Nautilus
      greetd.settings.default_session.user = config.glaciux.gui.defaultUser;
      displayManager = {
        noctalia-greeter.enable = true;
        sessionPackages = [pkgs.niri];
      };
    };
    home-manager.sharedModules = [
      {
        home.packages = with pkgs; [
          xwayland-satellite # X11 compatibility
          ddcutil # Backlight control
          nautilus # File manager
          imv # Image viewer
          mpv # Video player
          sioyek # PDF reader
        ];
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
