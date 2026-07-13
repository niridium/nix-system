{
  flake.aspects.virtualisation = {
    nixos = {pkgs, ...}: {
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
