{ lib, pkgs, attributes, ...}:

# Packages to install on machines with a GUI
if builtins.elem "gui" attributes then {
  imports = [
    ./configs/wezterm.nix
  ];

  home = {
    packages = [
      pkgs.spotify
      pkgs.localsend
    ];
  };

  programs = {
    vscode = {
        enable = true;
      };
  };
}
else {}