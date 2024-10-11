{ pkgs, ... }:

{
  programs.wezterm = {
    enable = true;
    extraConfig = ''
      return {
        color_scheme = 'Gruvbox dark, hard (base16)',
        front_end = "WebGpu",
        font = wezterm.font 'JetBrains Mono',
        font_size = 12.5,
        use_fancy_tab_bar = false,
        enable_tab_bar = fasle,
        hide_tab_bar_if_only_one_tab = true,
        keys = {
          -- Make Option-Left equivalent to Alt-b which many line editors interpret as backward-word
          {key="LeftArrow", mods="OPT", action=wezterm.action{SendString="\x1bb"}},
          -- Make Option-Right equivalent to Alt-f; forward-word
          {key="RightArrow", mods="OPT", action=wezterm.action{SendString="\x1bf"}},
        }
      }
    '';
  };
}
