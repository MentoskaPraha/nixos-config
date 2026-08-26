{
  description = "My NixOS Configurations.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:nixos/nixos-hardware/master";
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    plasma-manager = {
      url = "github:nix-community/plasma-manager/trunk";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
    nix-vscode-extensions = {
      url = "github:nix-community/nix-vscode-extensions/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { 
    nixpkgs, 
    nixos-hardware, 
    nix-flatpak, 
    home-manager, 
    plasma-manager, 
    nix-vscode-extensions, 
    ... 
  }@inputs: {
    nixosConfigurations = {
      MP-Laptop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          nixos-hardware.nixosModules.framework-intel-core-ultra-series1
          ./machines/laptop
          nix-flatpak.nixosModules.nix-flatpak
          ./system
          home-manager.nixosModules.default {
            home-manager = {
              useGlobalPkgs = true;
              extraSpecialArgs = { inherit inputs; };
              sharedModules = [ plasma-manager.homeModules.plasma-manager ];
              users.filip = {
                imports = [
                  ./user
                  ./devices/touchpad.nix
                ];
              };
            };
          }
        ];
      };
      MP-PC = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          ./machines/pc
          nix-flatpak.nixosModules.nix-flatpak
          ./system
          home-manager.nixosModules.default {
            home-manager = {
              useGlobalPkgs = true;
              extraSpecialArgs = { inherit inputs; };
              sharedModules = [ plasma-manager.homeModules.plasma-manager ];
              users.filip = {
                imports = [
                  ./user
                  ./devices/mouse.nix
                ];
              };
            };
          }
        ];
      };
    };
  };
}
