source /usr/share/cachyos-fish-config/cachyos-config.fish

# overwrite greeting
# potentially disabling fastfetch
#function fish_greeting
#    # smth smth
#end

if status --is-interactive
    # Aliases
    alias hx="helix"
    alias cat="bat"

    # Integrations
    atuin init fish | source
    zoxide init fish --cmd cd | source
end
