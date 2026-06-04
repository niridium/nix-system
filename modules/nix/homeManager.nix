{inputs, ...}: {
  flake.modules = {
    nixos.base = {
      imports = [
        inputs.home-manager.nixosModules.home-manager
      ];
      home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
        extraSpecialArgs = {inherit inputs;};
        backupFileExtension = "bkp";
      };
      programs.dconf.enable = true; # Home Manager fails to start if it's disabled
    };
    homeManager.base = {
      programs.home-manager.enable = true;
      home.stateVersion = "25.11";
    };
  };
}
