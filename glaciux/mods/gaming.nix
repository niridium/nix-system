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
    home-manager.sharedModules = [lutris];
    programs.gamemode.enable = true;
    environment.systemPackages = [pkgs.moonlight-qt];
    nixpkgs.config.allowUnfreePackages = ["steam" "steam-unwrapped"];
    programs.steam = {
      enable = true;
      extest.enable = true;
      extraCompatPackages = [pkgs.proton-ge-bin];
    };
    boot.kernelParams = lib.mkIf (cfg.server.virtualDisplay != "") ["amdgpu.virtual_display=${cfg.server.virtualDisplay},x"];
    services = lib.mkIf cfg.server.enable {
      udev.extraRules = ''KERNEL=="uinput", MODE="0660", GROUP="input", SYMLINK+="uinput" '';
      sunshine = {
        enable = true;
        autoStart = true;
        capSysAdmin = true;
        openFirewall = true;
      };
    };
  };
}
