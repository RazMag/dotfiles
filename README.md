# Multi Machine Flake
This is my private flake configuration for my computers

## Current Machines
 - macbook: Work issues macbook running nix-darwin.
 - wsl: A wsl [NixOS-WSL](https://github.com/nix-community/NixOS-WSL) machine running on my main windows machine.
 - pedro: Personal laptop, running KDE currently. 

## Outputs
Flake outputs (`nix flake show`):
```
.
├───darwinConfigurations: unknown (nix-darwin configuration)
├───darwinPackages: unknown (nix-darwin default included output)
└───nixosConfigurations
    ├───pedro: NixOS configuration
    └───wsl: NixOS configuration
```
