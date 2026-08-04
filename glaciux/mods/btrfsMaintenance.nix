{
  config,
  lib,
  ...
}: let
  cfg = config.glaciux.btrfsMaintenance.fs;

  # name == submodule name
  # set == submodule attribute set
  fsBeesd = lib.mapAttrs' (name: set:
    lib.nameValuePair name {
      spec = set.mountPoint;
      extraOptions = ["--loadavg-target" "5.0"];
    })
  cfg;
in {
  options.glaciux.btrfsMaintenance.fs = lib.mkOption {
    type = lib.types.attrsOf (lib.types.submodule {
      options.mountPoint = lib.mkOption {
        type = lib.types.str;
      };
    });
  };
  config = lib.mkIf (cfg != {}) {
    services.btrfs.autoScrub.enable = true;
    services.beesd.filesystems = fsBeesd;
  };
}
