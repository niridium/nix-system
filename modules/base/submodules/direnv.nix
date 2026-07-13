{inputs, ...}: {
  flake-file.inputs.direnv-instant.url = "github:Mic92/direnv-instant";
  flake.aspects.direnv = {
    homeManager = {
      imports = [inputs.direnv-instant.homeModules.direnv-instant];
      programs = {
        direnv-instant.enable = true;
        direnv = {
          enable = true;
          config = {
            hide_env_diff = true;
          };
          enableBashIntegration = false;
          nix-direnv.enable = true;
        };
      };
    };
  };
}
