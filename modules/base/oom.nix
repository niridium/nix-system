{
  flake.modules.nixos.base = {
    systemd.oomd.enable = false;
    services.systembus-notify.enable = true;
    services.earlyoom = {
      enable = true;
      enableNotifications = true;
    };
  };
}
