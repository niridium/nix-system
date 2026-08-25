{pkgs, ...}: {
  home = {
    packages = with pkgs; [grim slurp];
    sessionVariables = {GRIM_DEFAULT_DIR = "$HOME/Screenshots";};
  };
  xdg.desktopEntries = {
    screenshot = {
      name = "Screenshot";
      exec = "grim -g \"\\$(slurp)\"";
      terminal = true;
      type = "Application";
      categories = ["Utility"];
    };
  };
}
