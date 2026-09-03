{
  outputs = inputs @ {nixpkgs, ...}: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {inherit system;};
  in {nixosConfigurations = import ./os.nix {inherit inputs pkgs;};};

  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-26.05";
    };
    noctalia-greeter = {
      url = "github:noctalia-dev/noctalia-greeter/v1.2.1";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    noctalia = {
      url = "github:noctalia-dev/noctalia/v5.0.0-beta.9";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # umbriel = {
    #   url = "git+https://github.com/noctalia-dev/umbriel";
    #   # inputs.nixpkgs.follows = "nixpkgs";
    # };
    # xdg-desktop-portal-umbriel = {
    #   url = "github:noctalia-dev/xdg-desktop-portal-umbriel";
    #   # inputs.nixpkgs.follows = "nixpkgs";
    # };
    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    firefox-csshacks = {
      url = "github:MrOtherGuy/firefox-csshacks";
      flake = false;
    };
  };
}
