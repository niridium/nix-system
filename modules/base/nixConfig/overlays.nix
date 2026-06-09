{inputs, ...}: {
  flake-file.inputs = {
    helium.url = "github:penal-colony/helium-nix";
  };
  flake.modules.nixos.nixConfig = {
    nixpkgs.overlays = [inputs.helium.overlays.default];
  };
}
