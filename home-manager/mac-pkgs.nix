{ lib, pkgs, mac, ... }:

if mac then {
  home = {
    packages = [
      pkgs.ice-bar
      pkgs.raycast
      pkgs.rectangle
      pkgs.jetbrains.pycharm-professional
    ];
  };
}
else {}