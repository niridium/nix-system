{
  flake.aspects.nh = {
    homeManager.programs.nh = {
      enable = true;
      osFlake = /home/callisto/nix-system;
      clean = {
        enable = true;
        dates = "weekly";
        extraArgs = " --keep 5 --keep-since 5d --optimise ";
      };
    };
  };
}
