{inputs, ...}: {
  flake.modules.homeManager.browser = {config, ...}: {
    imports = [inputs.arkenfox.hmModules.arkenfox];
    programs.firefox = {
      enable = true;
      configPath = "${config.xdg.configHome}/mozilla/firefox";
      arkenfox = {
        enable = true;
        version = "140.1";
      };
      profiles.default = {
        arkenfox = {
          enable = true;
          "0100" = {
            enable = true;
            "0103"."browser.startup.homepage".value = "https://glance.sole-alkaid.ts.net";
          };
          "0200".enable = true;
          "0300" = {
            enable = true;
          };
          "0400".enable = true;
          "0600".enable = true;
          "0700".enable = true;
          "0800" = {
            enable = true;
            "0830"."browser.search.separatePrivateDefault".value = false;
          };
          "0900".enable = true;
          "1000".enable = true;
          "1200".enable = true;
          "1600".enable = true;
          "1700".enable = true;
          "2000".enable = true;
          "2400".enable = true;
          "2600" = {
            enable = true;
          };
          "2700".enable = true;
          "2800" = {
            enable = true;
          };
          "4000".enable = true;
          "4500".enable = true;
          "5500".enable = true;
          "6000".enable = true;
        };
      };
    };
  };
}
