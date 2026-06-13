{
  flake.modules.nixos.nixConfig = {
    nix.settings = {
      substituters = [
        "https://helium-nix.cachix.org"
        "https://noctalia.cachix.org"
      ];
      trusted-public-keys = [
        "helium-nix.cachix.org-1:a8YPjt9O4GPyX0u3gjg/aWpb14teU9aRiSG/MOaSFgw="
        "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4="
      ];
    };
  };
}
