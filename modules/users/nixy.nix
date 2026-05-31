{
  flake.modules.nixos.nixy = {
    lib,
    config,
    ...
  }: {
    users.users.nixy = lib.mkMerge [
      {
        isNormalUser = true;
        extraGroups = ["wheel" "networkManager"];
      }
      (lib.mkIf config.hardware.i2c.enable {extraGroups = ["i2c"];})
    ];
    services.greetd.settings.default_session.user = lib.mkIf config.services.greetd.enable "nixy";
  };
}
