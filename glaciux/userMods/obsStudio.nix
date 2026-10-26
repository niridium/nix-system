{
  config,
  pkgs,
  lib,
  ...
}: {
  options.glaciux.obs-studio.enable = lib.mkEnableOption "OBS Studio";
  config = lib.mkIf config.glaciux.obs-studio.enable {
    programs.obs-studio = {
      enable = true;
      plugins = with pkgs.obs-studio-plugins; [
        obs-vaapi
      ];
    };
  };
}
