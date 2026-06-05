{
  flake.modules.nixos.dawarich = {
    services.dawarich = {
      enable = true;
      localDomain = "dawarich.sole-alkaid.ts.net";
      webPort = 4000;
    };
  };
}
