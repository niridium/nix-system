{
  flake.modules.nixos.swRaid = {pkgs, ...}: {
    boot.swraid = {
      enable = true;
      mdadmConf = "MAILADDR ruben.ledesma.go@protonmail.com";
    };
    environment.systemPackages = [pkgs.mdadm];
  };
}
