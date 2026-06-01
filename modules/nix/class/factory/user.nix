{self, ...}: {
  config.flake.factory.user = username: {
    nixos."${username}" = {
      lib,
      config,
      ...
    }: {
      users.users.${username} = {
        isNormalUser = true;
        extraGroups = ["wheel" "networkManager"] ++ lib.optional config.hardware.i2c.enable "i2c";
      };
      services.greetd.settings.default_session.user = lib.mkIf config.services.greetd.enable "${username}";
      home-manager.users."${username}" = {
        imports = [
          self.modules.homeManager."${username}"
        ];
      };
    };
    homeManager."${username}" = {
      home.username = "${username}";
    };
  };
}
