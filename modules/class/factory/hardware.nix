{lib, ...}: {
  flake.factory.hardware = {
    cpu ? "",
    bootModules,
    platform ? "x86_64-linux",
  }: let
    isCpu =
      if cpu == ""
      then false
      else true;
  in {
    boot.initrd.availableKernelModules = bootModules;

    nixpkgs.hostPlatform = lib.mkDefault "${platform}";

    hardware = {
      enableRedistributableFirmware = true;
      cpu = lib.optionalAttrs isCpu {${cpu}.updateMicrocode = true;};
    };
  };
}
