{
  description = "me when the flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-23.11";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    anyrun = {
      url = "github:Kirottu/anyrun";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland = {
      url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
    };
    xdg-desktop-portal-hyprland = {
      url = "github:hyprwm/xdg-desktop-portal-hyprland";
      inputs.nixpkgs.follows = "hyprland";
    };
    nh = {
      url = "github:viperML/nh";
      inputs.nixpkgs.follows = "nixpkgs"; # override this repo's nixpkgs snapshot
    };
    wayfreeze = {
      url = "github:jappie3/wayfreeze";
    };
    watershot = {
      url = "github:Kirottu/watershot";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    jovian-nixos = {
      url = "github:Jovian-Experiments/Jovian-NixOS";
    };
    disko = {
      url = "github:raidenovich/disko";
    };
    impermanence = {
      url = "github:nix-community/impermanence";
    };
  };

  outputs = inputs @ {
    nixpkgs,
    home-manager,
    disko,
    ...
  }: {
    nixosConfigurations.ShadowMoses = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = let username = "vaporsnake"; hostname = "ShadowMoses"; in {inherit inputs username hostname;};
      modules = [
        ./machines/ShadowMoses
        ./modules
        home-manager.nixosModules.home-manager
        # (import ./disko.nix {
        #    device = "/dev/nvme0n1";
        #  })
        # disko.nixosModules.disko
      ];
    };
    nixosConfigurations.Tanker = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = let username = "raiden"; hostname = "Tanker"; in {inherit inputs username hostname;};
      modules = [
        ./machines/Tanker
        ./modules
        home-manager.nixosModules.home-manager
        disko.nixosModules.disko
        (import ./disko.nix {
           device = "/dev/nvme0n1";
         })
        ./modules/core/other/impermanence.nix
      ];
    };
    nixosConfigurations.BigShell = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = let username = "liquid"; hostname = "BigShell"; in {inherit inputs username hostname;};
      modules = [
        ./machines/BigShell
        ./modules
        home-manager.nixosModules.home-manager
        disko.nixosModules.disko
        (import ./disko.nix {
           device = "/dev/nvme0n1";
         })
        ./modules/core/other/impermanence.nix
      ];
    };
    nixosConfigurations.jd = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = let username = "theabyssbar"; hostname = "jd"; in {inherit inputs username hostname;};
      modules = [
        ./machines/jd
        ./modules/self-host
        home-manager.nixosModules.home-manager
      ];
    };
  };
}
