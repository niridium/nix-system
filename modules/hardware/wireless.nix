{
  flake.modules.nixos.wireless = {
    hardware.bluetooth.enable = true;
    networking.networkmanager.wifi.macAddress = "stable-ssid";
  };
}
