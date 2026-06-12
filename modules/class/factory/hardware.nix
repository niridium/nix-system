{
  config,
  lib,
  ...
}: {
  flake.factory.hardware = {
    # modulesPath,
    bootModules,
    platform,
  }: {
    # imports = [
    #   (modulesPath + "/installer/scan/not-detected.nix")
    # ];

    boot.initrd.availableKernelModules = bootModules;
    # [
    #     # "nvme"
    #     # "xhci_pci"
    #     # "thunderbolt"
    #     # "usbhid"
    #   ];

    # nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
    nixpkgs.hostPlatform = lib.mkDefault "${platform}";

    # AMD Hardware
    hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
    boot.kernelModules = ["kvm-amd"];
  };
}
