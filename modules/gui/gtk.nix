{
  flake.modules.homeManager.gui = {pkgs, ...}: {
    # home.packages = [pkgs.nwg-look];
    gtk = {
      enable = true;
      gtk4.theme = null;
      theme = {
        package = pkgs.adw-gtk3;
        name = "adw-gtk3";
      };
      font = {
        name = "Iosevka Nerd Font";
        size = 11;
      };
      # cursorTheme = {
      #   package = pkgs.catppuccin-cursors.mochaDark;
      #   name = "catpuccin-mocha-dark-cursors";
      # };
      iconTheme = {
        package = pkgs.papirus-icon-theme;
        name = "Papirus";
      };
    };
  };
}
