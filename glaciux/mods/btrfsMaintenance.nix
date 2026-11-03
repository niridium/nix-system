{
  config,
  lib,
  ...
}: let
  cfg = config.glaciux.btrfsMaintenance;

  fsBeesd = lib.mapAttrs' (name: set:
    lib.nameValuePair name {
      spec = set.mountPoint;
      extraOptions = ["--loadavg-target" "5.0"];
    })
  cfg.fs;
in {
  options.glaciux.btrfsMaintenance = {
    enable = lib.mkEnableOption "Btrfs maintenance (auto-scrub + beesd)";
    fs = lib.mkOption {
      type = lib.types.attrsOf (lib.types.submodule {
        options.mountPoint = lib.mkOption {
          type = lib.types.str;
        };
      });
    };
  };
  config = lib.mkIf cfg.enable {
    services.btrfs.autoScrub.enable = true;
    services.beesd.filesystems = fsBeesd;
  };
}
