{lib, ...}: {
  flake.modules.nixos.hardware = {config, ...}: let
    cfg = config.hardwareExtra;
  in {
    options.hardwareExtra = {
      enable = lib.mkOption {
        default = true;
        description = "Enable extra hardware functionality";
        type = lib.types.bool;
      };
      laptop = lib.mkEnableOption "laptop software and tweaks";
      wireless = lib.mkEnableOption "wireless conectivity";
    };
    config = lib.mkIf cfg.enable {
      hardware.bluetooth.enable = lib.mkIf cfg.wireless true;
      powerManagement.powertop.enable = lib.mkIf cfg.laptop true;
      services = lib.mkIf cfg.laptop {
        upower.enable = true; # Battery report
        fprintd.enable = true; # Fingerprint reader
      };
      networking.networkmanager.wifi = {
        powersave = lib.mkIf cfg.laptop true;
        macAddress = lib.mkIf cfg.wireless "stable-ssid";
      };
    };
  };
}
