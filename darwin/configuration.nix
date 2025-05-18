{ config, pkgs, ... }:

{
  system.primaryUser = "rmagori";
  # Auto upgrade nix package and the daemon service.
  nix.enable = true;
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
    taps = [
      "razm-neosec/brew-tap"
    ];
    casks = [
      "meetingbar"
      "proton-pass"
      "fork"
      "middleclick"
      "karabiner-elements"
      "zen"
      "eloston-chromium"
      "razm-neosec/brew-tap/nosqlbooster-for-mongodb@7.1.21"
      "windows-app"
      "alt-tab"
      "raycast"
    ];
    brews = [
      "node"
      {
        name = "colima";
        start_service = true;
      }
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
      autohide = false;
      orientation = "left";
      show-recents = false;
      tilesize = 45;
      magnification = false;
      persistent-apps = [
        "/Applications/Zen.app"
        "/Applications/Webex.app"
        "/Applications/Slack.app"
        "/Applications/Microsoft Outlook.app"
        "/Users/rmagori/Applications/Home Manager Apps/Visual Studio Code.app"
        "/Users/rmagori/Applications/Home Manager Apps/WezTerm.app"
        "/Users/rmagori/Applications/Home Manager Apps/Bruno.app"
        "/Users/rmagori/Applications/Home Manager Apps/Spotify.app"
        "/Applications/Proton Pass.app"
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
