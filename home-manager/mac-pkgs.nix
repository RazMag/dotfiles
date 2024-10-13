{ lib, pkgs, attributes, ... }:

if builtins.elem "mac" attributes then {
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