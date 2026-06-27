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

> `.enable`: Create the nixy user  
> `.isGui`: Enable the gui modules for nixy [^1]  
> `.isServer`: Enable multiple services [^2]

### `gaming`

`gamingServer`

> `.enable`: Enable sunshine service  
> `.virtualDisplay`: If your server is headless and you have and AMD GPU you can enter the PCI address here. More info at [AMD Virtual Display](https://wiki.archlinux.org/title/AMDGPU#Virtual_display_on_headless_setups)

---

[^2]: Enables `ollama` service
