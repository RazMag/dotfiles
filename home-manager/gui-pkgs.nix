{ lib, pkgs, gui, ...}:

# Packages to install on machines with a GUI
if gui then {
  imports = [
    ./configs/wezterm.nix
  ];

  home = {
    packages = [
      pkgs.spotify
      pkgs.obsidian
    ];
  };

  programs = {
    vscode = {
        enable = true;
      };
  };
}
else {}