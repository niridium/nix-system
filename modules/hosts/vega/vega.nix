{
  inputs,
  lib,
  ...
}: {
  flake = {
    #---Setup hostname---------------------
    modules = lib.mkMerge [
      (inputs.self.factory.hostname "vega")
      # (inputs.self.factory.swapspace "8")
    ];
    #--------------------------------------
    nixosConfigurations.vega = inputs.nixpkgs.lib.nixosSystem {
      modules = with inputs.self.modules.nixos; [
        #---Core------------------
        vegaNetwork #From Factory
        vegaHardware
        vegaDisko
        base
        #---One mandatory user----
        nixy
        #-------------------------
        gui
        laptop
        gaming

        tailscale
        wireless
        consumer
        {
          home-manager.users.nixy = {pkgs, ...}: {
            imports = with inputs.self.modules.homeManager; [
              browser
              zedEditor
              beets
              gaming
            ];
            home.packages = [
              pkgs.handbrake
              pkgs.immich-cli
            ];
          };
        }
      ];
    };
  };
}
