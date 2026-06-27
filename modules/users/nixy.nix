{self, ...}: {
  flake.modules = self.factory.user {username = "nixy";};
}
