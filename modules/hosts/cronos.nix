{inputs, ...}: {
  flake = let
    hostName = "cronos";
  in {
    nixosConfigurations.${hostName} = inputs.nixpkgs.lib.nixosSystem {modules = [inputs.self.modules.nixos.${hostName}];};
    aspects = {aspects, ...}: {
      ${hostName} = {
        nixos = {};
        homeManager = {};
        _.globals.includes = with aspects; [
          gui
          gaming
          actualBudget
          immich
          navidrome
          openssh
          swRaid
          headlessGraphics
          ollama
        ];
        includes = with aspects; [
          (users {
            userNames = ["nixy" "amalthea"];
            hostName = hostName;
          })
          (gui._.autoStart {userName = "amalthea";})

          (gaming._.server {virtualDisplay = "0000:0c:00.0";})

          (fs._.btrfs {systemDevice = "/dev/sdc";})
          (fs._.swap {swapAmount = 8;})
          (network {hostname = hostName;})
          (nixBuilds {isBuilder = true;})
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
            name = "storage";
            device = "/dev/md127";
            mountPoint = "/storage";
            format = "btrfs";
          })
        ];
      };
    };
  };
}
