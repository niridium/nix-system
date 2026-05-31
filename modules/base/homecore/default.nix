{
  flake.modules.homeManager.base = {
    home = {
      username = "nixy";
      homeDirectory = "/home/nixy";
      stateVersion = "25.11";
    };
    xdg.autostart.enable = true;
    programs = {
      home-manager.enable = true;
      starship.enable = true;
      zoxide.enable = true;
      fzf.enable = true;
      fastfetch.enable = true;
    };
  };
}
