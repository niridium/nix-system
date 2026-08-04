{
  inputs,
  pkgs,
  ...
}: let
  inherit (pkgs) lib;
  hosts = ["apollo" "cronos"];
  users = ["callisto" "amalthea"];
  timeZone = "Europe/Madrid";
  os = hostName: {
    ${hostName} = inputs.nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs timeZone users hostName;};
      modules = [
        ./hosts/${hostName}
        ./users
        ./glaciux/home.nix
        ./glaciux/nixos.nix
      ];
    };
  };
in
  lib.mergeAttrsList (map os hosts)
