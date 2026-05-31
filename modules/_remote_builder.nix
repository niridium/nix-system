{
  users = {
    groups.remotebuild = {};
    users.remotebuild = {
      isSystemUser = true;
      group = "remotebuild";
      useDefaultShell = true;
    };
  };
  nix = {
    nrBuildUsers = 64;
    settings.trusted-users = ["remotebuild"];
  };
}
