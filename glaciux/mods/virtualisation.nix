{
  config,
  pkgs,
  lib,
  ...
}: let
  cfg = config.glaciux.virtualisation;
in {
  options.glaciux.virtualisation.enable = lib.mkEnableOption "virtualisation programs";
  config = lib.mkIf cfg.enable {
    programs.virt-manager.enable = true;
    services = {
      qemuGuest.enable = true;
      spice-vdagentd.enable = true;
    };
    virtualisation = {
      libvirtd = {
        enable = true;
        qemu.vhostUserPackages = [pkgs.virtiofsd];
      };
      waydroid = {
        enable = true;
        package = pkgs.waydroid-nftables;
      };
    };
  };
}
