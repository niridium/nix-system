{
  imports = [./hardware-configuration.nix];
  services.actual.enable = true;
  glaciux = {
    users.amalthea.enable = true;
    btrfsMaintenance.fs = {
      root = {mountPoint = "/";};
      storage = {mountPoint = "/storage";};
    };
    swap.enable = true;
    gui = {
      enable = true;
      defaultUser = "amalthea";
    };
    gaming = {
      enable = true;
      server = {
        enable = true;
        virtualDisplay = "0000:0c:00.0";
      };
    };
    distributedBuilds = {
      enable = true;
      isBuilder = true;
    };
    immich.enable = true;
    navidrome.enable = true;
    openssh.enable = true;
    swRaid.enable = true;
    ollama.enable = true;
    linkding.enable = true;
  };
}
