{
  flake.modules.nixos.ios = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      libimobiledevice
      ifuse
    ];
    services.usbmuxd.enable = true;
  };
}
