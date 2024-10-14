{ pkgs, ...}:

# Packages to install on all machines
{
  imports = [
    ./configs/helix.nix
    ./configs/git.nix
    ./configs/zsh.nix
  ];

  home = {
    packages = [
      # General tools
      pkgs.bat
      pkgs.tlrc
      pkgs.wireguard-tools
      pkgs.fzf
      pkgs.wget
      # Dev tools
      pkgs.nixfmt-rfc-style
      pkgs.opentofu
      pkgs.nil
      pkgs.kubectl
      pkgs.docker
      # Python
      pkgs.python3
      pkgs.virtualenv
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
  };
}