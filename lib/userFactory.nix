{
  config,
  homeManager,
  user,
  lib,
  ...
}: {
  options.glaciux.users.${user}.enable = lib.mkEnableOption "${user} user";
  config = lib.mkIf config.glaciux.users.${user}.enable {
    home-manager.users.${user} = homeManager;
    users.users = builtins.listToAttrs (map (user:
      lib.nameValuePair user {
        isNormalUser = true;
        extraGroups =
          ["wheel" "networkmanager"]
          ++ lib.optional config.hardware.i2c.enable "i2c"
          ++ lib.optional config.virtualisation.libvirtd.enable "libvirtd";
      })
    [user]);
  };
}
