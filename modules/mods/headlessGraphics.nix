{
  flake.aspects.headlessGraphics = {
    nixos.hardware.graphics = {
      enable = true;
      enable32Bit = true;
    };
  };
}
