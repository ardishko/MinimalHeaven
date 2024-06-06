{
  pkgs,
  options,
  ...
}: {
  environment.systemPackages = with pkgs; [
    bash
    neovim
  ];
}
