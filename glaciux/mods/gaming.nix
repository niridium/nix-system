{
  config,
  pkgs,
  lib,
  ...
}: let
  cfg = config.glaciux.gaming;
  lutris = {
    programs.lutris = {
      enable = true;
      steamPackage = pkgs.steam;
      protonPackages = [pkgs.proton-ge-bin];
      extraPackages = with pkgs; [mangohud winetricks];
    };
  };
  steam = {
    programs.steam = {
      enable = true;
      extest.enable = true;
      extraCompatPackages = [pkgs.proton-ge-bin];
    };
  };
  sunshine = lib.optionalAttrs cfg.server.enable {
    udev.extraRules = ''
      KERNEL=="uinput", MODE="0660", GROUP="input", SYMLINK+="uinput"
    '';
    sunshine = {
      enable = true;
      autoStart = true;
      capSysAdmin = true;
      openFirewall = true;
    };
  };
in {
  options.glaciux.gaming = {
    enable = lib.mkEnableOption "gaming programs";
    server = {
      enable = lib.mkEnableOption "gaming server";
      virtualDisplay = lib.mkOption {
        type = lib.types.str;
        default = "";
      };
    };
  };
  config = lib.mkIf cfg.enable {
    home-manager.sharedModules = [lutris steam sunshine];
    programs.gamemode.enable = true;
    environment.systemPackages = [pkgs.moonlight-qt];
    boot.kernelParams = lib.mkIf (cfg.server.virtualDisplay != "") ["amdgpu.virtual_display=${cfg.server.virtualDisplay},x"];
    services = {
      udev.extraRules = ''
        ACTION=="add|change", ATTRS{name}=="Sony Interactive Entertainment DualSense Wireless Controller Touchpad", ENV{LIBINPUT_IGNORE_DEVICE}="1"
        ACTION=="add|change", ATTRS{name}=="DualSense Wireless Controller Touchpad", ENV{LIBINPUT_IGNORE_DEVICE}="1"
      '';
    };
  };
}
