{
  config.flake.factory.fs.btrfs = {systemDevice}: {
    # imports = [
    #   (self.factory.fs.btrfsMaintenance {
    #     name = "root";
    #     mountPoint = "/";
    #   })
    # ];
    fileSystems."/" = {
      # options = ["compress=zstd"];
      neededForBoot = true;
    };
    # services = {
    #   btrfs.autoScrub = {
    #     enable = true;
    #   };
    #   beesd.filesystems = {
    #     root = {
    #       spec = "/";
    #       hashTableSizeMB = 512;
    #       verbosity = "info";
    #       extraOptions = [
    #         "--loadavg-target"
    #         "5.0"
    #       ];
    #     };
    #     storage = {
    #       spec = "/storage";
    #       hashTableSizeMB = 512;
    #       extraOptions = [
    #         "--loadavg-target"
    #         "5.0"
    #       ];
    #     };
    #   };
    # };
    # fileSystems."/" = {
    #   options = ["compress=zstd"];
    #   neededForBoot = true;
    # };
    # fileSystems."/storage" = {
    #   device = "/dev/md127";
    #   fsType = "btrfs";
    #   mountPoint = "/storage";
    #   options = ["compress=zstd"];
    # };
    disko.devices = {
      disk = {
        main = {
          type = "disk";
          device = "${systemDevice}";
          content = {
            type = "gpt";
            partitions = {
              ESP = {
                size = "1G";
                type = "EF00";
                content = {
                  type = "filesystem";
                  format = "vfat";
                  mountpoint = "/boot";
                  mountOptions = ["umask=0077"];
                };
              };
              root = {
                size = "100%";
                content = {
                  type = "btrfs";
                  extraArgs = ["-f"];
                  mountpoint = "/";
                  subvolumes = {
                    "/rootfs" = {
                      mountpoint = "/";
                      mountOptions = ["compress=zstd"];
                    };
                    "/persistent".mountpoint = "/persistent";
                    "/nix".mountpoint = "/nix";
                  };
                };
              };
            };
          };
        };
      };
    };
  };
}
