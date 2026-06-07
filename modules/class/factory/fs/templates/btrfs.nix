{
  config.flake.factory.fs.btrfs = {systemDevice}: {
    # imports = [
    #   (self.factory.fs.btrfsMaintenance {
    #     name = "root";
    #     mountPoint = "/";
    #   })
    # ];
    fileSystems."/" = {
      neededForBoot = true;
    };
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
