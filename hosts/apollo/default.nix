{
  imports = [./hardware-configuration.nix];
  glaciux = {
    users.callisto.enable = true;
    btrfsMaintenance.fs.root = {mountPoint = "/";};
    swap.enable = true;
    gaming.enable = true;
    virtualisation.enable = true;
    hardware = {
      laptop.enable = true;
      wireless.enable = true;
    };
    distributedBuilds = {
      enable = true;
      remoteHost = "cronos";
    };
    gui = {
      enable = true;
      defaultUser = "callisto";
    };
  };
}
