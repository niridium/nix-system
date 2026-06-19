{
  flake.modules = {
    nixos.nixConfig = {pkgs, ...}: {
      nixpkgs.config.allowUnfree = true;
      nix = {
        settings = {
          trusted-users = ["nixy"];
          experimental-features = [
            "nix-command"
            "flakes"
          ];
        };
        extraOptions = ''
          warn-dirty = false
        '';
      };
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
