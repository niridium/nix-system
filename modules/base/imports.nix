{inputs, ...}: {
  flake.modules = {
    nixos.base = with inputs; {
      imports = [
        nix-index-database.nixosModules.default
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
