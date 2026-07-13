{
  flake.aspects.nixLd = {
    nixos = {pkgs, ...}: {
      programs.nix-ld = {
        enable = true;
        libraries = with pkgs; [
          SDL2
          libGL
          libGLU
          libx11
          libxxf86vm
          libxrandr
          libxi
          openal
          glibc_multi
          libcap
        ];
      };
    };
  };
}
