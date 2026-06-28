{
  inputs,
  self,
  ...
}: let
  nx = self.modules.nixos;
  fcty = self.factory;
in {
  flake = {
    nixosConfigurations.vega = inputs.nixpkgs.lib.nixosSystem {
      modules = [
        #---Core------------------
        (fcty.fs.btrfsLuks {systemDevice = "/dev/nvme0n1";})
        (fcty.swap {swapAmount = 8;})
        (fcty.network {hostname = "vega";})
        (fcty.hardware {
          cpu = "amd";
          bootModules = [
            "nvme"
            "xhci_pci"
            "thunderbolt"
            "usbhid"
          ];
        })
        #---One mandatory user----
        nx.nixy
        #-------------------------
        {
          user.nixy = {
            enable = true;
            isGui = true;
            isGaming = true;
          };
          hardwareExtra = {
            enable = true;
            laptop = true;
            wireless = true;
          };
          nixBuilds = {
            enable = true;
            remoteHost = "licher";
          };
          v12n = {
            enable = true;
          };
        }
      ];
    };
  };
}
