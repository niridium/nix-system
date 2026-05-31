{
  flake.modules.nixos.gui = {pkgs, ...}: {
    # Backlight control
    hardware.i2c.enable = true;

    services.greetd = {
      enable = true;
      settings.default_session = {
        command = "${pkgs.niri}/bin/niri-session";
      };
    };
    environment.pathsToLink = [
      "/share/applications"
      "/share/xdg-desktop-portal"
    ]; # Needed when Desktop Environment is installed with Home Manager

    services.gvfs.enable = true; # Filesystems tool for Nautilus
  };
}
