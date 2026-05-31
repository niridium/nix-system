{inputs, ...}: {
  flake.nixosConfigurations = {
    licher = let
      specialArgs = {
        inherit inputs; # username;
        hostname = "licher";
        swapspace = 8;
        systemdisk = "/dev/sdc";
        serverdirectory = "/storage";
        virtual_display = "amdgpu.virtual_display=0000:0c:00.0,1";
        interface = "enp9s0";
      };
    in
      inputs.nixpkgs.lib.nixosSystem {
        # system = "x86_64-linux";
        specialArgs = specialArgs;
        modules = [
          ./hardware-configuration.nix

          ../../modules/core

          ../../modules/filesystem/btrfs_subvolumes.nix
          ../../modules/filesystem/swap.nix
          ../../modules/filesystem/swraid.nix

          ../../modules/services/actual.nix
          ../../modules/services/immich.nix
          ../../modules/services/navidrome.nix
          ../../modules/services/openssh.nix

          ../../modules/tailscale.nix

          ../../modules/remote_builder.nix
          {
            system.stateVersion = "25.11";

            hardware.graphics = {
              enable = true;
              enable32Bit = true;
            };

            fileSystems."/storage" = {
              device = "/dev/md127";
              fsType = "btrfs";
              mountPoint = "/storage";
              options = ["compress=zstd"];
            };

            services.beesd.filesystems.storage = {
              spec = "/storage";
              hashTableSizeMB = 512;
              extraOptions = [
                "--loadavg-target"
                "5.0"
              ];
            };
          }
        ];
      };
  };
}
