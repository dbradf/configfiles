local wezterm = require 'wezterm';

return {

    leader = { key="a", mods="CTRL", timeout_milliseconds=1000 },
    keys = {
        {key="\\", mods="LEADER", action=wezterm.action{SplitHorizontal={domain="CurrentPaneDomain"}}},
        {key="-", mods="LEADER", action=wezterm.action{SplitVertical={domain="CurrentPaneDomain"}}},
        {key="a", mods="LEADER|CTRL", action=wezterm.action{SendString="\x01"}},
    }
}
