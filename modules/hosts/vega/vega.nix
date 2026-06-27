{
  inputs,
  self,
  ...
}: {
  flake = {
    nixosConfigurations.vega = inputs.nixpkgs.lib.nixosSystem {
      modules = with self.modules.nixos;
      with self.factory; [
        #---Core------------------
        (fs.btrfsLuks {systemDevice = "/dev/nvme0n1";})
        (swap {swapAmount = 8;})
        (network {hostname = "vega";})
        (hardware {
          cpu = "amd";
          bootModules = [
            "nvme"
            "xhci_pci"
            "thunderbolt"
            "usbhid"
          ];
        })
        #---One mandatory user----
        nixy
        #-------------------------
        # gui
        laptop
        gaming

        tailscale
        wireless
        consumer
        virtManager
        waydroid
        {
          user.nixy = {
            enable = true;
            isGui = true;
          };
        }
      ];
    };
  };
}
