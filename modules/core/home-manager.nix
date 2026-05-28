{
  inputs,
  username,
  hostname,
  ...
}: {
  imports = [inputs.home-manager.nixosModules.home-manager];
  home-manager = {
    users.${username} = ../../home/hosts/${hostname}.nix;
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = {inherit inputs;};
    backupFileExtension = "bkp";
  };
}
