{
  config,
  lib,
  ...
}: {
  options.glaciux.helix.enable = lib.mkEnableOption "helix" // {default = true;};
  config = lib.mkIf config.glaciux.helix.enable {
    programs.helix = {
      enable = true;
      defaultEditor = false;
      settings.theme = "noctalia";
    };
  };
}
