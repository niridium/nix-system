let
  vega = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICOmsJ9zTaYRvCl51AC8VE5eNGdCEre7a/g5PS5ZdmVW nixy@vega";
  licher = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOLvbNnwp7SIIHskFrEXhq/7IU07l4PcrcOqJqa2MDEl nixy@licher";
in {
  "factorio_token.age".publicKeys = [vega];
  "hermes-env.age".publicKeys = [vega licher];
}
