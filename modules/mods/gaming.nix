{lib, ...}: {
  flake.aspects.gaming = {
    nixos = {pkgs, ...}: {
      programs.steam = {
        enable = true;
        extest.enable = true;
        extraCompatPackages = [
          pkgs.proton-ge-bin
        ];
      };
    };
    homeManager = {pkgs, ...}: {
      programs.lutris = {
        enable = true;
        # package = pkgs.lutris;
        steamPackage = pkgs.steam;
        protonPackages = [pkgs.proton-ge-bin];
        extraPackages = with pkgs; [mangohud winetricks gamemode];
      };
      home = {
        packages = [
          pkgs.moonlight-qt
          # pkgs.factorio-space-age
        ];
        extraDependencies = [
          # pkgs.factorio-space-age.src
        ];
      };
    };
    provides.server = {
      virtualDisplay ? "", # AMD Gpu Pci Address
      ...
    }: {
      nixos = {
        boot.kernelParams = lib.mkIf (virtualDisplay != "") ["amdgpu.virtual_display=${virtualDisplay},x"];
        services = {
          udev.extraRules = ''KERNEL=="uinput", MODE="0660", GROUP="input", SYMLINK+="uinput" '';
          sunshine = {
            enable = true;
            autoStart = true;
            capSysAdmin = true;
            openFirewall = true;
          };
        };
      };
    };
  };
}
