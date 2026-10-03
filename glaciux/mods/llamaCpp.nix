{
  config,
  pkgs,
  lib,
  ...
}: let
  cfg = config.glaciux.llamaCpp;
in {
  options.glaciux.llamaCpp = {
    enable = lib.mkEnableOption "llama.cpp HTTP server";
  };
  config = lib.mkIf cfg.enable {
    services.llama-cpp = {
      enable = true;
      package = pkgs.llama-cpp-vulkan;
      settings = {
        models-dir = "~/models";
        no-models-autoload = true;
        jinja = true;
        host = "0.0.0.0";
        port = 12400;
        gpu-layers = 999;
        c = 64000;
      };
    };
  };
}
