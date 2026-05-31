{
  flake.modules.nixos.base = {pkgs, ...}: {
    fonts = {
      enableDefaultPackages = true;
      fontconfig.useEmbeddedBitmaps = true;
      packages = [pkgs.nerd-fonts.iosevka];
    };
  };
}
