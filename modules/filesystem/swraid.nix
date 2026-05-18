{pkgs, ...}: {
  boot.swraid.mdadmConf = "MAILADDR ruben.ledesma.go@protonmail.com";
  environment.systemPackages = [pkgs.mdadm];
}
