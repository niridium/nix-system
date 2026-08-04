{
  config,
  pkgs,
  lib,
  ...
}: {
  options.glaciux.swRaid.enable = lib.mkEnableOption "swraid";
  config = lib.mkIf config.glaciux.swRaid.enable {
    environment.systemPackages = [pkgs.mdadm];
    boot.swraid = {
      enable = true;
      mdadmConf = "MAILADDR ruben.ledesma.go@protonmail.com";
    };
  };
}
