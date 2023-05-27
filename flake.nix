{
  description = "RedsonBr140's NixOS configuration files & home-manager.";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    # Based home-manager
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # Based PrismLauncher
    prismlauncher = {
      url = "github:PrismLauncher/PrismLauncher";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }@inputs: {
    # Available through 'nixos-rebuild --flake .#your-hostname'
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          ./system/configuration.nix
          home-manager.nixosModules.home-manager
        ];
      };
    };

    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
      users.redson = import ./home/home.nix;
      extraSpecialArgs = { inherit inputs; };
    };
  };
}
