{
  inputs,
  self,
  ...
}: {
  flake = {
    nixosConfigurations.licher = inputs.nixpkgs.lib.nixosSystem {
      modules = with self.modules.nixos;
      with self.factory;
      with self.lib; [
        #---Core-------------------
        (fs.btrfs {systemDevice = "/dev/sdc";})
        (swap {swapAmount = 8;})
        (network {hostname = "licher";})
        (hardware {
          cpu = "amd";
          bootModules = [
            "ahci"
            "xhci_pci"
            "sd_mod"
            "usbhid"
          ];
        })
        (mount {
          device = "/dev/md127";
          label = "storage";
          mountPoint = "/storage";
          format = "btrfs";
        })
        # licherHardware
        # base
        #---One mandatory user-----
        nixyServer
        #---Services---------------
        actualBudget
        dawarich
        immich
        navidrome
        openssh
        #--------------------------
        swRaid
        tailscale
        builder
        headlessGraphics
      ];
    };
  };
}
