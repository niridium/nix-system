{
  flake.modules.homeManager.heliumBrowser = {pkgs, ...}: {
    home.packages = with pkgs; [
      helium
    ];
  };
}
