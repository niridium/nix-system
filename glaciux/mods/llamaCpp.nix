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
      package = pkgs.llama-cpp-cuda;
      settings = {
        models-dir = "/storage/models";
        no-models-autoload = true;
        jinja = true;
        host = "127.0.0.1";
        port = 12400;
        c = 100000;
        n-cpu-moe = 28;
        load-mode = "none";
        flash-attn = "on";
      };
    };
  };
}
