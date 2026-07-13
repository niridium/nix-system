{
  flake.aspects.tailscale = {
    nixos.services.tailscale = {
      enable = true;
      disableUpstreamLogging = true;
      extraSetFlags = ["--accept-routes"];
    };
  };
}
