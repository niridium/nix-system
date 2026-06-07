{
  inputs,
  self,
  # lib,
  ...
}: {
  flake = {
    #---Setup hostname---------------------
    # modules = lib.mkMerge [
    #   (self.factory.network {hostname = "vega";})
    #   # (inputs.self.factory.swapspace "8")
    # ];
    #--------------------------------------
    nixosConfigurations.vega = inputs.nixpkgs.lib.nixosSystem {
      modules = with self.modules.nixos;
      with self.factory; [
        #---Core------------------
        (fs.btrfsLuks {systemDevice = "/dev/nvme0n1";})
        (swap {swapAmount = 8;})
        (network {hostname = "vega";})
        # vegaNetwork #From Factory
        vegaHardware
        # vegaDisko
        base
        #---One mandatory user----
        nixyGui
        #-------------------------
        gui
        laptop
        gaming

        tailscale
        wireless
        consumer
      ];
    };
  };
}
