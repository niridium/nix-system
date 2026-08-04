{
  config,
  lib,
  ...
}: {
  options.glaciux.linkding.enable = lib.mkEnableOption "linkding service";
  config = lib.mkIf config.glaciux.linkding.enable {
    services.linkding = {
      enable = true;
      address = "0.0.0.0";
      # settings = {};
    };
  };
}
