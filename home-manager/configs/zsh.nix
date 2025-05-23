{
  pkgs,
  attributes,
  flakeName,
  ...
}:

{
  programs.zsh = {
    enable = true;
    antidote = {
      enable = true;
      plugins = [
        "zsh-users/zsh-completions"
        "zsh-users/zsh-syntax-highlighting"
        "zsh-users/zsh-autosuggestions"
        "Aloxaf/fzf-tab"
        "sindresorhus/pure"
      ];
    };
    shellAliases = {
      ls = "ls --color";
      ll = "ls -l";
      cat = "bat";
      grep = "rg";
      upgrade =
        if builtins.elem "mac" attributes then
          "darwin-rebuild switch --flake ~/.config/nix#${flakeName}"
        else
          "sudo nixos-rebuild switch --flake ~/.config/nix#${flakeName}";
      ".." = "cd ..";
      update =
        if builtins.elem "mac" attributes then
          "nix flake update --flake \"/Users/rmagori/.config/nix\""
        else
          "";
    };
  };
}
