{
  config,
  inputs,
  pkgs,
  lib,
  ...
}: {
  imports = [inputs.umbriel.homeModules.default];
  options.glaciux.umbriel.enable = lib.mkEnableOption "umbriel window manager";
  config = lib.mkIf config.glaciux.umbriel.enable {
    home.packages = [pkgs.tomlplusplus];
    programs.umbriel = {
      enable = true;
      settings = ./config.toml;
    };
    xdg.portal = let
      portal = inputs.xdg-desktop-portal-umbriel.packages.${pkgs.stdenv.hostPlatform.system}.default;
    in {
      enable = true;
      configPackages = [portal];
      extraPortals = [portal];
    };
  };
}
