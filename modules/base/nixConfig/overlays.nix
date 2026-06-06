{inputs, ...}: {
  flake.modules.nixos.nixConfig = {
    nixpkgs.overlays = [inputs.helium-nix.overlays.default];
  };
}
