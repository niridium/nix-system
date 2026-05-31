{lib, ...}: {
  options.flake.factory = lib.mkOption {
    type = lib.types.attrsOf lib.types.unspecified;
    default = {};
  };
  config.flake.factory.hostname = hostname: {
    nixos."${hostname}Network" = {
      networking.hostName = "${hostname}";
    };
  };
  # config.flake.factory.swapspace = swapspace: {
  #   nixos.base = {
  #     swapDevices = [{size = "${builtins.fromJSON "${swapspace}"}" * 1024;}];
  #   };
  # };
}
