{
  config,
  pkgs,
  lib,
  ...
}: let
  cfg = config.glaciux.distributedBuilds;
in {
  options.glaciux.distributedBuilds = {
    enable = lib.mkEnableOption "nix distributed builds";
    remoteHost = lib.mkOption {
      type = lib.types.str;
      default = "";
    };
    isBuilder = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };
  config = lib.mkIf cfg.enable {
    nix = {
      distributedBuilds = true;
      settings.builders-use-substitutes = true;
      nrBuildUsers = 64;
      settings.trusted-users = ["hyperion"];
      buildMachines = lib.mkIf (cfg.remoteHost != "") [
        {
          hostName = cfg.remoteHost;
          sshUser = "hyperion";
          system = pkgs.stdenv.hostPlatform.system;
          supportedFeatures = ["nixos-test" "big-parallel" "kvm"];
          maxJobs = 16;
          speedFactor = 2;
        }
      ];
    };
    users = lib.mkIf cfg.isBuilder {
      groups.remotebuild = {};
      users.hyperion = {
        isSystemUser = true;
        group = "remotebuild";
        useDefaultShell = true;
      };
    };
  };
}
