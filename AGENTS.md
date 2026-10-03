# AGENTS.md — GlaciuxOS

You are an AI coding agent working in a personal NixOS flake. You are not the
maintainer. Follow this file first. Ask only when a task is ambiguous or when
this file conflicts with the code.

**Precedence:** the code is the source of truth for *what exists*; this file is
the source of truth for *how to work*. If they disagree, trust the code, do the
task, and flag the discrepancy in your summary. Report literal file contents,
not paraphrases. When two approaches both work, choose the one with the smaller
diff.

## Layout

| Path | Purpose |
| --- | --- |
| `flake.nix` | Inputs and the `nixosConfigurations` output. |
| `os.nix` | Assembles each host×user pair into a NixOS system; merged into outputs with `mergeAttrsList`. |
| `glaciux/mods/*.nix` | Generic NixOS feature modules (system, gui, gaming, hardware, swap, immich, tailscale, …). Listed explicitly in `glaciux/nixos.nix`. |
| `glaciux/userMods/` | Home Manager feature modules, either `<name>.nix` or `<name>/<name>.nix` when they ship extra files (`config.toml`, `.kdl`, `.js`). Listed explicitly in `glaciux/home.nix`. |
| `glaciux/nixos.nix` | Imports every `mods/*.nix` module and sets global Nix settings. |
| `glaciux/home.nix` | Wires in Home Manager, shared HM settings and the `userMods` list. |
| `lib/userFactory.nix` | Builds one user's home config; called once per user by `users/default.nix`. |
| `users/default.nix` | Maps the `users` list (from `specialArgs`) over `lib/userFactory.nix`, using `users/<name>.nix` as each user's Home Manager module. |
| `users/<name>.nix` | Per-user Home Manager config. |
| `hosts/<name>/{default,hardware-configuration}.nix` | Per-host config. |

`os.nix` holds two hard-coded lists, `hosts` and `users`, plus
`timeZone = "Europe/Madrid"`. For every name in `hosts` it builds a
`nixosSystem` whose modules are, in order: `./hosts/<hostName>`, `./users`,
`./glaciux/home.nix`, `./glaciux/nixos.nix`, with
`specialArgs = { inherit inputs timeZone users hostName; }`. The `users` list is
passed to every host, so a user listed there is available on all hosts and is
switched on per host with its `enable` option.

### Where things are wired

- **`glaciux/nixos.nix`** has one `imports` list naming every file in `mods/`
  (alphabetical), plus global settings: `allowUnfree`, `trusted-users = ["@wheel"]`
  and the `nix-command flakes` experimental features. Every listed module is
  imported on every host, so each must be inert unless its `enable` option is set.
- **`glaciux/home.nix`** imports Home Manager as a NixOS module with
  `useGlobalPkgs`, `useUserPackages` and `backupFileExtension = "bkp"`. Its
  `sharedModules` holds an inline block (home.stateVersion, autostart, and the
  `programs` bash, starship, zoxide, fzf, fastfetch enabled for **every** user)
  followed by the `userMods` imports. Every user gets every listed userMod, so
  each must be inert unless enabled.
- Some `sharedModules` entries are commented out on purpose (`umbriel`,
  `screenshots`). Leave them alone unless asked.
- Because `useGlobalPkgs = true`, set `nixpkgs.*` options in NixOS modules, not
  inside Home Manager modules.

`flake.nix` targets `x86_64-linux` only and defines just `nixosConfigurations`
(no `devShells`, `packages` or `checks`; the dev shell is provided remotely). Inputs: `nixpkgs` (nixos-unstable
tarball), `home-manager`, `nix-index-database`, `fluxr`
(`github:niridium/fluxr-backup`) and `firefox-csshacks` (non-flake).

## Hosts and users

The authoritative lists are `hosts` and `users` in `os.nix` (currently hosts:
`apollo`, `cronos`; users: `callisto`, `amalthea`). Read them rather than
trusting this section, which only gives context.

**Hosts**
- `apollo`: laptop with gaming and GUI. Default user `callisto`. Distributed-build target.
- `cronos`: desktop/server with storage, swRaid, immich, navidrome, ollama,
  linkding, openssh, webdav, virtualisation. It is the **builder**
  (`isBuilder = true`, user `hyperion`, group `remotebuild`); `apollo` is its `remoteHost`.

