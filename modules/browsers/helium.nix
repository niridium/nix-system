{
  flake.modules.homeManager.heliumBrowser = {pkgs, ...}: {
    home.packages = [pkgs.helium];
  };
}
