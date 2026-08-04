{
  config,
  pkgs,
  lib,
  ...
}: {
  options.glaciux.nix-ld.enable = lib.mkEnableOption "nix-ld" // {default = true;};
  config = lib.mkIf config.glaciux.nix-ld.enable {
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
