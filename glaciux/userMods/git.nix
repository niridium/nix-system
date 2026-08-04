{
  config,
  lib,
  ...
}: {
  options.glaciux.git.enable = lib.mkEnableOption "git" // {default = true;};
  config = lib.mkIf config.glaciux.git.enable {
    programs.git = {
      enable = true;
      signing = {
        key = "/home/callisto/.ssh/key.pub";
        signByDefault = true;
      };
      settings = {
        init.defaultBranch = "main";
        core.editor = "hx";
        gpg.format = "ssh";
        user = {
          name = "niridium";
          email = "niridium@tuta.io";
        };
      };
    };
  };
}
