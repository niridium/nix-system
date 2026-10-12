{
  config,
  lib,
  ...
}: {
  options.glaciux.ssh.enable = lib.mkEnableOption "ssh" // {default = true;};
  config = lib.mkIf config.glaciux.ssh.enable {
    services.ssh-agent.enable = true;
    programs.ssh = {
      enable = true;
      enableDefaultConfig = false;
      settings = {
        "cronos" = {
          hostname = "100.72.107.3";
          user = "amalthea";
        };
        "codeberg.org" = {
          hostname = "codeberg.org";
          user = "git";
        };
        "github.com" = {
          hostname = "github.com";
          user = "git";
        };
      };
      extraOptionOverrides = {
        "PasswordAuthentication" = "no";
        "KbdInteractiveAuthentication" = "no";
      };
    };
  };
}