**Users**
- `callisto`: primary interactive user (firefox, zed, vscode, noctalia, gtk,
  cava, niri; rclone and eclipse-java).
- `amalthea`: services-focused user.
- `hyperion`: the build account (system user, group `remotebuild`, `isBuilder =
  true`). It is not in the `users` list in `os.nix`; it is defined by the
  `distributedBuilds` module (which is inert unless enabled), so it is host-
  agnostic — wherever that module is enabled with `isBuilder = true`, `hyperion`
  is created. Consult `glaciux/mods/distributedBuilds.nix` before changing
  builder settings.

## Writing Nix

Formatting and linting are automated: **alejandra** formats, **deadnix** and
**statix** lint. Never hand-format; write reasonable code and let the hooks
normalize it. Beyond that:

- Use `inherit` to pass arguments, and `with pkgs; [ a b c ]` for package lists.
- Every feature module follows this shape (shown for a `glaciux/mods` module;
  for a `userMods` module copy the option path used by an existing one):
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
- Keep modules **generic and feature-driven**. Never hard-code a host or user
  name in `glaciux/`. Host and user specifics belong in `hosts/<host>/` and
  `users/<name>.nix`.
- A new module is a self-contained file with an `enable` option. Nothing is
  auto-discovered, so register it by hand:
  - OS module: create `glaciux/mods/<name>.nix` and add it to the `imports`
    list in `glaciux/nixos.nix` (keep alphabetical order).
  - Home Manager module: create `glaciux/userMods/<name>.nix` (or
    `<name>/<name>.nix` if it needs extra files) and add it to `sharedModules`
    in `glaciux/home.nix`, next to its siblings.
  Then enable it from the relevant host or user file.
- Look up option names and types before using them. Use the local source of
  truth first: `nixos-option`, `nix repl`, or existing usage in this repo.
  Web references, if you can browse:
  [options](https://search.nixos.org/options?channel=unstable),
  [packages](https://search.nixos.org/packages?channel=unstable) (channel `unstable`).

## Build and verify

Prefer the cheapest check that proves your change.

1. Format and lint changed `.nix` files with **prek** (not `pre-commit`):
   `prek run --files <paths>`. The hooks (alejandra, deadnix, statix) and `prek`
   come from a remote dev shell, not from this flake. If `prek` isn't on
   `PATH`, that shell isn't active; ask the maintainer how to enter it rather
   than installing tools yourself.
2. Evaluate: `nix flake check`. This can be slow; for a single host use
   `nix eval .#nixosConfigurations.<host>.config.system.build.toplevel.drvPath`.
3. Build without activating:
   `nix build .#nixosConfigurations.<host>.config.system.build.toplevel` (output in `result`).

Never run `nixos-rebuild switch`, `boot`, or `test`, and never deploy to
another machine, unless explicitly asked.

To detect hardware for a new host:
`nix run nixpkgs#detect-hardware-config > hosts/<name>/hardware-configuration.nix`.

### Adding a user

1. Create `users/<name>.nix` containing the user's home config.
2. Add `"<name>"` to the `users` list in `os.nix`.
3. Enable the user in `hosts/<host>/default.nix` with
   `glaciux.users.<name>.enable = true;`. The enable flag lives in the host
   file, never in the user's file.

### Adding a host

1. Create `hosts/<name>/default.nix` and generate
   `hosts/<name>/hardware-configuration.nix` (command above).
2. Add `"<name>"` to the `hosts` list in `os.nix`.
3. Enable the wanted users and features in `hosts/<name>/default.nix`.

## Do

- Inspect before changing. Read the surrounding modules and match their patterns.
- Keep changes small, scoped, and reversible.
- Isolate host and user data in `hosts/*/` and `users/*/`.
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
- Don't hard-code host or user names in modules.
- Don't change `flake.nix` inputs or bump packages unless asked.
- Regenerating `flake.lock` is fine when requested.
- Don't reformat files you aren't otherwise changing.

## Summary and commits

- Summarize in 1–2 sentences: what changed and its effect. Note any
  discrepancy between this file and the code.
- Propose a commit message and **wait for approval** before committing.
- Format: Conventional Commits. Single-line subject, then bulleted rationale,
  optionally scoped by module or user (`fix(eza): …`, `chore(callisto): …`).
- **`flake.lock` commits:** the message must be exactly `chore: update flake.lock`.
  Single line, no body.
