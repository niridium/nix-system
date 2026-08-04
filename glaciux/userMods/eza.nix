{
  config,
  lib,
  ...
}: {
  options.glaciux.eza.enable = lib.mkEnableOption "eza" // {default = true;};
  config = lib.mkIf config.glaciux.eza.enable {
    home.shellAliases = {ls = "eza";};
    programs.eza = {
      enable = true;
      icons = "auto";
      git = true;
      colors = "auto";
      extraOptions = [
        "--long"
        "--binary"
        "--mounts"
        "--time-style=long-iso"
        "--hyperlink"
      ];
    };
  };
}
