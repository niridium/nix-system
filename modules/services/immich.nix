{
  flake.modules.nixos.immich = {
    services.immich = {
      enable = true;
      host = "0.0.0.0";
      port = 2283;
      openFirewall = true;
      mediaLocation = "/storage/immich";
    };
  };
}
