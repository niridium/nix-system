{
  homeManager,
  config,
  user,
  lib,
  ...
}: let
  cfg = config.glaciux.users.${user};
in {
  options.glaciux.users.${user} = {
    enable = lib.mkEnableOption "${user} user";
    linger = lib.mkEnableOption "lingering";
  };
  config = lib.mkIf cfg.enable {
    home-manager.users.${user} = homeManager;
    users.users.${user} = {
      inherit (cfg) linger;
      isNormalUser = true;
      extraGroups =
        ["wheel" "networkmanager"]
        ++ lib.optional config.hardware.i2c.enable "i2c"
        ++ lib.optionals config.virtualisation.libvirtd.enable ["libvirtd" "kvm"]
        ++ lib.optional config.programs.gamemode.enable "gamemode"
        ++ lib.optional config.glaciux.fancontrol.enable "fan_ctl";
    };
    services.displayManager.noctalia-greeter.passwordlessSyncUsers = lib.optional config.services.displayManager.noctalia-greeter.enable "${user}";
  };
}
