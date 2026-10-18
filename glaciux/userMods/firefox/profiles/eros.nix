{
  lib,
  inputs,
  ...
}: {
  programs.firefox.profiles.eros = let
    lrf = lib.readFile;
    chromeParts = part:
      lib.concatStrings ([(lrf ./parts/userChrome.css)]
        ++ (lib.map (chrome: lrf "${inputs.firefox-csshacks}/chrome/${chrome}.css") part));
    prefParts = part: lib.concatStrings (lib.map (pref: lrf ./parts/${pref}.js) part);
  in {
    id = 0;
    isDefault = true;
    preConfig = lrf ./parts/misc.js;

    # Take file names from ./parts/ directory
    extraConfig = prefParts [
      "fastfox"
      "peskyfox"
      "securefox"
      "smoothfox"
    ];

    # Take file names from /chrome/ directory in "https://github.com/MrOtherGuy/firefox-csshacks"
    userChrome =
      chromeParts [
      ];
  };
}
