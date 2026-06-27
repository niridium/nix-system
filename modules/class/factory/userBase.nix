{self, ...}: {
  config.flake.factory.userBase = {username}: {
    nixos."${username}Base" = {
      lib,
      config,
      ...
    }: {
      imports = [self.modules.nixos.base];
      users.users.${username} = {
        isNormalUser = true;
        extraGroups =
          ["wheel" "networkmanager"]
          ++ lib.optional config.hardware.i2c.enable "i2c"
          ++ lib.optional config.virtualisation.libvirtd.enable "libvirtd"
          ++ lib.optionals config.services.sunshine.enable ["input" "video"];
      };
      services.greetd.settings.default_session.user = lib.mkIf config.services.greetd.enable "${username}";
      home-manager.users."${username}" = {
        imports = [
          self.modules.homeManager.base
          self.modules.homeManager."${username}Base"
        ];
      };
    };
    homeManager."${username}Base" = {
      home.username = "${username}";
    };
  };
}
