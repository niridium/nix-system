{inputs, ...}: {
  #--------------------------
  systems = ["x86_64-linux"];
  #----------------------------------------------------
  flake-file.inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";
    flake-aspects.url = "github:vic/flake-aspects";
    flake-file.url = "github:vic/flake-file";
    import-tree.url = "github:vic/import-tree";
  };
  imports = with inputs; [
    flake-file.flakeModules.default
    flake-file.flakeModules.nix-auto-follow
    flake-parts.flakeModules.modules
    flake-aspects.flakeModule
  ];
  #---Dendritic output---------------------------------
  flake-file.outputs = ''
    inputs: inputs.flake-parts.lib.mkFlake { inherit inputs; } (inputs.import-tree ./modules)
  '';
  #--------------------------------
}
