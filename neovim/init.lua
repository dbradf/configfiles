local cmd = vim.cmd

vim.g.mapleader = ","

require('config.settings')
require('plugins')
require('config.keymap')
require('config.color_scheme')

cmd("filetype plugin indent on")

-- local ts = require 'nvim-treesitter.configs'
-- ts.setup {ensure_installed = 'maintained', highlight = {enable = true}}

require('lualine').setup {
    options = {
        theme = "nord"
    }
}

require('neo-tree').setup {
    close_if_last_window = true,
    filesystem = {
        follow_current_file = { enabled = true },
    }
}


