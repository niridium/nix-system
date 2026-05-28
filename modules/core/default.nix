{
  imports = [
    ./audio.nix
    ./boot.nix
    ./fonts.nix
    ./home-manager.nix
    ./network.nix
    ./nix_ld.nix
    ./nix_settings.nix
    ./oom.nix
    ./users.nix
  ];

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
}
