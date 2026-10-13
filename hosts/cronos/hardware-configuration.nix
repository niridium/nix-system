{
  config,
  lib,
  modulesPath,
  ...
}: {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot = {
    initrd.availableKernelModules = ["xhci_pci" "ahci" "sd_mod"];
    initrd.kernelModules = [];
    kernelModules = ["kvm-amd"];
    extraModulePackages = [];
  };

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/f9ec345e-1b5c-4325-a232-ff9b598ef2ad";
      fsType = "btrfs";
    };
    "/boot" = {
      device = "/dev/disk/by-uuid/2690-A028";
      fsType = "vfat";
      options = ["fmask=0077" "dmask=0077"];
    };
    "/storage" = {
      device = "/dev/disk/by-uuid/696154bc-535d-49c5-ae2a-be81e73045a4";
      fsType = "btrfs";
    };
  };

  swapDevices = [];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
