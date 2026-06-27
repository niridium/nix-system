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
        #---One mandatory user-----
        nixyGui
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

        gaming
        #---Config-------------
        {
          gamingServer = {
            enable = true;
            virtualDisplay = "0000:0c:00.0";
          };
        }
      ];
    };
  };
}
