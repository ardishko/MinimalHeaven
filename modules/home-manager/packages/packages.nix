{
  pkgs,
  inputs,
  lib,
  ...
}: {
  # Define your packages here and everything related.

  home.packages = with pkgs; [
    # Define packages that derive from inputs
    git
    fastfetch
  ];

  # List of packages end here

  # scripts

  # Permitted Insecure Packages and Steam gamescope workaround found at: https://github.com/NixOS/nixpkgs/issues/162562#issuecomment-1523177264
  nixpkgs = {
    config = {
      permittedInsecurePackages = [
        "electron-25.9.0"
        "python-2.7.18.7"
        "electron-19.1.9"
      ];
      allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) ["davinci-resolve"];
      allowUnfree = true;
      allowBroken = true;
    };
  };
}
