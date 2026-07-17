{
  flake.aspects.linkding = {
    nixos.services.linkding = {
      enable = true;
      address = "0.0.0.0";
      # settings = {};
    };
  };
}
