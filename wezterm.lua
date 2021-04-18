local wezterm = require 'wezterm';

return {
    color_scheme = "LiquidCarbon",

    leader = { key="a", mods="CTRL", timeout_milliseconds=1000 },
    keys = {
        {key="1", mods="LEADER", action=wezterm.action{ActivateTab=0}},
        {key="2", mods="LEADER", action=wezterm.action{ActivateTab=1}},
        {key="3", mods="LEADER", action=wezterm.action{ActivateTab=2}},
        {key="4", mods="LEADER", action=wezterm.action{ActivateTab=3}},
        {key="5", mods="LEADER", action=wezterm.action{ActivateTab=4}},
        {key="6", mods="LEADER", action=wezterm.action{ActivateTab=5}},
        {key="7", mods="LEADER", action=wezterm.action{ActivateTab=6}},
        {key="8", mods="LEADER", action=wezterm.action{ActivateTab=7}},
        {key="9", mods="LEADER", action=wezterm.action{ActivateTab=8}},

        {key="t", mods="LEADER", action=wezterm.action{SpawnTab="DefaultDomain"}},
        {key="\\", mods="LEADER", action=wezterm.action{SplitHorizontal={domain="CurrentPaneDomain"}}},
        {key="-", mods="LEADER", action=wezterm.action{SplitVertical={domain="CurrentPaneDomain"}}},
        {key="a", mods="LEADER|CTRL", action=wezterm.action{SendString="\x01"}},
    }
}
