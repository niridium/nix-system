{inputs, ...}: {
  flake-file.inputs = {
    niri = {
      url = "github:niri-wm/niri";
    };
  };
  flake.aspects.niri = {
    nixos = {
      nixpkgs.overlays = [
        inputs.niri.overlays.default
      ];
    };
    homeManager = {pkgs, ...}: {
      home.packages = [pkgs.niri pkgs.kdlfmt];
      xdg = {
        configFile."niri/config.kdl".source = ./config.kdl;
        portal = {
          enable = true;
          configPackages = [pkgs.niri];
          extraPortals = [pkgs.xdg-desktop-portal-gnome];
        };
      };
    };
  };
}
