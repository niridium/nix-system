{lib, ...}: {
  flake.modules = {
    nixos.gaming = {
      config,
      pkgs,
      ...
    }: let
      cfg = config.gaming;
    in {
      options.gaming = {
        enable = lib.mkEnableOption "gaming launchers and tools";
      };
      config = lib.mkIf cfg.enable {
        programs.steam = {
          enable = true;
          extest.enable = true;
          extraCompatPackages = [
            pkgs.proton-ge-bin
          ];
        };
      };
    };
    homeManager.gaming = {pkgs, ...}: {
      programs.lutris.enable = true;
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
