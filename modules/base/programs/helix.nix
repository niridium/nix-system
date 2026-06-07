{
  flake.modules.homeManager.base = {
    programs.helix = {
      enable = true;
      defaultEditor = false;
      settings = {
        theme = "noctalia";
      };
    };
  };
}
