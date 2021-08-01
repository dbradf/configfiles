-- Key Mapping
local map = vim.api.nvim_set_keymap
options = { noremap = true }

vim.g.mapleader = ","

map("n", "<leader>v", ":vsplit<cr>", options)
map("n", "<leader>s", ":split<cr>", options)

-- Plugin keymaps
map("n", "<leader>n", ":NvimTreeToggle<cr>", options)
map("n", "<leader>ff", ":Telescope find_files<cr>", options)
map("n", "<leader>fb", ":Telescope buffers<cr>", options)
map("n", "<leader>fg", ":Telescope live_grep<cr>", options)

