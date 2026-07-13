{inputs, ...}: {
  flake-file.inputs.firefox.url = "github:nix-community/flake-firefox-nightly";
  flake.aspects = {aspects, ...}: {
    firefoxBrowser = {
      includes = [aspects.betterfox];
      homeManager = {
        pkgs,
        config,
        ...
      }: {
        programs.firefox = {
          enable = true;
          package = inputs.firefox.packages.${pkgs.stdenv.hostPlatform.system}.firefox-beta-bin;
          configPath = "${config.xdg.configHome}/mozilla/firefox";
          languagePacks = ["en" "es-ES"];
        };
      };
    };
  };
}
