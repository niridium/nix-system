{
  system.stateVersion = "25.11";
  imports = [
    ./hardware-configuration.nix

    ../../modules/core

    ../../modules/filesystem/btrfs_subvolumes.nix
    ../../modules/filesystem/swap.nix
    ../../modules/filesystem/swraid.nix

    ../../modules/services/actual.nix
    ../../modules/services/immich.nix
    ../../modules/services/navidrome.nix
    ../../modules/services/openssh.nix

    ../../modules/tailscale.nix

    ../../modules/remote_builder.nix
  ];

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  fileSystems."/storage" = {
    device = "/dev/md127";
    fsType = "btrfs";
    mountPoint = "/storage";
    options = ["compress=zstd"];
  };

  services.beesd.filesystems.storage = {
    spec = "/storage";
    hashTableSizeMB = 512;
    extraOptions = [
      "--loadavg-target"
      "5.0"
    ];
  };
}
