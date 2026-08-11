{
  homeManager,
  config,
  user,
  lib,
  ...
}: {
  options.glaciux.users.${user}.enable = lib.mkEnableOption "${user} user";
  config = lib.mkIf config.glaciux.users.${user}.enable {
    home-manager.users.${user} = homeManager;
    users.users.${user} = {
      isNormalUser = true;
      extraGroups =
        ["wheel" "networkmanager"]
        ++ lib.optional config.hardware.i2c.enable "i2c"
        ++ lib.optional config.virtualisation.libvirtd.enable "libvirtd"
        ++ lib.optional config.programs.gamemode.enable "gamemode";
    };
  };
}
