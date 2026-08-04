{
  config,
  lib,
  ...
}: {
  options.glaciux.immich.enable = lib.mkEnableOption "immich service";
  config = lib.mkIf config.glaciux.immich.enable {
    services.immich = {
      enable = true;
      host = "0.0.0.0";
      port = 2283;
      openFirewall = true;
      mediaLocation = "/storage/immich";
    };
  };
}
