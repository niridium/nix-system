{lib, ...}: {
  flake.modules = {
    nixos.gaming = {config, ...}: let
      cfg = config.gaming;
    in {
      options.gaming = {
        enable = lib.mkEnableOption "gaming launchers and tools";
      };
      config = lib.mkIf cfg.enable {
        programs.steam = {
          enable = true;
        };
      };
    };
    homeManager.gaming = {pkgs, ...}: {
      home = {
        packages = [
          pkgs.moonlight-qt
          # pkgs.factorio-space-age
        ];
        extraDependencies = [
          # pkgs.factorio-space-age.src
        ];
      };
    };
  };
}
