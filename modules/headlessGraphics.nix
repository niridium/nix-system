{
  flake.modules.nixos.headlessGraphics = {
    hardware.graphics = {
      enable = true;
      enable32Bit = true;
    };
  };
}
