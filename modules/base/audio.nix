{
  flake.modules.nixos.base = {
    services.pipewire.enable = true;
    security.rtkit.enable = true;
  };
}
