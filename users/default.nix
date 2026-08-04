{
  config,
  users,
  lib,
  ...
}: let
  homeConfig = map (user:
    import ../lib/userFactory.nix {
      inherit config lib user;
      homeManager = ./${user}.nix;
    })
  users;
in {imports = homeConfig;}
