{lib, ...}: {
  imports = [
    ./mods/appimage.nix
    ./mods/btrfsMaintenance.nix
    ./mods/distributedBuilds.nix
    ./mods/fancontrol.nix
    ./mods/flatpak.nix
    ./mods/gaming.nix
    ./mods/gui.nix
    ./mods/hardware.nix
    ./mods/immich.nix
    ./mods/ios.nix
    ./mods/linkding.nix
    ./mods/llamaCpp.nix
    ./mods/navidrome.nix
    ./mods/nh.nix
    ./mods/nixLd.nix
    ./mods/ollama.nix
    ./mods/oom.nix
    ./mods/openssh.nix
    ./mods/swap.nix
    ./mods/swRaid.nix
    ./mods/system.nix
    ./mods/tailscale.nix
    ./mods/virtualisation.nix
    ./mods/webdav.nix
  ];
  glaciux = {
    nix-ld.enable = lib.mkDefault true;
    fancontrol.enable = lib.mkDefault true;
    hardware.enable = lib.mkDefault true;
    tailscale.enable = lib.mkDefault true;
  };
  nixpkgs.config = {
    allowUnfree = true;
    problems.handlers = {
      "gtk+".broken = "warn"; # or "ignore"
    };
  };
  nix = {
    settings = {
      trusted-users = ["@wheel"];
      experimental-features = ["nix-command" "flakes"];
    };
    extraOptions = ''warn-dirty = false'';
  };
}
