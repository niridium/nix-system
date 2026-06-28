{self, ...}: {
  config.flake.factory.user = {username}: {
    nixos."${username}" = {
      config,
      pkgs,
      lib,
      ...
    }: let
      cfg = config.user."${username}";
      hm = self.modules.homeManager;
    in {
      imports = [
        self.modules.nixos.base
        self.modules.nixos.gui
      ];
      options.user."${username}" = {
        enable = lib.mkEnableOption "${username} user";
        isServer = lib.mkOption {
          type = lib.types.bool;
          default = false;
        };
        isGui = lib.mkOption {
          type = lib.types.bool;
          default = false;
        };
        isGaming = lib.mkOption {
          type = lib.types.bool;
          default = false;
        };
      };
      config = {
        users.users.${username} = {
          isNormalUser = true;
          extraGroups =
            ["wheel" "networkmanager"]
            ++ lib.optional config.hardware.i2c.enable "i2c"
            ++ lib.optional config.virtualisation.libvirtd.enable "libvirtd"
            ++ lib.optionals config.services.sunshine.enable ["input" "video"];
        };
        services.greetd.settings.default_session.user = lib.mkIf config.services.greetd.enable "${username}";
        #---Enable top level nixos options---
        gui.enable = lib.mkIf cfg.isGui true;
        gaming.enable = lib.mkIf cfg.isGaming true;
        #---Home Manager--------------------
        home-manager.users."${username}" = {
          home = {
            username = "${username}";
            packages = [
              pkgs.handbrake
              pkgs.immich-cli
            ];
          };
          imports =
            [
              hm.base
              hm.beets
            ]
            ++ lib.optionals cfg.isGui [
              hm.gui
              hm.firefoxBrowser
              hm.zedEditor
            ]
            ++ lib.optionals cfg.isGaming [
              hm.gaming
            ]
            ++ lib.optionals cfg.isServer [
              hm.ollama
            ];
        };
      };
    };
  };
}
