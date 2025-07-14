{ lib, hostname, ... }:
{
  imports = [
    ./blueman.nix
    ./hyprland.nix
    ./opengl.nix
    ./sddm.nix
  ];
}
