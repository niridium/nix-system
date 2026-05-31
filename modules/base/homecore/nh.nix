{
  flake.modules.homeManager.base = {
    programs.nh = {
      enable = true;
      osFlake = "~/nix-system/flake.nix";
      clean = {
        enable = true;
        dates = "weekly";
        extraArgs = " --keep 5 --keep-since 5d --optimise ";
      };
    };
  };
}
