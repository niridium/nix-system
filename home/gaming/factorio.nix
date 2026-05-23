{pkgs, ...}: {
  home = {
    packages = [
      pkgs.factorio-space-age
    ];
    extraDependencies = [
      pkgs.factorio-space-age.src
    ];
  };
}
