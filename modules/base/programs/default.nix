{
  flake.modules.homeManager.base = {
    programs = {
      starship.enable = true;
      zoxide.enable = true;
      fzf.enable = true;
      fastfetch.enable = true;
    };
  };
}
