{
  flake.aspects.navidrome = {
    nixos.services.navidrome = {
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
