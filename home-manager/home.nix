{
  config,
  pkgs,
  ...
}:

{
  imports = [
    ./helix.nix
    ./git.nix
    ./wezterm.nix
    ./zsh.nix
  ];

  home = {
    stateVersion = "24.05";

    # Packages to install to user environment (from nixpkgs)
    packages = [
      pkgs.obsidian
      pkgs.bat
      pkgs.tlrc
      pkgs.nixfmt-rfc-style
      pkgs.opentofu
      pkgs.ice-bar
      pkgs.spotify
      pkgs.raycast
      pkgs.rectangle
      pkgs.fzf
      pkgs.wireguard-go
      pkgs.wireguard-tools
      pkgs.jetbrains.pycharm-professional
      pkgs.docker
      pkgs.nil
      pkgs.kubectl
    ];
  };

  programs = {
    atuin = {
      enable = true;
      enableZshIntegration = true;
    };
    thefuck = {
      enable = true;
      enableZshIntegration = true;
    };
    ripgrep = {
      enable = true;
    };
    vscode = {
      enable = true;
    };
  };
}
