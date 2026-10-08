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
    environment.systemPackages = with pkgs; [pods];
    programs.virt-manager.enable = true;
    services = {
      qemuGuest.enable = true;
      spice-vdagentd.enable = true;
    };
    virtualisation = {
      libvirtd = {
        enable = true;
        qemu = {
          swtpm.enable = true;
          vhostUserPackages = [pkgs.virtiofsd];
        };
      };
      waydroid = {
        enable = true;
        package = pkgs.waydroid-nftables;
      };
      docker = {
        rootless = {
          enable = true;
          setSocketVariable = true;
        };
        storageDriver = "btrfs";
      };
      podman = {
        enable = true;
        dockerCompat = true;
        defaultNetwork.settings.dns_enabled = true;
      };
    };
  };
}
