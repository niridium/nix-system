{
  lib,
  hostName,
  timeZone,
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.nix-index-database.nixosModules.default
    ./mods/appimage.nix
    ./mods/btrfsMaintenance.nix
    ./mods/distributedBuilds.nix
    ./mods/fancontrol.nix
    ./mods/flatpak.nix
    ./mods/gaming.nix
    ./mods/gui.nix
    ./mods/hardware.nix
    ./mods/immich.nix
    ./mods/ios.nix
    ./mods/linkding.nix
    ./mods/llamaCpp.nix
    ./mods/navidrome.nix
    ./mods/nh.nix
    ./mods/nixLd.nix
    ./mods/ollama.nix
    ./mods/oom.nix
    ./mods/openssh.nix
    ./mods/swap.nix
    ./mods/swRaid.nix
    ./mods/tailscale.nix
    ./mods/virtualisation.nix
    ./mods/webdav.nix
  ];

  glaciux = {
    appimage.enable = lib.mkDefault true;
    fancontrol.enable = lib.mkDefault true;
    flatpak.enable = lib.mkDefault true;
    hardware.enable = lib.mkDefault true;
    nh.enable = lib.mkDefault true;
    nix-ld.enable = lib.mkDefault true;
    oom.enable = lib.mkDefault true;
    tailscale.enable = lib.mkDefault true;
  };

  system.stateVersion = "25.11";

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

  time = {inherit timeZone;};

  i18n = {
    defaultLocale = "es_ES.UTF-8";
    extraLocales = ["all"];
    extraLocaleSettings.LC_MESSAGES = "en_US.UTF-8";
  };

  console.useXkbConfig = true;

  fonts = {
    enableDefaultPackages = true;
    packages = [pkgs.nerd-fonts.iosevka];
  };

  security.rtkit.enable = true;

  services.xserver.xkb = {
    layout = "us,us";
    variant = "euro,colemak";
    options = "grp:alt_space_toggle";
  };

  services = {
    power-profiles-daemon.enable = true;
    fwupd.enable = true;
    pipewire.enable = true;
  };

  environment.systemPackages = with pkgs; [
    rclone
    inputs.fluxr.packages.${stdenv.hostPlatform.system}.default
  ];

  systemd.services.systemd-suspend.serviceConfig.Environment = "SYSTEMD_SLEEP_FREEZE_USER_SESSIONS=0"; # Fix system freezing after suspend

  nixpkgs.config = {
    allowUnfree = true;
    problems.handlers = {
      "gtk+".broken = "warn"; # or "ignore"
    };
  };

  nix = {
    settings = {
      trusted-users = ["@wheel"];
      experimental-features = ["nix-command" "flakes"];
    };
    extraOptions = ''warn-dirty = false'';
  };
}
