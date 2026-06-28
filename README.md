# My nixos configuration

## Hosts

| Hostname | Usecase              | CPU           | GPU     | RAM   |
| -------- | -------------------- | ------------- | ------- | ----- |
| Vega     | Workstation Laptop   | Ryzen 7 250   | 780M    | 16 GB |
| Licher   | Multi purpose server | Ryzen 7 5800X | RX 7600 | 32 GB |

## Repo Structure

TODO after refactor

## Modules and Config

### `nixy`

`user.nixy`

> `.enable`: Create the nixy user.  
> `.isGui`: Enable the gui modules for nixy. [^1]  
> `.isServer`: Enable multiple services. [^2]  
> `.isGaming`: Enable games launchers and tools.

### `gaming`

`gaming`

> `.enable`: Enable games launchers and tools.  
> (This option is auto enabled when `isGaming` is true at the user level, you should not enable this option manually).

`gamingServer`

> `.enable`: Enable sunshine service.  
> `.virtualDisplay`: If your server is headless and you have and AMD GPU you can enter the PCI address here. More info at [AMD Virtual Display](https://wiki.archlinux.org/title/AMDGPU#Virtual_display_on_headless_setups).

### `hardware`

`hardwareExtra`

> `.enable`: Enable extra hardware functionality. True by default.  
> (Doesn't do anything by itself, it just unlocks the other options).  
> `.laptop`: Enable laptop software and tweaks.  
> `.wireless`: Enable wireless conectivity.

### `nixBuilds`

`nixBuilds`

> `.enable`: Enable nix remote builds.  
> `.isBuilder`: Set host as remote builder.  
> `.remoteHost`: Hostname of the remote builder.

### `virtualisation`

`v12n`

> `.enable`: Enable virtualisation programs and tools.

---

[^2]: Enables `ollama` service
