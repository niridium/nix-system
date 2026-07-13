{
  lib,
  inputs,
  ...
}: {
  flake-file.inputs.betterfox = {
    url = "github:yokoffing/Betterfox";
    flake = false;
  };
  flake.aspects.betterfox = {
    homeManager.programs.firefox = {
      policies = {
        AppAutoUpdate = false;
        SearchEngines = {
          PreventInstalls = false;
          Default = "DuckDuckGo";
          Remove = [
            "Bing"
            "Google"
            "Perplexity"
          ];
        };
        ExtensionsSettings = let
          mozilla = name: "https://addons.mozilla.org/firefox/downloads/latest/${name}/latest.xpi";
          force = {installation_mode = "force_installed";};
        in {
          "uBlock0@raymondhill.net" = force // {install_url = mozilla "ublock-origin";};
          "addon@darkreader.org" = force // {install_url = mozilla "darkreader";};
          "deArrow@ajay.app" = force // {install_url = mozilla "dearrow";};
          "keepassxc-browser@keepassxc.org" = force // {install_url = mozilla "keepassxc-browser";};
          "{762f9885-5a13-4abd-9c77-433dcd38b8fd}" = force // {install_url = mozilla "return-youtube-dislikes";};
          "sponsorBlocker@ajay.app" = force // {install_url = mozilla "sponsorblock";};
        };
      };
      profiles.betterfox = let
        lrf = lib.readFile;
      in {
        isDefault = true;
        id = 0;
        preConfig = lrf ./misc.js;
        extraConfig = lib.concatStrings [
          #---Upstream Betterfox user.js---
          (lrf "${inputs.betterfox}/user.js")
          #---Smooth Scroll---
          (lrf ./smoothfox.js)
          #---Overrides---
          (lrf ./overrides.js)
        ];
      };
    };
  };
}
