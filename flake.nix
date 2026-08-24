{
  description = "My NixOS Configurations.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:nixos/nixos-hardware/master";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
    nix-vscode-extensions = {
      url = "github:nix-community/nix-vscode-extensions";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, nixos-hardware, home-manager, plasma-manager, nix-vscode-extensions, ... }@inputs: {
    nixosConfigurations = {
      MP-Laptop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          nixos-hardware.nixosModules.framework-intel-core-ultra-series1
          ./machines/laptop/default.nix
          ./system/default.nix
          home-manager.nixosModules.default {
            home-manager = {
              useGlobalPkgs = true;
              extraSpecialArgs = { inherit inputs; };
              sharedModules = [ plasma-manager.homeModules.plasma-manager ];
              users.filip = import [
                ./user/default.nix
                #./machines/laptop/desktop.nix
              ];
            };
          }
        ];
      };
    };
  };
}
