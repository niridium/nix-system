{
  config,
  lib,
  ...
}: let
  cfg = config.glaciux.hardware;
in {
  options.glaciux.hardware = {
    enable = lib.mkEnableOption "hardware configurations" // {default = true;};
    laptop.enable = lib.mkEnableOption "laptop features";
    wireless.enable = lib.mkEnableOption "wireless connectivity";
  };
  config = lib.mkIf cfg.enable {
    powerManagement.powertop.enable = cfg.laptop.enable;
    hardware = {
      enableRedistributableFirmware = true;
      bluetooth.enable = cfg.wireless.enable;
      graphics = {
        enable = true;
        enable32Bit = true;
      };
    };
    services = lib.mkIf cfg.laptop.enable {
      upower.enable = true; # Battery report
      fprintd.enable = true; # Fingerprint reader
    };
    networking.networkmanager.wifi = {
      powersave = cfg.laptop.enable;
      macAddress = "stable-ssid";
    };
  };
}
