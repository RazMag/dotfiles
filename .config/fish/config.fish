source /usr/share/cachyos-fish-config/cachyos-config.fish

# overwrite greeting
# potentially disabling fastfetch
#function fish_greeting
#    # smth smth
#end

# Interactive block
if status is-interactive
    alias hx="helix"
    atuin init fish | source
    zoxide init fish --cmd cd | source
end
