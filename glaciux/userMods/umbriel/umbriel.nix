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
      package = pkgs.umbriel;
      settings = ./config.toml;
    };
    xdg.portal = let
      portal = pkgs.xdg-desktop-portal-umbriel;
    in {
      enable = true;
      configPackages = [portal];
      extraPortals = [portal];
    };
  };
}
