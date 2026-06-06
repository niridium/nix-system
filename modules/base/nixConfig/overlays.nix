{inputs, ...}: {
  flake-file.inputs.helium-nix.url = "github:penal-colony/helium-nix";
  flake.modules.nixos.nixConfig = {
    nixpkgs.overlays = [inputs.helium-nix.overlays.default];
  };
}
