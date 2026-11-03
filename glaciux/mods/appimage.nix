{
  config,
  lib,
  ...
}: let
  cfg = config.glaciux.appimage;
in {
  options.glaciux.appimage.enable = lib.mkEnableOption "AppImage support";
  config = lib.mkIf cfg.enable {
    programs.appimage = {
      enable = true;
      binfmt = true;
    };
  };
}
