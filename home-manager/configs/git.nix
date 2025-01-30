{ pkgs, attributes, ... }:

{
  programs.git = {
    enable = true;
    userEmail =
      if builtins.elem "work" attributes then
        "rmagori@akamai.com"
      else
        "46993372+RazMag@users.noreply.github.com";
    userName = if builtins.elem "work" attributes then "Raz Magori" else "razmag";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };
}
