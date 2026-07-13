{
  flake.aspects.network = {hostname}: {
    nixos.networking.hostName = "${hostname}";
  };
}
