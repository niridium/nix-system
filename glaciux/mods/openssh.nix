{
  config,
  lib,
  ...
}: {
  options.glaciux.openssh.enable = lib.mkEnableOption "openssh service";
  config = lib.mkIf config.glaciux.openssh.enable {
    services.openssh = {
      enable = true;
      settings = {
        PasswordAuthentication = false;
        KbdInteractiveAuthentication = false;
        PermitRootLogin = "no";
        AllowUsers = ["callisto"];
      };
    };
  };
}
