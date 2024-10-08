{ pkgs, ... }:

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
      bat = "cat";
      grep = "rg";
      upgrade = "darwin-rebuild switch --flake ~/.config/nix#macbook";
      ".." = "cd ..";
    };
  };
}
