{inputs, ...}: {
  imports = [
    inputs.disko.nixosModules.disko
    ./swap.nix
  ];
}
