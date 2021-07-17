local lspconfig = require('lspconfig')
local lspinstall = require('lspinstall')
local completion = require('completion')

local on_attach = function(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    local opts = { noremap = true, silent = true }

    buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
    buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
    buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
    buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
    buf_set_keymap('n', '<leader>ga', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)

    buf_set_keymap('i', '<tab>', 'pumvisible() ? "\\<C-n>" : "\\<tab>"', {expr = true})
    buf_set_keymap('i', '<S-tab>', 'pumvisible() ? "\\<C-p>" : "\\<tab>"', {expr = true})

    completion.on_attach(client, bufnr)
end

lspinstall.setup()

local servers = lspinstall.installed_servers()
for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup({
        on_attach = on_attach,
        flags = {
            debounce_text_changes = 150,
        }
    })
end

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = true,
	signs = true,
	update_in_insert = true,
    }
)

-- rust 
require('rust-tools').setup({})
require('rust-tools.inlay_hints').set_inlay_hints()
require('rust-tools.runnables').runnables()

