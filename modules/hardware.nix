{lib, ...}: {
  flake.aspects = {
    hardware = {
      bootModules ? [],
      cpu ? "",
      platform ? "x86_64-linux",
      laptop ? false, # Enable laptop tweaks
      wireless ? false, # Enable Wifi and Bluetooth
      ...
    }: let
      isCpu =
        if cpu == ""
        then false
        else true;
    in {
      nixos = {
        boot.initrd.availableKernelModules = bootModules;

        nixpkgs.hostPlatform = lib.mkDefault "${platform}";

        hardware = {
          enableRedistributableFirmware = true;
          cpu = lib.optionalAttrs isCpu {${cpu}.updateMicrocode = true;};
          bluetooth.enable = lib.mkIf wireless true;
        };
        powerManagement.powertop.enable = lib.mkIf laptop true;
        services = lib.mkIf laptop {
          upower.enable = true; # Battery report
          fprintd.enable = true; # Fingerprint reader
        };
        networking.networkmanager.wifi = {
          powersave = lib.mkIf laptop true;
          macAddress = lib.mkIf wireless "stable-ssid";
        };
      };
    };
  };
}
