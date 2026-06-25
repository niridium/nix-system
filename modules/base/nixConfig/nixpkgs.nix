{inputs, ...}: {
  flake-file.inputs = {
    helium = {
      url = "github:penal-colony/helium-nix";
      # Helium is using packages from cache
    };
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  flake.modules.nixos.nixConfig = {
    nixpkgs = {
      config.allowUnfree = true;
      overlays = with inputs; [
        helium.overlays.default
        nur.overlays.default
      ];
    };
  };
}
