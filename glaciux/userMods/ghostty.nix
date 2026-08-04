{
  config,
  lib,
  ...
}: {
  options.glaciux.ghostty.enable = lib.mkEnableOption "ghostty" // {default = true;};
  config = lib.mkIf config.glaciux.ghostty.enable {
    programs.ghostty = {
      enable = true;
      settings = {
        theme = "noctalia";
        font-family = "Iosevka Nerd Font Mono";
      };
    };
  };
}
