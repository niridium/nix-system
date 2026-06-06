{inputs, ...}: {
  flake.modules.homeManager.gui = {
    imports = with inputs; [niri.homeModules.niri];
  };
}
