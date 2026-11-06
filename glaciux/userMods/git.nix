{
  config,
  lib,
  ...
}: {
  options.glaciux.git.enable = lib.mkEnableOption "git";
  config = lib.mkIf config.glaciux.git.enable {
    programs.git = {
      enable = true;
      signing = {
        key = "${config.home.homeDirectory}/.ssh/key.pub";
        signByDefault = true;
      };
      settings = {
        init.defaultBranch = "main";
        core.editor = "nvim";
        core.autocrlf = "input";
        gpg.format = "ssh";
        user = {
          name = "niridium";
          email = "niridium@tuta.io";
        };
        alias = {
          lg = "log --oneline --graph --all";
          st = "status --short";
        };
      };
    };
  };
}
