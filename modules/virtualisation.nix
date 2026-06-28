{lib, ...}: {
  flake.modules.nixos.virtualisation = {
    config,
    pkgs,
    ...
  }: let
    cfg = config.v12n;
  in {
    options.v12n = {
      enable = lib.mkEnableOption "virtualisation programs and tools";
    };
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
      environment.systemPackages = [pkgs.nur.repos.ataraxiasjel.waydroid-script];
    };
  };
}
