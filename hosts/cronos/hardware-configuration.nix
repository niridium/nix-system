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
    initrd = {
      availableKernelModules = ["xhci_pci" "ahci" "usbhid" "sd_mod"];
      kernelModules = [];
    };
    kernelModules = ["kvm-amd"];
    extraModulePackages = [];
  };

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/b26c4be0-edf2-4441-b30b-44f2dbcfcb84";
      fsType = "btrfs";
      options = ["subvol=rootfs"];
    };
    "/nix" = {
      device = "/dev/disk/by-uuid/b26c4be0-edf2-4441-b30b-44f2dbcfcb84";
      fsType = "btrfs";
      options = ["subvol=nix"];
    };

    "/persistent" = {
      device = "/dev/disk/by-uuid/b26c4be0-edf2-4441-b30b-44f2dbcfcb84";
      fsType = "btrfs";
      options = ["subvol=persistent"];
    };

    "/boot" = {
      device = "/dev/disk/by-uuid/9F2A-F598";
      fsType = "vfat";
      options = ["fmask=0077" "dmask=0077"];
    };

    "/storage" = {
      device = "/dev/disk/by-uuid/155a6565-1240-4a8b-972c-5514331b149b";
      fsType = "btrfs";
    };
  };

  swapDevices = [];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
