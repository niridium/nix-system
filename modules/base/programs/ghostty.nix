{
  flake.modules.homeManager.base = {
    config,
    lib,
    ...
  }: {
    programs.ghostty = {
      enable = true;
      settings = {
        theme = lib.mkIf config.programs.noctalia.enable "noctalia";
        font-family = "Iosevka Nerd Font Mono";
      };
    };
  };
}
