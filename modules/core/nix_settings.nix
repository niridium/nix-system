{
  nixpkgs.config.allowUnfree = true;
  nix = {
    settings = {
      trusted-users = ["nixy"];
      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };
  };
}
