-- Key Mapping
local map = vim.api.nvim_set_keymap
options = { noremap = true }

vim.g.mapleader = ","

map("n", "<leader>v", ":vsplit<cr>", options)
map("n", "<leader>s", ":split<cr>", options)

map("n", "<leader>n", ":NvimTreeToggle<cr>", options)

