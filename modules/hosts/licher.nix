{
  inputs,
  self,
  ...
}: let
  nx = self.modules.nixos;
  fcty = self.factory;
  lb = self.lib;
in {
  flake = {
    nixosConfigurations.licher = inputs.nixpkgs.lib.nixosSystem {
      modules = [
        #---Core-------------------
        (fcty.fs.btrfs {systemDevice = "/dev/sdc";})
        (fcty.swap {swapAmount = 8;})
        (fcty.network {hostname = "licher";})
        (fcty.hardware {
          cpu = "amd";
          bootModules = [
            "ahci"
            "xhci_pci"
            "sd_mod"
            "usbhid"
          ];
        })
        (lb.mount {
          device = "/dev/md127";
          label = "storage";
          mountPoint = "/storage";
          format = "btrfs";
        })
        #---One mandatory user-----
        nx.nixy
        #---Services---------------
        nx.actualBudget
        nx.dawarich
        nx.immich
        nx.navidrome
        nx.openssh
        #--------------------------
        nx.swRaid
        nx.headlessGraphics
        {
          user.nixy = {
            enable = true;
            isGui = true;
            isServer = true;
            isGaming = true;
          };
          gamingServer = {
            enable = true;
            virtualDisplay = "0000:0c:00.0";
          };
          nixBuilds = {
            enable = true;
            isBuilder = true;
          };
        }
      ];
    };
  };
}
