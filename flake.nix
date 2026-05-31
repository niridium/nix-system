{
  outputs = inputs: inputs.flake-parts.lib.mkFlake {inherit inputs;} (inputs.import-tree ./modules);

  inputs = {
    agenix.url = "github:ryantm/agenix";
    arkenfox.url = "github:dwarfmaster/arkenfox-nixos";
    direnv-instant.url = "github:Mic92/direnv-instant";
    flake-parts.url = "github:hercules-ci/flake-parts";
    hermes-agent.url = "github:NousResearch/hermes-agent";
    import-tree.url = "github:denful/import-tree";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    disko = {
      url = "github:nix-community/disko/latest";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
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
}
