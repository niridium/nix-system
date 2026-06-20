{inputs, ...}: {
  flake-file.inputs = {
    niri-options = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  flake.modules.homeManager.gui = {
    imports = with inputs; [niri-options.homeModules.niri];
  };
}
