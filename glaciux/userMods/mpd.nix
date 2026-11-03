{
  config,
  lib,
  ...
}: {
  options.glaciux.mpd.enable = lib.mkEnableOption "mpd server";
  config = lib.mkIf config.glaciux.mpd.enable {
    services.mpd = {
      enable = true;
      musicDirectory = "/home/callisto/cronos-box/Music/niridium";
      network.startWhenNeeded = true;
      extraConfig = ''
        audio_output {
            type "pipewire"
            name "Pipewire"
        }
      '';
    };
  };
}
