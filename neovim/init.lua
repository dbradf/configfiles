local cmd = vim.cmd

require('plugins')

cmd('PackerInstall')

require('settings')
require('keymap')
require('lsp_config')

cmd("colorscheme aurora")
cmd("filetype plugin indent on")

local ts = require 'nvim-treesitter.configs'
ts.setup {ensure_installed = 'maintained', highlight = {enable = true}}

require('lualine').setup()

