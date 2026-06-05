{
  inputs,
  lib,
  ...
}: {
  flake = {
    #---Setup hostname-----------------------
    modules = lib.mkMerge [
      (inputs.self.factory.hostname "licher")
    ];
    #----------------------------------------
    nixosConfigurations.licher = inputs.nixpkgs.lib.nixosSystem {
      modules = with inputs.self.modules.nixos; [
        #---Core-------------------
        licherNetwork #From Factory
        licherHardware
        licherDisko
        base
        #---One mandatory user-----
        nixyServer
        #---Services---------------
        actualBudget
        dawarich
        immich
        navidrome
        openssh
        #--------------------------
        swRaid
        tailscale
        builder
        headlessGraphics
      ];
    };
  };
}
