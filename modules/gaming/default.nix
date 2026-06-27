{
  flake.modules = {
    nixos.gaming = {
      programs.steam = {
        enable = true;
      };
    };
    homeManager.gaming = {pkgs, ...}: {
      home.packages = [pkgs.moonlight-qt];
    };
  };
}
