{
  flake.aspects.appimage = {
    homeManager = {pkgs, ...}: {
      home.packages = [pkgs.gearlever];
    };
    nixos.programs.appimage = {
      enable = true;
      binfmt = true;
    };
  };
}
