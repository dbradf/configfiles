-- Options
local opt = vim.opt
local wo = vim.wo
local bo = vim.bo

opt.autoread = true  -- automatically read files changed outside of vim.
opt.errorbells = false  -- don't beep on errors.
opt.laststatus = 2

opt.scrolloff = 3   -- Scroll 3 lines from the edge.
opt.hlsearch = true  -- Highlight search terms.
opt.incsearch  = true  -- Incremental search.

opt.showmatch = true  -- Show matching brackets.
opt.matchtime = 3  -- How long to blick matching brackets for (1/10 of sec).

opt.completeopt = "menuone,noinsert,noselect"
opt.updatetime = 300
opt.signcolumn = "yes"

opt.termguicolors = true
-- opt.syntax on   -- Turn on syntax highlighting.
-- syntax enable
-- syntax sync fromstart  -- Determine syntax highlighting from start of file.

wo.number = true  -- Show line numbers.
opt.lazyredraw = true -- Lazy redraw of macros.

opt.backspace = "indent,eol,start"   -- Allow backspacing over everything.

bo.tabstop = 4
bo.shiftwidth = 4
bo.expandtab = true

