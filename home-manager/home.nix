{
  config,
  pkgs,
  ...
}:

{
  imports = [
    ./global-pkgs.nix
    ./gui-pkgs.nix
    ./mac-pkgs.nix
  ];

  home = {
    stateVersion = "24.05";
  };
  programs.home-manager.enable = true;
}
