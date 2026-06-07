{self, ...}: {
  config.flake.factory.userBase = {username}: {
    nixos."${username}Base" = {
      lib,
      config,
      ...
    }: {
      users.users.${username} = {
        isNormalUser = true;
        extraGroups = ["wheel" "networkmanager"] ++ lib.optional config.hardware.i2c.enable "i2c";
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
