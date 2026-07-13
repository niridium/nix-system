{lib, ...}: {
  flake.aspects = {aspects, ...}: {
    mount = {
      name,
      device,
      mountPoint,
      format,
      ...
    }: {
      includes = [
        (aspects.fs._.btrfsMaintenance {
          name = "${name}";
          mountPoint = "${mountPoint}";
        })
      ];
      nixos.fileSystems."${mountPoint}" = {
        device = "${device}";
        fsType = "${format}";
        mountPoint = "${mountPoint}";
        options = lib.mkIf (format == "btrfs") ["compress=zstd"];
      };
    };
  };
}
