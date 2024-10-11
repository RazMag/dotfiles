{ pkgs, workMachine, ... }:

{
  programs.git = {
    enable = true;
    userEmail =
      if workMachine then
        "160501568+razm-neosec@users.noreply.github.com"
      else
        "46993372+RazMag@users.noreply.github.com";
    userName = if workMachine then "razm-neosec" else "razmag";
  };
}
