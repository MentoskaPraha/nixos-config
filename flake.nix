{
  description = "My NixOS Configurations.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:nixos/nixos-hardware/master";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-vscode-extensions = {
      url = "github:nix-community/nix-vscode-extensions";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, nixos-hardware, home-manager, nix-vscode-extensions, ... }@inputs: {
    nixosConfigurations = {
      MP-Laptop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          nixos-hardware.nixosModules.framework-intel-core-ultra-series1
          ./machines/laptop/default.nix
          ./system/base.nix
          ./system/network.nix
          ./system/user.nix
          ./system/programs.nix
          ./system/desktop.nix
          home-manager.nixosModules.default {
            home-manager = {
              useGlobalPkgs = true;
              extraSpecialArgs = { inherit inputs; };
              users.filip = import ./user/default.nix;
            };
          }
        ];
      };
    };
  };
}
