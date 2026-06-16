{
  lib,
  inputs,
  ...
}: {
  flake-file.inputs = {
    betterfox = {
      url = "github:yokoffing/Betterfox";
      flake = false;
    };
  };
  flake.modules.homeManager.betterfox = {
    programs.firefox = {
      policies = {
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
      };
      profiles.betterfox = with lib; {
        isDefault = true;
        id = 0;
        preConfig = readFile ./misc.js;
        extraConfig = concatStrings [
          #---Upstream Betterfox user.js---
          (readFile "${inputs.betterfox}/user.js")
          #---Smooth Scroll---
          (readFile ./smoothfox.js)
          #---Overrides---
          (readFile ./overrides.js)
        ];
      };
    };
  };
}
