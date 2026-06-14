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
  flake.modules.homeManager.betterfox = with lib; {
    programs.firefox = {
      policies = let
        extensions = ["ublock-origin" "keepassxc-browser" "darkreader" "dearrow" "sponsorblock" "return-youtube-dislikes"];
        install = extension: "https://addons.mozilla.org/firefox/downloads/latest/${extension}/latest.xpi";
      in {
        Extensions.Install = map install extensions;
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
      profiles.betterfox = {
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
