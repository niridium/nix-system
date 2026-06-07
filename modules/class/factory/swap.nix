{
  config.flake.factory.swap = {swapAmount}: {
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
}
