{
  flake.aspects.ghostty = {
    homeManager.programs.ghostty = {
      enable = true;
      settings = {
        theme =
          # lib.mkIf config.programs.noctalia.enable
          "noctalia";
        font-family = "Iosevka Nerd Font Mono";
      };
    };
  };
}
