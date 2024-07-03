{ inputs, lib, hostname, ... }:
{
  imports = [
    ./dconf.nix
    ./environment
    ./nix
    ./nixpkgs
    ./polkit.nix
    ./xdg.nix
    ./impermanence.nix
  ]
  ++ (lib.lists.optionals (hostname == "Tanker") [
    ./jovian.nix
  ]);
}
