{
  flake.modules.nixos.waydroid = {pkgs, ...}: {
    virtualisation = {
      waydroid = {
        enable = true;
        package = pkgs.waydroid-nftables;
      };
    };
    environment.systemPackages = [pkgs.nur.repos.ataraxiasjel.waydroid-script];
  };
}
