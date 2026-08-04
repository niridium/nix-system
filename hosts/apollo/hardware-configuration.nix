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
      luks.devices."crypted".device = "/dev/disk/by-uuid/8ad3b954-aeff-4d8b-a13e-a0726ab649a6";
      availableKernelModules = ["nvme" "xhci_pci" "thunderbolt" "usbhid"];
      kernelModules = [];
    };
    kernelModules = ["kvm-amd"];
    extraModulePackages = [];
  };

  fileSystems = {
    "/" = {
      device = "/dev/mapper/crypted";
      fsType = "btrfs";
      options = ["subvol=rootfs"];
    };

    "/nix" = {
      device = "/dev/mapper/crypted";
      fsType = "btrfs";
      options = ["subvol=nix"];
    };

    "/persistent" = {
      device = "/dev/mapper/crypted";
      fsType = "btrfs";
      options = ["subvol=persistent"];
    };

    "/boot" = {
      device = "/dev/disk/by-uuid/FB33-07A0";
      fsType = "vfat";
      options = ["fmask=0077" "dmask=0077"];
    };
  };

  swapDevices = [];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
