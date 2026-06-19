{
  flake.modules.homeManager.base = {
    programs = {
      direnv = {
        enable = true;
        config = {
          hide_env_diff = true;
        };
        enableBashIntegration = false;
        nix-direnv.enable = true;
      };
      direnv-instant.enable = true;
    };
  };
}
