{
  config,
  lib,
  ...
}: {
  options.glaciux.tailscale.enable = lib.mkEnableOption "tailscale" // {default = true;};
  config = lib.mkIf config.glaciux.tailscale.enable {
    services.tailscale = {
      enable = true;
      disableUpstreamLogging = true;
      extraSetFlags = ["--accept-routes"];
    };
  };
}
