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
  environment.systemPackages = with pkgs; [rclone];
  console.useXkbConfig = true;
  services.xserver.xkb = {
    layout = "us,us";
    variant = "colemak,euro";
    options = "grp:caps_toggle";
  };
  time = {inherit timeZone;};
  i18n = {
    defaultLocale = "es_ES.UTF-8";
    extraLocales = ["en_US.UTF-8/UTF-8"];
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
    dhcpcd.enable = false;
    networkmanager = {
      enable = true;
      dns = "none";
    };
    nameservers = [
      "194.242.2.3" # Mullvad
      "1.1.1.1" # Cloudflare
    ];
  };
}
