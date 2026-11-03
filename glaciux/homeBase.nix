{
  nix.settings = {
    substituters = ["https://cache.nixos.org"];
    trusted-public-keys = ["cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="];
  };
  home.stateVersion = "25.11";
  xdg.autostart.enable = true;
  programs = {
    home-manager.enable = true;
    bash.enable = true;
    starship.enable = true;
    zoxide.enable = true;
    fzf.enable = true;
    fastfetch.enable = true;
  };
}
