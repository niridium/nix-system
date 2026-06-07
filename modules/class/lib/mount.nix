{
  lib,
  self,
  ...
}: {
  config.flake.lib.mount = {
    label,
    device,
    mountPoint,
    format,
  }: {
    imports = [
      (self.factory.fs.btrfsMaintenance {
        name = "${label}";
        mountPoint = "${mountPoint}";
      })
    ];
    fileSystems."${mountPoint}" = {
      device = "${device}";
      fsType = "${format}";
      mountPoint = "${mountPoint}";
      options = lib.mkIf (format == "btrfs") ["compress=zstd"];
    };
  };
}
