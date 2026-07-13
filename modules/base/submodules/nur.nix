{inputs, ...}: {
  flake-file.inputs.nur.url = "github:nix-community/NUR";
  flake.aspects.nur = {
    nixos.nixpkgs = {
      config.allowUnfree = true;
      overlays = [inputs.nur.overlays.default];
    };
  };
}
