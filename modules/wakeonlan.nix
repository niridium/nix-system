{interface, ...}: {
  networking = {
    interfaces.${interface} = {
      wakeOnLan.enable = true;
    };
    firewall.allowedUDPPorts = [9];
  };
}
