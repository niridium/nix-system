{inputs, ...}: {
  #--------------------------
  systems = ["x86_64-linux"];
  #----------------------------------------------------
  flake-file.inputs = {
    flake-parts = {
      url = "github:hercules-ci/flake-parts";
    };
    flake-file = {
      url = "github:vic/flake-file";
    };
    import-tree = {
      url = "github:vic/import-tree";
    };
  };
  imports = [
    inputs.flake-file.flakeModules.default
    inputs.flake-parts.flakeModules.modules
  ];
  #---Dendritic output---------------------------------
  flake-file.outputs = ''
    inputs: inputs.flake-parts.lib.mkFlake { inherit inputs; } (inputs.import-tree ./modules)
  '';
  #--------------------------------
}
