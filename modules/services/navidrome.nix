{
  flake.modules.nixos.navidrome = {
    services.navidrome = {
      enable = true;
      settings = {
        MusicFolder = "/storage/Backups/vega/Music";

        EnableInsightsCollector = true;

        Backup.Path = "/storage/Backups/licher/Navidrome";
        Backup.Schedule = "0 0 * * *";
        Backup.Count = 7;
      };
    };
  };
}
