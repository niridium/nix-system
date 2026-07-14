{inputs, ...}: {
  flake = let
    hostName = "apollo";
  in {
    nixosConfigurations.${hostName} = inputs.nixpkgs.lib.nixosSystem {modules = [inputs.self.modules.nixos.${hostName}];};
    aspects = {aspects, ...}: {
      ${hostName} = {
        nixos = {};
        homeManager = {};
        _.globals.includes = with aspects; [
          gui
          gaming
          firefoxBrowser
          zedEditor
          virtualisation
        ];
        includes = with aspects; [
          (users {
            inherit hostName;
            userNames = ["callisto"];
          })

          (gui._.autoStart {userName = "callisto";})

          (fs._.btrfsLuks {systemDevice = "/dev/nvme0n1";})
          (fs._.swap {swapAmount = 8;})

          (hardware {
            cpu = "amd";
            laptop = true;
            wireless = true;
            bootModules = [
              "nvme"
              "xhci_pci"
              "thunderbolt"
              "usbhid"
              "uas"
              "sd_mod"
            ];
          })
          (network {hostname = hostName;})
          (nixBuilds {remoteHost = "cronos";})
        ];
      };
    };
  };
}
