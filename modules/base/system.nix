{inputs, ...}: {
  flake.modules = {
    nixos.base = {pkgs, ...}: {
      system.stateVersion = "25.11";
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
      #---Zswap------------------------
      # swapDevices = [
      #   {
      #     device = "/var/lib/swapfile";
      #     # size = 8 * 1024;
      #   }
      # ];
      # boot.kernelParams = [
      #   "zswap.enabled=1"
      #   "zswap.compressor=zstd"
      #   "zswap.max_pool_percent=20"
      #   "zswap.shrinker_enabled=1"
      # ];
      #---Fonts------------------------------
      fonts = {
        enableDefaultPackages = true;
        fontconfig.useEmbeddedBitmaps = true;
        packages = [pkgs.nerd-fonts.iosevka];
      };
      #--------------------------------------
    };
    homeManager.base = {
      xdg.autostart.enable = true;
      #---Agenix-----------------------------------
      home.packages = [
        inputs.agenix.packages.x86_64-linux.default
      ];
      age = {
        identityPaths = ["/home/nixy/.ssh/key"];
      };
      #---Bash----------
      programs.bash = {
        enable = true;
        shellAliases = {
          ls = "eza";
        };
      };
      #---Programs with no custom config---
      programs = {
        starship.enable = true;
        zoxide.enable = true;
        fzf.enable = true;
        fastfetch.enable = true;
      };
      #-------------------------
    };
  };
}
