{
  flake.modules.homeManager.beets = {
    # programs.bash.bashrcExtra = ''
    #   eval "$(beet completion)"
    # '';
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
