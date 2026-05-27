{
  inputs = {
    agenix.url = "github:ryantm/agenix";
    arkenfox.url = "github:dwarfmaster/arkenfox-nixos";
    direnv-instant.url = "github:Mic92/direnv-instant";
    hermes-agent.url = "github:NousResearch/hermes-agent";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    disko = {
      url = "github:nix-community/disko/latest";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager/";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    impermanence = {
      url = "github:nix-community/impermanence";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    noctalia = {
      url = "github:noctalia-dev/noctalia-shell/v4.7.7";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ {nixpkgs, ...}: let
    username = "nixy";
  in {
    nixosConfigurations = {
      vega = let
        specialArgs = {
          inherit inputs username;
          hostname = "vega";
          swapspace = 8;
          systemdisk = "/dev/nvme0n1";
        };
      in
        nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = specialArgs;
          modules = [
            ./hosts/vega
          ];
        };
      licher = let
        specialArgs = {
          inherit inputs username;
          hostname = "licher";
          swapspace = 8;
          systemdisk = "/dev/sdc";
          serverdirectory = "/storage";
          virtual_display = "amdgpu.virtual_display=0000:0c:00.0,1";
          interface = "enp9s0";
        };
      in
        nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = specialArgs;
          modules = [
            ./hosts/licher
          ];
        };
    };
  };
}
