{
  imports = [./hardware-configuration.nix];
  services.actual.enable = true;
  hardware.nvidia.open = true;
  services.xserver.videoDrivers = ["nvidia"];
  boot.kernel.sysctl = {
    "net.ipv4.ip_forward" = true;
    "net.ipv6.conf.all.forwarding" = true;
  };
  glaciux = {
    users.amalthea = {
      enable = true;
      linger = true;
    };
    btrfsMaintenance.fs = {
      root = {mountPoint = "/";};
      storage = {mountPoint = "/storage";};
    };
    swap.enable = true;
    # gui = {
    #   enable = true;
    #   defaultUser = "amalthea";
    # };
    # gaming = {
    #   enable = true;
    #   server = {
    #     enable = true;
    #     virtualDisplay = "0000:0c:00.0";
    #   };
    # };
    distributedBuilds = {
      enable = true;
      isBuilder = true;
    };
    immich.enable = true;
    navidrome.enable = true;
    openssh.enable = true;
    ollama.enable = false;
    llamaCpp.enable = true;
    linkding.enable = false;
    virtualisation.enable = true;
    webdav = {
      enable = true;
      directory = "/storage/box";
    };
  };
}
