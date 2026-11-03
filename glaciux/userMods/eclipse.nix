{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.glaciux.eclipse;
in {
  options.glaciux.eclipse.enable = lib.mkEnableOption "Eclipse IDE";
  config = lib.mkIf cfg.enable {
    programs.eclipse = {
      enable = true;
      package = pkgs.eclipses.eclipse-java;
    };
  };
}
