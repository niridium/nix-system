{
  pkgs,
  username,
  ...
}: {
  # Backlight control
  hardware.i2c.enable = true;
  users.users.${username}.extraGroups = ["i2c"];

  services.greetd = {
    enable = true;
    settings.default_session = {
      command = "${pkgs.niri}/bin/niri-session";
      user = "${username}";
    };
  };
  environment.pathsToLink = [
    "/share/applications"
    "/share/xdg-desktop-portal"
  ]; # Needed when Desktop Environment is installed with Home Manager

  services.gvfs.enable = true; # Filesystems tool for Nautilus
}
