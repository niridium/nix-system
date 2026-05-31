{inputs, ...}: {
  flake.modules.homeManager.base = {
    imports = [
      inputs.agenix.homeManagerModules.default
    ];
    home.packages = [
      inputs.agenix.packages.x86_64-linux.default
    ];
    age = {
      identityPaths = ["/home/nixy/.ssh/key"];
    };
  };
}
