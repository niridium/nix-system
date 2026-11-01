{
  config,
  lib,
  ...
}: {
  options.glaciux.direnv.enable = lib.mkEnableOption "direnv";
  config = lib.mkIf config.glaciux.direnv.enable {
    programs.direnv = {
      enable = true;
      config.hide_env_diff = true;
      enableBashIntegration = true;
      nix-direnv.enable = true;
    };
  };
}
