{
  config,
  lib,
  ...
}: let
  cfg = config.glaciux.noctalia;
in {
  options.glaciux.noctalia.enable = lib.mkEnableOption "noctalia shell";
  config = lib.mkIf cfg.enable {
    programs.noctalia = {
      enable = true;
      settings = ./config.toml;
    };
  };
}
