{
  flake.modules.nixos.virtManager = {pkgs, ...}: {
    virtualisation.libvirtd = {
      enable = true;
      qemu.vhostUserPackages = [pkgs.virtiofsd];
    };
    programs.virt-manager.enable = true;
    services.qemuGuest.enable = true;
    services.spice-vdagentd.enable = true;
  };
}
