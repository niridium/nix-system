{lib, ...}: {
  flake.modules.nixos.gaming = {config, ...}: let
    cfg = config.gamingServer;
  in {
    options.gamingServer = {
      enable = lib.mkEnableOption "Enable remote gaming server";
      virtualDisplay = lib.mkOption {
        type = lib.types.str;
        default = "";
      };
    };
    config = lib.mkIf cfg.enable {
      boot.kernelParams = lib.mkIf (cfg.virtualDisplay != "") ["virtual_display=${cfg.virtualDisplay},x"];
      services = {
        udev.extraRules = ''KERNEL=="uinput", MODE="0660", GROUP="input", SYMLINK+="uinput" '';
        sunshine = {
          enable = true;
          autoStart = true;
          capSysAdmin = true;
          openFirewall = true;
        };
      };
    };
  };
}
