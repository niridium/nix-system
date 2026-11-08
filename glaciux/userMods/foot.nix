{
  config,
  lib,
  ...
}: let
  cfg = config.glaciux.foot;
in {
  options.glaciux.foot.enable = lib.mkEnableOption "foot terminal";
  config = lib.mkIf cfg.enable {
    programs.foot = {
      enable = true;
      settings = {
        main = {
          include = "~/.config/foot/themes/noctalia";
          font = "Iosevka Nerd Font Mono:pixelsize=18";
          pad = "0x0 center";
          bold-text-in-bright = "palette-based";
        };
        environment = {
          FREETYPE_PROPERTIES = "cff:no-stem-darkening=0";
        };
        bell = {
          notify = "yes";
        };
        colors-dark = {
          blur = "yes";
          alpha = 0.8;
        };
        colors-light = {
          blur = "yes";
          alpha = 0.8;
        };
      };
    };
  };
}
