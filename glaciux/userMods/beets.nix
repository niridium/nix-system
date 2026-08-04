{
  config,
  lib,
  ...
}: {
  options.glaciux.beets.enable = lib.mkEnableOption "beets, music library manager" // {default = true;};
  config = lib.mkIf config.glaciux.beets.enable {
    programs.beets = {
      enable = true;
      settings = {
        directory = "~/Music";
        library = "~/Music/library.db";
        import.copy = true;
        plugins = [
          "musicbrainz"
          "deezer"
          "chroma"
          "fetchart"
          "lastgenre"
          "replaygain"
          "scrub"
          "duplicates"
          "missing"
          "info"
        ];
        replaygain.command = "mp3gain";
      };
    };
  };
}
