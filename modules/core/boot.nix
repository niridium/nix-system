{pkgs, ...}: {
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.loader = {
    limine.enable = true;
    efi.canTouchEfiVariables = true;
  };
}
