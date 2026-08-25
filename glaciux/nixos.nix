{
  imports = [
    ./mods/appimage.nix
    ./mods/btrfsMaintenance.nix
    ./mods/distributedBuilds.nix
    ./mods/flatpak.nix
    ./mods/gaming.nix
    ./mods/gui.nix
    ./mods/hardware.nix
    ./mods/immich.nix
    ./mods/ios.nix
    ./mods/linkding.nix
    ./mods/navidrome.nix
    ./mods/nh.nix
    ./mods/nixLd.nix
    ./mods/noctalia-greeter.nix
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
  nix = {
    settings = {
      trusted-users = ["@wheel"];
      experimental-features = ["nix-command" "flakes"];
    };
    extraOptions = ''warn-dirty = false'';
  };
}
