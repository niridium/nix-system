{
  flake.aspects.swRaid = {
    nixos = {pkgs, ...}: {
      boot.swraid = {
        enable = true;
        mdadmConf = "MAILADDR ruben.ledesma.go@protonmail.com";
      };
      environment.systemPackages = [pkgs.mdadm];
    };
  };
}
