{
  config,
  pkgs,
  lib,
  ...
}: {
  options.glaciux.ollama.enable = lib.mkEnableOption "ollama service";
  config = lib.mkIf config.glaciux.ollama.enable {
    services.ollama = {
      enable = true;
      package = pkgs.ollama-vulkan;
      host = "0.0.0.0";
      loadModels = ["qwen3.5:9b"];
    };
  };
}
