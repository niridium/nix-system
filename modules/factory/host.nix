{
  config.flake.factory.hostname = hostname: {
    nixos."${hostname}Network" = {
      networking.hostName = "${hostname}";
    };
  };
}
