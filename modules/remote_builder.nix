{
  users.users.remotebuild = {
    isSystemUser = true;
    group = "remotebuild";
    useDefaultShell = true;
  };

  users.groups.remotebuild = {};

  nix = {
    nrBuildUsers = 64;
    settings.trusted-users = ["remotebuild"];
  };
}
