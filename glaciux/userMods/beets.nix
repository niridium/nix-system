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
        directory = "/storage/Music";
        library = "/storage/Music/library.db";
        import.copy = false;
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
