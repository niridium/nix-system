{
  config,
  inputs,
  lib,
  ...
}: {
  imports = [inputs.noctalia-greeter.nixosModules.default];
  options.glaciux.noctalia-greeter.enable = lib.mkEnableOption "noctalia greeter" // {default = true;};
  config = lib.mkIf config.glaciux.noctalia-greeter.enable {
    programs.noctalia-greeter = {
      enable = true;
    };
  };
}
