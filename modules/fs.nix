{inputs, ...}: {
  flake-file.inputs.disko.url = "github:nix-community/disko/latest";
  flake.aspects = {aspects, ...}: {
    fs.provides = {
      btrfsMaintenance = {
        name,
        mountPoint,
      }: {
        nixos.services = {
          btrfs.autoScrub = {
            enable = true;
          };
          beesd.filesystems."${name}" = {
            spec = "${mountPoint}";
            hashTableSizeMB = 512;
            verbosity = "info";
            extraOptions = [
              "--loadavg-target"
              "5.0"
            ];
          };
        };
      };
      swap = {swapAmount}: {
        nixos = {
          swapDevices = [
            {
              device = "/var/lib/swapfile";
              size = swapAmount * 1024;
            }
          ];
          boot.kernelParams = [
            "zswap.enabled=1"
            "zswap.compressor=zstd"
            "zswap.max_pool_percent=20"
            "zswap.shrinker_enabled=1"
          ];
        };
      };
      btrfsLuks = {systemDevice}: {
        includes = [
          (aspects.fs._.btrfsMaintenance {
            name = "root";
            mountPoint = "/";
          })
        ];
        nixos.imports = [inputs.disko.nixosModules.disko];
        nixos.disko.devices.disk.main = {
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
              luks = {
                size = "100%";
                content = {
                  type = "luks";
                  name = "crypted";
                  settings.allowDiscards = true;
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
      btrfs = {systemDevice}: {
        includes = [
          (aspects.fs._.btrfsMaintenance {
            name = "root";
            mountPoint = "/";
          })
        ];
        nixos.imports = [inputs.disko.nixosModules.disko];
        nixos.disko.devices.disk.main = {
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
