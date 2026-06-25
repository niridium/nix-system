{inputs, ...}: {
  flake-file.inputs = {
    helium.url = "github:penal-colony/helium-nix";
  };
  flake.modules.nixos.nixConfig = {
    nixpkgs = {
      config.allowUnfree = true;
      overlays = [inputs.helium.overlays.default];
    };
  };
}
