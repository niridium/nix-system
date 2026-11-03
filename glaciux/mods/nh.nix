{
  config,
  lib,
  ...
}: let
  cfg = config.glaciux.nh;
in {
  options.glaciux.nh.enable = lib.mkEnableOption "nh with auto-clean";
  config = lib.mkIf cfg.enable {
    programs.nh = {
      enable = true;
      clean = {
        enable = true;
        dates = "daily";
        extraArgs = " --keep 5 --keep-since 5d --optimise ";
      };
    };
  };
}
