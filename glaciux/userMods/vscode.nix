{
  config,
  pkgs,
  lib,
  ...
}: {
  options.glaciux.vscode.enable = lib.mkEnableOption "visual studio code";
  config = lib.mkIf config.glaciux.vscode.enable {
    programs.vscode = {
      enable = true;
      package = pkgs.vscode-fhs;
    };
  };
}
