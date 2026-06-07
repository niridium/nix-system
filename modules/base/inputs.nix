{inputs, ...}: {
  flake-file.inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    agenix.url = "github:ryantm/agenix";
    direnv-instant.url = "github:Mic92/direnv-instant";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    noctalia = {
      url = "github:noctalia-dev/noctalia-shell/v5";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  flake.modules = {
    nixos.base = with inputs; {
      imports = [
        nix-index-database.nixosModules.default
        home-manager.nixosModules.home-manager
        inputs.disko.nixosModules.disko
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
