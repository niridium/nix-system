{
  config,
  lib,
  ...
}: let
  cfg = config.glaciux.oom;
in {
  options.glaciux.oom.enable = lib.mkEnableOption "earlyoom (OOM killer)";
  config = lib.mkIf cfg.enable {
    systemd.oomd.enable = false;
    services.earlyoom = {
      enable = true;
      enableNotifications = true;
    };
  };
}
