{lib, ...}: {
  flake.aspects.betterfox = {
    homeManager.programs.firefox.profiles = let
      lrf = lib.readFile;
    in {
      eros = {
        id = 0;
        isDefault = true;
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
