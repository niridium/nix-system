{lib, ...}: {
  flake.modules.nixos.nixBuilds = {
    config,
    pkgs,
    ...
  }: let
    cfg = config.nixBuilds;
  in {
    options.nixBuilds = {
      enable = lib.mkEnableOption "nix remote builds";
      isBuilder = lib.mkOption {
        type = lib.types.bool;
        description = "Set this host as remote builder";
        default = false;
      };
      remoteHost = lib.mkOption {
        type = lib.types.str;
        description = "Hostname of the remote builder";
        default = "";
      };
    };
    config = lib.mkIf cfg.enable {
      nix = {
        distributedBuilds = true;
        settings.builders-use-substitutes = true;
        nrBuildUsers = 64;
        settings.trusted-users = ["remotebuild"];
        buildMachines = lib.mkIf (cfg.remoteHost != "") [
          {
            hostName = cfg.remoteHost;
            sshUser = "remotebuild";
            system = pkgs.stdenv.hostPlatform.system;
            supportedFeatures = ["nixos-test" "big-parallel" "kvm"];
          }
        ];
      };
      users = lib.mkIf cfg.isBuilder {
        groups.remotebuild = {};
        users.remotebuild = {
          isSystemUser = true;
          group = "remotebuild";
          useDefaultShell = true;
        };
      };
    };
  };
}
