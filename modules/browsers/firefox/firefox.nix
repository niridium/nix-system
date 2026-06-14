{
  inputs,
  self,
  ...
}: {
  flake-file.inputs = {
    firefox.url = "github:nix-community/flake-firefox-nightly";
  };
  flake.modules.homeManager.firefoxBrowser = {
    config,
    pkgs,
    ...
  }: {
    imports = [
      self.modules.homeManager.betterfox
    ];
    programs.firefox = {
      enable = true;
      package = inputs.firefox.packages.${pkgs.stdenv.hostPlatform.system}.firefox-beta-bin;
      configPath = "${config.xdg.configHome}/mozilla/firefox";
      languagePacks = ["en" "es-es"];
    };
  };
}
