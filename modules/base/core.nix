{inputs, ...}: {
  flake.modules.nixos.base = {
    imports = [
      inputs.home-manager.nixosModules.home-manager
    ];
    system.stateVersion = "25.11";

    programs.dconf.enable = true; # Home Manager fails to start if it's disabled

    console.keyMap = "colemak";
    time.timeZone = "Europe/Madrid";
    i18n = {
      defaultLocale = "es_ES.UTF-8";
      extraLocales = ["en_US.UTF-8/UTF-8"];
      extraLocaleSettings = {
        LC_MESSAGES = "en_US.UTF-8";
      };
    };

    services = {
      power-profiles-daemon.enable = true;
      fwupd.enable = true; # Firmware updates
    };

    #---HOME MANAGER----------------------------------
    home-manager = {
      # users.nixy = ../../home/hosts/vega.nix;
      useGlobalPkgs = true;
      useUserPackages = true;
      extraSpecialArgs = {inherit inputs;};
      backupFileExtension = "bkp";
      # sharedModules = [inputs.self.modules.homeManager.core];
    };
  };
  # flake.modules.homeManager.core = {
  # };
}
