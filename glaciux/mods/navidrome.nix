{
  config,
  lib,
  ...
}: {
  options.glaciux.navidrome.enable = lib.mkEnableOption "navidrome service";
  config = lib.mkIf config.glaciux.navidrome.enable {
    services.navidrome = {
      enable = true;
      settings = {
        MusicFolder = "/storage/Backups/apollo/Music";
        EnableInsightsCollector = true;
        Backup = {
          Path = "/storage/navidrome";
          Schedule = "0 0 * * *";
          Count = 7;
        };
      };
    };
  };
}
