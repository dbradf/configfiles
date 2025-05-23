local wezterm = require 'wezterm';

return {
    font = wezterm.font('JetBrains Mono'),
    font_size = 13.0,
    color_scheme = "Galaxy",
    default_cwd = "~",
    hide_tab_bar_if_only_one_tab = true,
    initial_cols = 120,
    initial_rows = 45,
    window_background_opacity = 0.90,
    window_close_confirmation = "NeverPrompt",

    leader = { key = "b", mods = "CTRL", timeout_milliseconds = 1000 },
    keys = {
        { key = "1",  mods = "LEADER",       action = wezterm.action { ActivateTab = 0 } },
        { key = "2",  mods = "LEADER",       action = wezterm.action { ActivateTab = 1 } },
        { key = "3",  mods = "LEADER",       action = wezterm.action { ActivateTab = 2 } },
        { key = "4",  mods = "LEADER",       action = wezterm.action { ActivateTab = 3 } },
        { key = "5",  mods = "LEADER",       action = wezterm.action { ActivateTab = 4 } },
        { key = "6",  mods = "LEADER",       action = wezterm.action { ActivateTab = 5 } },
        { key = "7",  mods = "LEADER",       action = wezterm.action { ActivateTab = 6 } },
        { key = "8",  mods = "LEADER",       action = wezterm.action { ActivateTab = 7 } },
        { key = "9",  mods = "LEADER",       action = wezterm.action { ActivateTab = 8 } },

        { key = "t",  mods = "LEADER",       action = wezterm.action { SpawnTab = "DefaultDomain" } },
        { key = "\\", mods = "LEADER",       action = wezterm.action { SplitHorizontal = { domain = "CurrentPaneDomain" } } },
        { key = "-",  mods = "LEADER",       action = wezterm.action { SplitVertical = { domain = "CurrentPaneDomain" } } },
        { key = "h",  mods = "LEADER",       action = wezterm.action { ActivatePaneDirection = "Left" } },
        { key = "j",  mods = "LEADER",       action = wezterm.action { ActivatePaneDirection = "Down" } },
        { key = "k",  mods = "LEADER",       action = wezterm.action { ActivatePaneDirection = "Up" } },
        { key = "l",  mods = "LEADER",       action = wezterm.action { ActivatePaneDirection = "Right" } },
        { key = "h",  mods = "LEADER|SHIFT", action = wezterm.action { AdjustPaneSize = { "Left", 5 } } },
        { key = "j",  mods = "LEADER|SHIFT", action = wezterm.action { AdjustPaneSize = { "Down", 5 } } },
        { key = "k",  mods = "LEADER|SHIFT", action = wezterm.action { AdjustPaneSize = { "Up", 5 } } },
        { key = "l",  mods = "LEADER|SHIFT", action = wezterm.action { AdjustPaneSize = { "Right", 5 } } },
        { key = "z",  mods = "LEADER",       action = "TogglePaneZoomState" },

        { key = "[",  mods = "LEADER",       action = "ActivateCopyMode" },
        { key = "a",  mods = "LEADER|CTRL",  action = wezterm.action { SendString = "\x01" } },
    }
}
