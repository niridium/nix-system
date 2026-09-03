{
  outputs = inputs @ {nixpkgs, ...}: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {inherit system;};
  in {nixosConfigurations = import ./os.nix {inherit inputs pkgs;};};

  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-unstable";
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
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    firefox-csshacks = {
      url = "github:MrOtherGuy/firefox-csshacks";
      flake = false;
    };
  };
}
