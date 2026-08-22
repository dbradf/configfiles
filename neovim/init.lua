local cmd = vim.cmd

vim.g.mapleader = ","

require('settings')
require('plugins')

require('keymap')
require('lsp_config')

vim.g.nord_contrast = true
vim.g.nord_borders = true

require("mason").setup()
require("nord").set()
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
        follow_current_file = { eanbled = true },
    }
}

local ts_parsers = {
    "bash",
     "c",
     "dockerfile",
     "fish",
     "git_config",
     "git_rebase",
     "gitattributes",
     "gitcommit",
     "gitignore",
     "go",
     "gomod",
     "gosum",
     "html",
     "javascript",
     "json",
     "lua",
     "make",
     "markdown",
     "python",
     "rust",
     "sql",
     "toml",
     "tsx",
     "typescript",
     "typst",
     "vim",
     "yaml",
     "zig",
}
local nts = require("nvim-treesitter")
nts.install(ts_parsers)
vim.api.nvim_create_autocmd("PackChanged", {
    callback = function() nts.update() end
})
