{
  outputs = inputs @ {
    nixpkgs,
    nixpkgs-release,
    ...
  }: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {inherit system;};
    pkgs-release = import nixpkgs-release {inherit system;};
  in {nixosConfigurations = import ./os.nix {inherit inputs pkgs pkgs-release;};};

  inputs = {
    nixpkgs.url = "https://channels.nixos.org/nixos-unstable/nixexprs.tar.zst";
    nixpkgs-release.url = "https://channels.nixos.org/nixos-26.05/nixexprs.tar.zst";
    nix-index-database.url = "github:nix-community/nix-index-database";
    home-manager.url = "github:nix-community/home-manager";
    fluxr.url = "github:niridium/fluxr-backup";
    umbriel.url = "github:noctalia-dev/umbriel";
    firefox-csshacks = {
      url = "github:MrOtherGuy/firefox-csshacks";
      flake = false;
    };
  };
}
