{ pkgs, attributes, ... }:

{
  programs.git = {
    enable = true;
    userEmail =
      if builtins.elem "work" attributes then
        "160501568+razm-neosec@users.noreply.github.com"
      else
        "46993372+RazMag@users.noreply.github.com";
    userName = if builtins.elem "work" attributes then "razm-neosec" else "razmag";
  };
}
