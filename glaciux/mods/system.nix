{
  hostName,
  timeZone,
  inputs,
  pkgs,
  ...
}: {
  imports = [inputs.nix-index-database.nixosModules.default];
  system = {
    # nixos.variantName = "GlaciuxOS";
    stateVersion = "25.11";
  };
  systemd.services.systemd-suspend.serviceConfig.Environment = "SYSTEMD_SLEEP_FREEZE_USER_SESSIONS=0"; # Fix system freezing after suspend
  environment.systemPackages = with pkgs; [
    rclone
    inputs.fluxr.packages.${stdenv.hostPlatform.system}.default
  ];
  console.useXkbConfig = true;
  services.xserver.xkb = {
    layout = "us,us";
    variant = "euro,colemak";
    options = "grp:alt_space_toggle";
  };
  time = {inherit timeZone;};
  i18n = {
    defaultLocale = "es_ES.UTF-8";
    extraLocales = ["all"];
    extraLocaleSettings.LC_MESSAGES = "en_US.UTF-8";
  };
  fonts = {
    enableDefaultPackages = true;
    packages = [pkgs.nerd-fonts.iosevka];
  };
  security.rtkit.enable = true;
  services = {
    power-profiles-daemon.enable = true;
    fwupd.enable = true;
    pipewire.enable = true;
  };
  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    loader = {
      efi.canTouchEfiVariables = true;
      limine = {
        enable = true;
        style.interface.branding = "GlaciuxOS";
      };
    };
  };
  networking = {
    inherit hostName;
    useDHCP = false;
    networkmanager = {
      enable = true;
      dns = "none";
    };
    nameservers = [
      "9.9.9.9" # Quad9
      "1.1.1.1" # Cloudflare
    ];
  };
}
