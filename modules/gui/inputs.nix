{inputs, ...}: {
  flake-file.inputs = {
    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  flake.modules.homeManager.gui = {
    imports = with inputs; [niri.homeModules.niri];
  };
}
