{ pkgs, config, ... }:
{
  boot = {
    consoleLogLevel = 1;
    kernelParams = ["split_lock_detect=off"]; 
/*     kernelParams = [ ]; */
    extraModulePackages = [];
    kernelPackages = pkgs.linuxPackages_xanmod;
    supportedFilesystems = [ "ntfs" "zfs" ];
    kernelModules = [ "udev" "xpadneo" ];
  };
}
