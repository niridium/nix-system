{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.glaciux.ios;
in {
  options.glaciux.ios.enable = lib.mkEnableOption "iOS device support (libimobiledevice)";
  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [libimobiledevice ifuse];
    services.usbmuxd.enable = true;
  };
}
