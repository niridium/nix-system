{
  config,
  lib,
  ...
}: {
  options.glaciux.webdav = {
    enable = lib.mkEnableOption "webdav server";
    directory = lib.mkOption {
      type = lib.types.str;
    };
  };
  config = lib.mkIf config.glaciux.webdav.enable {
    services.webdav = {
      enable = true;
      settings = {
        address = "127.0.0.1";
        port = 8080;
        directory = config.glaciux.webdav.directory;
        permissions = "CRUD";
      };
    };
  };
}
