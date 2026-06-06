{
  flake.modules.nixos.consumer = {pkgs, ...}: {
    nix = {
      distributedBuilds = true;
      settings.builders-use-substitutes = true;
      buildMachines = [
        {
          hostName = "licher";
          sshUser = "remotebuild";
          system = pkgs.stdenv.hostPlatform.system;
          supportedFeatures = ["nixos-test" "big-parallel" "kvm"];
        }
      ];
    };
  };
}
