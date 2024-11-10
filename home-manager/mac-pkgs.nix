{ lib, pkgs, attributes, ... }:

if builtins.elem "mac" attributes then {
  home = {
    packages = [
      pkgs.ice-bar # Top bar organisation
      pkgs.raycast # Spotlight alternative
      pkgs.rectangle # Window manager
      pkgs.jetbrains.pycharm-professional # Work IDE
      pkgs.colima # Docker runtime
    ];
  };
}
else {}