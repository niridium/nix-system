{
  config.flake.factory.network = {hostname}: {
    networking.hostName = "${hostname}";
  };
}
