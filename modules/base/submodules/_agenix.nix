{inputs, ...}: {
  flake-file.inputs.agenix.url = "github:ryantm/agenix";
  flake.aspects.agenix = {
    homeManager = {
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
  };
}
