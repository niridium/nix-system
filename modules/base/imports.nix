{inputs, ...}: {
  imports = with inputs; [
    flake-parts.flakeModules.modules
  ];
  flake.modules = {
    nixos.base = with inputs; {
      imports = [
        nix-index-database.nixosModules.default
        home-manager.nixosModules.home-manager
        self.modules.nixos.nixConfig
      ];
    };
    homeManager.base = {
      imports = with inputs; [
        agenix.homeManagerModules.default
        direnv-instant.homeModules.direnv-instant
        noctalia.homeModules.default
      ];
    };
  };
}
