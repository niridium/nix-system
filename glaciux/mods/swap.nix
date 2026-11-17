{
  config,
  lib,
  ...
}: let
  cfg = config.glaciux.swap;
in {
  options.glaciux.swap = {
    enable = lib.mkEnableOption "swap with zswap";
    size = lib.mkOption {
      type = lib.types.int;
      default = 8;
    };
    zswapPool = lib.mkOption {
      type = lib.types.int;
      default = 25;
    };
  };
  config = {
    boot.zswap = {
      enable = true;
      maxPoolPercent = cfg.zswapPool;
    };
    swapDevices = [
      {
        device = "/var/lib/swapfile";
        size = cfg.size * 1024;
      }
    ];
  };
}
