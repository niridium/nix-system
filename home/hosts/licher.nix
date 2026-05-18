{inputs, ...}: {
  home.stateVersion = "25.11";
  imports = [
    ../core
    ../tui
    ../services/ollama.nix
    inputs.noctalia.homeModules.default
  ];
}
