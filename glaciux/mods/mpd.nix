{
  config,
  lib,
  ...
}: {
  options.glaciux.mpd.enable = lib.mkEnableOption "mpd server";
  config = lib.mkIf config.glaciux.mpd.enable {
    services.mpd = {
      enable = true;
      settings = {
        music_directory = "/storage/box/Music/niridium";
        audio_output = [
          {
            type = "pipewire";
            name = "PipeWire Audio Output";
          }
        ];
      };
    };
  };
}
