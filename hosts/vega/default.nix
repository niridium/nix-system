{inputs, ...}: {
  system.stateVersion = "25.11";
  imports = [
    inputs.nix-index-database.nixosModules.default

    ./hardware-configuration.nix
    ../../modules/laptop.nix

    ../../modules/core
    ../../modules/gui

    ../../modules/filesystem/btrfs_subvolumes_luks.nix
    ../../modules/filesystem/swap.nix

    ../../modules/tailscale.nix
    ../../modules/wireless.nix

    ../../modules/gaming/steam.nix

    ../../modules/distributed-builds.nix
  ];
}
