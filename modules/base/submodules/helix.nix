{
  flake.aspects.helix = {
    homeManager.programs.helix = {
      enable = true;
      defaultEditor = false;
      settings = {
        theme = "noctalia";
      };
    };
  };
}
