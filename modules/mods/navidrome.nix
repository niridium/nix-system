{
  flake.aspects.navidrome = {
    nixos.services.navidrome = {
      enable = true;
      settings = {
        MusicFolder = "/storage/Backups/vega/Music";

        EnableInsightsCollector = true;

        Backup = {
          Path = "/storage/Backups/licher/Navidrome";
          Schedule = "0 0 * * *";
          Count = 7;
        };
      };
    };
  };
}
