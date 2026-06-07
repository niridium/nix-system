{
  flake.modules.nixos.nixConfig = {
    nix.settings = {
      substituters = ["https://helium-nix.cachix.org"];
      trusted-public-keys = ["helium-nix.cachix.org-1:a8YPjt9O4GPyX0u3gjg/aWpb14teU9aRiSG/MOaSFgw="];
    };
  };
}
