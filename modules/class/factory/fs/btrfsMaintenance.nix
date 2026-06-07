{
  config.flake.factory.fs.btrfsMaintenance = {
    name,
    mountPoint,
  }: {
    services = {
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
}
