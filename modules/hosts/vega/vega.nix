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
        #-----------
        vegaHardware
        vegaDisko
        base
        #-----------
        gui
        gaming
        laptop
        tailscale
        wireless
        consumer
        #---One mandatory user---
        nixy
        #------------------------
      ];
    };
    # homeConfigurations.vega = inputs.home-manager.lib.homeManagerConfiguration {
    #   modules = with inputs.self.modules.homeManager; [
    #   ];
    # };
  };
}
