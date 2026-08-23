vim.pack.add({
  -- shared deps
  "https://github.com/nvim-lua/plenary.nvim",

  -- neo-tree
  "https://github.com/nvim-tree/nvim-web-devicons",
  "https://github.com/MunifTanjim/nui.nvim",
  "https://github.com/nvim-neo-tree/neo-tree.nvim",

  "https://github.com/ray-x/lsp_signature.nvim",

  "https://github.com/nvim-lua/popup.nvim",
  "https://github.com/nvim-telescope/telescope.nvim",

  -- Lua line
  "https://github.com/hoob3rt/lualine.nvim",

  -- Completion framework:
  "https://github.com/hrsh7th/nvim-cmp",

  -- LSP completion source:
  "https://github.com/hrsh7th/cmp-nvim-lsp",

  -- Useful completion sources:
  "https://github.com/hrsh7th/cmp-nvim-lua",
  "https://github.com/hrsh7th/cmp-nvim-lsp-signature-help",
  "https://github.com/hrsh7th/cmp-vsnip",
  "https://github.com/hrsh7th/cmp-path",
  "https://github.com/hrsh7th/cmp-buffer",
  "https://github.com/hrsh7th/vim-vsnip",
})

require("plugins.treesitter")
require("plugins.lsp_config")
require("plugins.comment")
require("plugins.formatting")
