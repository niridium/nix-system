{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.glaciux.neovim;
in {
  options.glaciux.neovim.enable = lib.mkEnableOption "neovim editor configuration";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      ripgrep
      jdt-language-server
      maven
      tinymist
      marksman
      nixd
      pandoc
    ];

    programs.neovim = {
      enable = true;
      plugins = with pkgs.vimPlugins; [
        fzf-lua
        gitsigns-nvim
        nvim-autopairs
        base16-nvim
        mini-nvim
        render-markdown-nvim
      ];
      initLua = lib.readFile ./init.lua;
      withRuby = false;
      withPython3 = false;
    };
  };
}
