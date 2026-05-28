{inputs, ...}: {
  home.stateVersion = "25.11";
  imports = [
    inputs.noctalia.homeModules.default

    ../core

    ../services/ollama.nix
  ];
}
