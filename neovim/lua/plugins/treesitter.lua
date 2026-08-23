vim.api.nvim_create_autocmd("PackChanged", {
  callback = function(ev)
    if ev.data.spec.name == "nvim-treesitter" then
      vim.cmd("TSUpdate")
    end
  end,
})

vim.pack.add({
  "https://github.com/neovim-treesitter/treesitter-parser-registry",
  "https://github.com/nvim-treesitter/nvim-treesitter",
})

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

nts.setup({
  ensure_installed = ts_parsers,
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  ident = { enable = true },
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil,
  },
})

nts.install(ts_parsers)
vim.api.nvim_create_autocmd("PackChanged", {
  callback = function()
    nts.update()
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = ts_parsers,
  callback = function()
    vim.treesitter.start()
    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})

vim.wo.foldmethod = "expr"
vim.wo.foldexpr = "nvim_treesitter#foldexpr()"
