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
      pkgs.btop
      # Dev tools
      pkgs.nixfmt-rfc-style
      pkgs.nil
      pkgs.opentofu
      pkgs.kubectl
      pkgs.docker
      pkgs.linode-cli
      pkgs.mongosh
      pkgs.typescript
      pkgs.ollama
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
    zoxide = {
      enable = true;
      enableZshIntegration = true;
      options = [ "--cmd cd" ];
    };
  };
}