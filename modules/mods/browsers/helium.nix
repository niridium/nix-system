{inputs, ...}: {
  flake-file.inputs.helium.url = "github:penal-colony/helium-nix";
  flake.aspects.heliumBrowser = {
    nixos = {
      nixpkgs.overlays = [inputs.helium.overlays.default];
      nix.settings = {
        substituters = ["https://helium-nix.cachix.org"];
        trusted-public-keys = ["helium-nix.cachix.org-1:a8YPjt9O4GPyX0u3gjg/aWpb14teU9aRiSG/MOaSFgw="];
      };
    };
    homeManager = {pkgs, ...}: {home.packages = [pkgs.helium];};
  };
}
