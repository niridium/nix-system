{
  lib,
  inputs,
  ...
}: {
  flake-file.inputs.firefox-csshacks = {
    url = "github:MrOtherGuy/firefox-csshacks";
    flake = false;
  };
  flake.aspects.betterfox = {
    homeManager.programs.firefox.profiles = let
      lrf = lib.readFile;
      mkCss = css: lrf "${inputs.firefox-csshacks}/${css}";
    in {
      eros = {
        id = 0;
        isDefault = true;
        userChrome = lib.concatStrings [
          (lrf ./userChrome.css)
          (mkCss "chrome/centered_statuspanel.css")
          (mkCss "chrome/centered_tab_content.css")
          (mkCss "chrome/floating_findbar_on_top.css")
          (mkCss "chrome/iconized_content_context_menu.css")
          (mkCss "chrome/iconized_main_menu.css")
          (mkCss "chrome/iconized_tabs_context_menu.css")
          (mkCss "chrome/iconized_textbox_context_menu.css")
          (mkCss "chrome/tabs_fill_available_width.css")
          (mkCss "chrome/urlbar_centered_text.css")
        ];
        preConfig = lrf ./misc.js;
        extraConfig = lib.concatStrings [
          (lrf ./fastfox.js)
          (lrf ./peskyfox.js)
          (lrf ./securefox.js)
          (lrf ./smoothfox.js)
        ];
      };
    };
  };
}
