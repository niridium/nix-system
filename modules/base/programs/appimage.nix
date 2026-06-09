{
  flake.modules = {
    homeManager.base = {pkgs, ...}: {
      home.packages = [pkgs.gearlever];
    };
    nixos.base = {
      programs.appimage = {
        enable = true;
        binfmt = true;
      };
    };
  };
}
