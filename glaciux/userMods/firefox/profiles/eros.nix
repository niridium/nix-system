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
    userChrome = chromeParts [
      "centered_statuspanel"
      "centered_tab_content"
      "floating_findbar_on_top"
      "iconized_content_context_menu"
      "iconized_main_menu"
      "iconized_tabs_context_menu"
      "iconized_textbox_context_menu"
      "tabs_fill_available_width"
      "urlbar_centered_text"
    ];
  };
}
