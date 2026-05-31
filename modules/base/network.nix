{
  flake.modules.nixos.base = {
    networking = {
      useDHCP = false;
      dhcpcd.enable = false;
      networkmanager = {
        enable = true;
        dns = "none";
      };
      nameservers = [
        "194.242.2.3" # Mullvad
        "1.1.1.1" # Cloudflare
      ];
    };
  };
}
