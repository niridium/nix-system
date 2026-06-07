{
  config.flake.factory.network = {hostname}: {
    # nixos."${hostname}Network" = {
    networking.hostName = "${hostname}";
    # };
  };
}
