{self, ...}: {
  flake.modules.nixos.nixyGui = {
    imports = with self.modules.nixos; [
      nixyBase
    ];
    home-manager.users.nixy = {pkgs, ...}: {
      imports = with self.modules.homeManager; [
        gui

        #---Extra Modules---
        browser
        zedEditor
        beets
        gaming
      ];
      home.packages = [
        pkgs.handbrake
        pkgs.immich-cli
      ];
    };
  };
}
