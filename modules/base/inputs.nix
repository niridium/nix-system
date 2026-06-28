{
  inputs,
  self,
  ...
}: let
  nx = self.modules.nixos;
in {
  flake-file.inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    direnv-instant = {
      url = "github:Mic92/direnv-instant";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    noctalia = {
      url = "github:noctalia-dev/noctalia";
      # Noctalia is using packages from cache
    };
  };
  flake.modules = {
    nixos.base = {
      imports = [
        inputs.nix-index-database.nixosModules.default
        inputs.home-manager.nixosModules.home-manager
        inputs.disko.nixosModules.disko
        #---My modules---
        nx.nixConfig
        nx.tailscale
        #---With options
        nx.gaming
        nx.hardware
        nx.nixBuilds
        nx.virtualisation
      ];
    };
    homeManager.base = {
      imports = [
        inputs.agenix.homeManagerModules.default
        inputs.direnv-instant.homeModules.direnv-instant
        inputs.noctalia.homeModules.default
      ];
    };
  };
}
