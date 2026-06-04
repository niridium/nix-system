{
  flake.modules.homeManager.base = {pkgs, ...}: {
    # Devenv
    home.packages = [
      pkgs.devenv
    ];
    programs.bash.bashrcExtra = ''
      eval "$(devenv hook bash)"
    '';

    # Direnv
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
