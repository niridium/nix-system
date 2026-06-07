{self, ...}: {
  flake.modules.nixos.nixyServer = {
    imports = with self.modules.nixos; [
      nixyBase
    ];
    home-manager.users.nixy = {
      imports = with self.modules.homeManager; [
        beets
        ollama
      ];
    };
  };
}
