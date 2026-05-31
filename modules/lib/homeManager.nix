{inputs, ...}: {
  flake.modules.nixos.base = {
    imports = [
      inputs.home-manager.nixosModules.home-manager
    ];
    home-manager.users.nixy = {
      imports = [
        inputs.self.modules.homeManager.base
      ];
    };
  };
  flake.modules.nixos.gui = {
    imports = [
      inputs.home-manager.nixosModules.home-manager
    ];
    home-manager.users.nixy = {
      imports = [
        inputs.self.modules.homeManager.gui
      ];
    };
  };
}
