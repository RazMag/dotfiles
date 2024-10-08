{ config, pkgs, ... }:

{
  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;
  nix = {
    package = pkgs.nix;
    settings = {
      "extra-experimental-features" = [
        "nix-command"
        "flakes"
      ];
    };
  };
  # Create /etc/zshrc that loads the nix-darwin environment.
  programs = {
    zsh.enable = true; # default shell on catalina
  };

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 5;

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "aarch64-darwin";

  # Homebrew packages
  homebrew = {
    enable = true;
    casks = [
      "meetingbar"
      "proton-pass"
      "fork"
      "middleclick"
      "karabiner-elements"
      "zen-browser"
    ];
    onActivation = {
      cleanup = "zap";
      autoUpdate = true;
      upgrade = true;
    };
  };

  # Allowing non-free software
  nixpkgs.config.allowUnfree = true;

  # Mac system defaults
  system.defaults = {
    dock = {
      autohide = true;
      orientation = "left";
      show-recents = false;
      tilesize = 45;
      magnification = false;
      persistent-apps = [
        "/Applications/Zen Browser.app"
        "/Applications/Webex.app"
        "/Applications.Slack.app"
        pkgs.vscode
        pkgs.wezterm
        "/Applications/Proton Pass.app"
        pkgs.spotify
      ];
    };
    finder = {
      AppleShowAllExtensions = true;
      AppleShowAllFiles = true;
      ShowPathbar = true;
      FXEnableExtensionChangeWarning = false;
      FXPreferredViewStyle = "clmv";
      CreateDesktop = false;
    };
  };
}
