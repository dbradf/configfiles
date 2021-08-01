local cmd = vim.cmd

require('plugins')

cmd('PackerInstall')

require('settings')
require('keymap')
require('lsp_config')

vim.g.nord_contrast = true
vim.g.nord_borders = true

require("nord").set()
cmd("filetype plugin indent on")

local ts = require 'nvim-treesitter.configs'
ts.setup {ensure_installed = 'maintained', highlight = {enable = true}}

require('lualine').setup {
    options = {
        theme = "nord"
    }
}

