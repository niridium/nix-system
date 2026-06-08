# {inputs, ...}:
{
  # flake-file.inputs = {
  #   nixpkgs-chromium-148_0_7778_167.url = "github:nixos/nixpkgs/eef00dfd8a712b34af845f9350bac681b1228bd1";
  #   helium = {
  #     url = "github:penal-colony/helium-nix/73229f6c6a7a1fdba3d358a062e33021bb1907e6";
  #     inputs.nixpkgs.follows = "nixpkgs-chromium-148_0_7778_167";
  #   };
  #   # helium.url = "github:penal-colony/helium-nix";
  # };
  # flake.modules.nixos.nixConfig = {
  #   nixpkgs.overlays = [inputs.helium.overlays.default];
  # };
}
