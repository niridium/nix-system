{lib, ...}: {
  flake.aspects.nixBuilds = {
    isBuilder ? false, # "Set this host as remote builder"
    remoteHost ? "", # "Hostname of the remote builder"
  }: {
    nixos = {pkgs, ...}: {
      nix = {
        distributedBuilds = true;
        settings.builders-use-substitutes = true;
        nrBuildUsers = 64;
        settings.trusted-users = ["hyperion"];
        buildMachines = lib.mkIf (remoteHost != "") [
          {
            hostName = remoteHost;
            sshUser = "hyperion";
            system = pkgs.stdenv.hostPlatform.system;
            supportedFeatures = ["nixos-test" "big-parallel" "kvm"];
          }
        ];
      };
      users = lib.mkIf isBuilder {
        groups.remotebuild = {};
        users.hyperion = {
          isSystemUser = true;
          group = "remotebuild";
          useDefaultShell = true;
        };
      };
    };
  };
}
