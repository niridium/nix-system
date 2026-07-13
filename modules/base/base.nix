{inputs, ...}: {
  flake-file.inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    nix-index-database.url = "github:nix-community/nix-index-database";
  };
  flake.aspects = {aspects, ...}: {
    base = {
      includes = with aspects; [
        appimage
        beets
        btop
        direnv
        eza
        ghostty
        git
        helix
        keepassxc
        nh
        nixConf
        nixLd
        nur
        ssh
        tailscale
      ];
      nixos = {pkgs, ...}: {
        system.stateVersion = "25.11";
        imports = [
          inputs.nix-index-database.nixosModules.default
          inputs.home-manager.nixosModules.home-manager
        ];
        #---Boot-------------------------------------
        boot = {
          kernelPackages = pkgs.linuxPackages_latest;
          loader = {
            limine.enable = true;
            efi.canTouchEfiVariables = true;
          };
        };
        #---Networking-------------
        networking = {
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
        #---Keyboard & Locales-----------------
        console.useXkbConfig = true;
        # console.keyMap = "colemak";
        services.xserver.xkb = {
          layout = "us";
          variant = "colemak";
        };
        time.timeZone = "Europe/Madrid";
        i18n = {
          defaultLocale = "es_ES.UTF-8";
          extraLocales = ["en_US.UTF-8/UTF-8"];
          extraLocaleSettings = {
            LC_MESSAGES = "en_US.UTF-8";
          };
        };
        #---OOM--------------------------
        systemd.oomd.enable = false;
        services = {
          systembus-notify.enable = true;
          earlyoom = {
            enable = true;
            enableNotifications = true;
          };
          #---Power Management----------------
          power-profiles-daemon.enable = true;
          #---Firmware--------
          fwupd.enable = true;
          #---Audio-----------------------
          pipewire.enable = true;
        };
        security.rtkit.enable = true;
        #---Fonts------------------------------
        fonts = {
          enableDefaultPackages = true;
          fontconfig.useEmbeddedBitmaps = true;
          packages = [pkgs.nerd-fonts.iosevka];
        };
        #---Home Manager-----------------------
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          extraSpecialArgs = {inherit inputs;};
          backupFileExtension = "bkp";
        };
        programs.dconf.enable = true; # Home Manager fails to start if it's disabled
        #------------
      };
      homeManager = {pkgs, ...}: {
        home.stateVersion = "25.11";
        home.packages = [pkgs.immich-cli];
        xdg.autostart.enable = true;
        #---Bash----------
        programs.bash = {
          enable = true;
          shellAliases = {
            ls = "eza";
          };
        };
        #---Programs with no custom config---
        programs = {
          home-manager.enable = true;
          starship.enable = true;
          zoxide.enable = true;
          fzf.enable = true;
          fastfetch.enable = true;
        };
        #-------------------------
      };
    };
  };
}
