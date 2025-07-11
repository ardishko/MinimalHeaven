{ pkgs, ... }:
{
  # Define your hostname.
  networking.hostName = "Kamurocho";
  networking.hostId = "1da2fa41"; # required for zfs

  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Istanbul";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "tr_TR.UTF-8";
    LC_IDENTIFICATION = "tr_TR.UTF-8";
    LC_MEASUREMENT = "tr_TR.UTF-8";
    LC_MONETARY = "tr_TR.UTF-8";
    LC_NAME = "tr_TR.UTF-8";
    LC_NUMERIC = "tr_TR.UTF-8";
    LC_PAPER = "tr_TR.UTF-8";
    LC_TELEPHONE = "tr_TR.UTF-8";
    LC_TIME = "tr_TR.UTF-8";
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.majima = {
    isNormalUser = true;
    description = "majima";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    # packages = with pkgs; [
    # ];
    shell = pkgs.nushell;
  };

  # Define a user account. Don't forget to set a password by creating an encrypted file at the relevant location.
  # users.users.${username} = {
  #   isNormalUser = true;
  #   description = "${username}";
  #   extraGroups = [
  #     "networkmanager"
  #     "wheel"
  #   ];
  #   packages = [ ];
  #   shell = pkgs.nushell;
  # };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?

  services = {
    power-profiles-daemon.enable = true;
  };
}
