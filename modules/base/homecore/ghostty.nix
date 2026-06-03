{
  flake.modules.homeManager.base = {
    config,
    lib,
    inputs,
    ...
  }: {
    imports = [
      inputs.noctalia.homeModules.default
    ];
    programs.ghostty = {
      enable = true;
      settings = {
        theme = lib.mkIf config.programs.noctalia.enable "noctalia";
        font-family = "Iosevka Nerd Font Mono";
      };
    };
  };
}
