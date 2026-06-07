{self, ...}: {
  flake.modules = self.factory.userBase {username = "nixy";};
}
