{
  perSystem = {
    packages = pkgs: {
      helium = let
        version = "0.13.1.1";
      in
        pkgs.appimageTools.wrapType2 {
          pname = "helium-appimage";
          src = pkgs.fetchurl {
            url = "https://github.com/imputnet/helium-linux/releases/download/${version}/helium-${version}-x86_64.AppImage";
            hash = "sha256:64053e2074ae2aef0a8aab602be7def75e02ff2eca4e8556cc2f9daea764f993";
          };
        };
    };
  };
  flake.modules.homeManager.heliumBrowser = {
    home.packages = self: [
      self.packages.x86_64-linux.helium
    ];
  };
}
