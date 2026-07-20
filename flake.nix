# DO-NOT-EDIT. This file was auto-generated using github:vic/flake-file.
# Use `nix run .#write-flake` to regenerate it.
{
  outputs = inputs: inputs.flake-parts.lib.mkFlake { inherit inputs; } (inputs.import-tree ./modules);

  inputs = {
    direnv-instant.url = "github:Mic92/direnv-instant";
    disko.url = "github:nix-community/disko/latest";
    firefox.url = "github:nix-community/flake-firefox-nightly";
    firefox-csshacks = {
      url = "github:MrOtherGuy/firefox-csshacks";
      flake = false;
    };
    flake-aspects.url = "github:vic/flake-aspects";
    flake-file.url = "github:vic/flake-file";
    flake-parts.url = "github:hercules-ci/flake-parts";
    helium.url = "github:penal-colony/helium-nix";
    home-manager.url = "github:nix-community/home-manager";
    import-tree.url = "github:vic/import-tree";
    niri.url = "github:niri-wm/niri";
    nix-auto-follow = {
      url = "github:fzakaria/nix-auto-follow";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-index-database.url = "github:nix-community/nix-index-database";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    noctalia.url = "github:noctalia-dev/noctalia/v5.0.0-beta.3";
    nur.url = "github:nix-community/NUR";
  };
}
