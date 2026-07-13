{
  flake.aspects.nixConf = {
    nixos.nix = {
      settings = {
        trusted-users = ["nixy" "callisto"];
        experimental-features = [
          "nix-command"
          "flakes"
        ];
      };
      extraOptions = ''
        warn-dirty = false
        max-call-depth = 100000
      '';
    };
  };
}
