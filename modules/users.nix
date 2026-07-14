{
  inputs,
  lib,
  ...
}: {
  flake.aspects = {aspects, ...}: {
    users = {
      userNames ? [],
      hostName ? "",
    }: {
      includes = [
        aspects.base
        aspects.${hostName}._.globals
      ];
      nixos = {config, ...}: {
        home-manager.sharedModules = [inputs.self.modules.homeManager.base];
        home-manager.users = builtins.listToAttrs (lib.map (user:
          lib.nameValuePair user {
            imports = [inputs.self.modules.homeManager.${hostName}];
            home.username = user;
          })
        userNames);
        users.users = builtins.listToAttrs (lib.map (user:
          lib.nameValuePair user {
            isNormalUser = true;
            extraGroups =
              ["wheel" "networkmanager"]
              ++ lib.optional config.home-manager.users.${user}.home.pointerCursor.enable "i2c"
              ++ lib.optional config.virtualisation.libvirtd.enable "libvirtd";
          })
        userNames);
      };
    };
    # amalthea = {
    #   includes = with aspects; [
    #     gui
    #     (users {
    #       userName = "amalthea";
    #       gui = true;
    #     })
    #     gaming
    #     ollama
    #   ];
    #   homeManager = {};
    # };
  };
}
