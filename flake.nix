{
  description = "Raz multi-system flake";

  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    };
    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-homebrew = {
      url = "github:zhaofengli-wip/nix-homebrew";
    };
    mac-app-util = {
      url = "github:hraban/mac-app-util";
    };
    nixos-wsl = {
      url = "github:nix-community/NixOS-WSL/main";
    };
    zen-browser ={
      url = "github:MarceColl/zen-browser-flake";
    };
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      nix-darwin,
      home-manager,
      nix-homebrew,
      mac-app-util,
      nixos-wsl,
      zen-browser,
    }:
    {
      # Build darwin flake using:
      # $ darwin-rebuild build --flake ~/.config/nix#macbook
      darwinConfigurations = {
        "macbook" = nix-darwin.lib.darwinSystem {
          system = "aarch64-darwin";
          modules = [
            ./darwin/configuration.nix
            mac-app-util.darwinModules.default
            home-manager.darwinModules.home-manager
            {
              home-manager = {
                backupFileExtension = "bkup";
                useGlobalPkgs = true;
                users.rmagori = import ./home-manager/home.nix;
                sharedModules = [
                  mac-app-util.homeManagerModules.default
                ];
                extraSpecialArgs = {
                  inherit inputs;
                  flakeName = "macbook";
                  attributes = [
                    "work"
                    "gui"
                    "mac"
                  ];
                };
              };
              users.users.rmagori.home = "/Users/rmagori";
            }
            nix-homebrew.darwinModules.nix-homebrew
            {
              nix-homebrew = {
                # Install Homebrew under the default prefix
                enable = true;
                # Apple Silicon Only: Also install Homebrew under the default Intel prefix for Rosetta 2
                enableRosetta = true;
                # User owning the Homebrew prefix
                user = "rmagori";
                # Automatically migrate existing Homebrew installations
                autoMigrate = true;
              };
            }
          ];
        };
      };

      nixosConfigurations = {
        "wsl" = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            nixos-wsl.nixosModules.default
            ./nixos-wsl/configuration.nix
            home-manager.nixosModules.home-manager 
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                users.raz = import ./home-manager/home.nix;
                extraSpecialArgs = {
                  inherit inputs;
                  flakeName = "wsl";
                  attributes = [];
                };
              };
            }
          ];
        };
        "pedro" = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./nixos/configuration.nix
            home-manager.nixosModules.home-manager 
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                users.raz = import ./home-manager/home.nix;
                extraSpecialArgs = {
                  inherit inputs;
                  flakeName = "pedro";
                  attributes = ["gui"];
                };
              };
            }
          ];
        };
      };
      # Expose the package set, including overlays, for convenience.
      # darwinPackages = self.darwinConfigurations."macbook".pkgs;
    };
}
