{
  flake.modules.homeManager.base = {
    programs.bash = {
      enable = true;
      shellAliases = {
        nixos-switch = "nh os switch --max-jobs 8 ~/nix-system/";
        nixos-build = "nh os build --max-jobs 8 ~/nix-system/";
        nixos-build-update = "nh os build --no-update-lock-file --max-jobs 8 --update ~/nix-system/";
        ls = "eza";
      };
      bashrcExtra = ''
        # Check package version from store
        function pkgv {
          realpath $(which $1)
        }
      '';
    };
  };
}
