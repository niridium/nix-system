# AGENTS.md — GlaciuxOS

Project-specific instructions for a personal NixOS flake. Supersedes global
memory when they conflict.

## Architecture

- Modules in `glaciux/mods/` and `glaciux/userMods/` are **not auto-discovered**
  — each must be manually registered in the corresponding `imports` or
  `sharedModules` list. Every listed module is loaded on every host/user, so each
  must be inert unless its `enable` option is set.
- The `enable` flag lives in the **host file** (`hosts/<host>/default.nix`), never
  in the user's file. The user is listed globally in `os.nix`.
- Because `useGlobalPkgs = true` in Home Manager, set `nixpkgs.*` options in NixOS
  modules. `nix.*` options (cache settings) belong in the HM sharedModules block.

## Writing Nix

Formatting and linting are automated: **alejandra** formats, **deadnix** and
**statix** lint. Never hand-format.

Every feature module follows this shape:
```nix
{ config, lib, ... }: let
  cfg = config.glaciux.<mod>;
in {
  options.glaciux.<mod>.enable = lib.mkEnableOption "<description>";
  config = lib.mkIf cfg.enable {
    # …
  };
}
```

Modules must be **generic** — never hard-code a host or user name in `glaciux/`.
Host/user specifics belong in `hosts/<host>/` and `users/<name>.nix`.

Look up option names in the local source first (`nixos-option`, `nix repl`), then
[search.nixos.org](https://search.nixos.org/options?channel=unstable).

## Build

Prefer the cheapest check that proves your change. Use **`nh`** for NixOS
operations, **`nix`** for evaluation/search.

1. `prek run --files <paths>` (requires remote dev shell).
2. `nix eval .#nixosConfigurations.<host>.config.system.build.toplevel.drvPath`
   — quick evaluation (cheaper than `nix flake check`).
3. `nh os build . -H <host>` — build without activating.

Never run `nixos-rebuild switch/boot/test` or deploy unless explicitly asked.

### Adding a user

1. Create `users/<name>.nix` (per-user HM config).
2. Add `"<name>"` to the `users` list in `os.nix`.
3. Enable with `glaciux.users.<name>.enable = true;` in `hosts/<host>/default.nix`.

### Adding a host

1. Create `hosts/<name>/default.nix`. Generate hardware config on the target
   machine with `nixos-generate-config --dir hosts/<name>/` (from
   `nixpkgs#nixos-install-tools`).
2. Add `"<name>"` to the `hosts` list in `os.nix`.
3. Enable users and features in `hosts/<name>/default.nix`.

## Do

- Inspect before changing. Read the surrounding modules and match their patterns.
- Keep changes small, scoped, and reversible.
- Reference secrets by path (for example under `$HOME/.config/…`); never inline them.

## Don't

- Don't commit, push, or run destructive commands without an explicit request.
- Don't overwrite files outside the repo.
- Don't edit `.pre-commit-config.yaml`. It is a symlink to generated JSON.
- Don't disable `programs.dconf.enable` in `glaciux/home.nix`; Home Manager won't start.
- Don't change `system.stateVersion` or `home.stateVersion` (the latter is set
  in `glaciux/home.nix`).
- Don't uncomment or delete the commented-out entries in `glaciux/home.nix`.
- Don't commit secrets, tokens, or private keys.
- Don't change `flake.nix` inputs or bump packages unless asked.
- Regenerating `flake.lock` is fine when requested.

## Commit messages

- **`flake.lock`** — message must be exactly `chore: update flake.lock` (single line, no body).
