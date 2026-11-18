{
  config,
  pkgs,
  lib,
  ...
}: {
  options.glaciux.nixLd.enable = lib.mkEnableOption "nix-ld";
  config = lib.mkIf config.glaciux.nixLd.enable {
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
        extest
      ];
    };
  };
}
