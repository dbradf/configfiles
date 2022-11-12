local cmd = vim.cmd
local execute = vim.api.nvim_command
local fn = vim.fn

-- bootstrap packer if it is not installed.
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
    execute 'packadd packer.vim'
end

cmd('autocmd BufWritePost plugins.lua PackerCompile')

return require('packer').startup(function() 
    use 'wbthomason/packer.nvim'

    use 'kyazdani42/nvim-web-devicons'
    use 'kyazdani42/nvim-tree.lua'

    use 'nvim-treesitter/nvim-treesitter'

    use 'williamboman/mason.nvim'    
    use 'williamboman/mason-lspconfig.nvim'

    use 'neovim/nvim-lspconfig' 
    use 'ray-x/lsp_signature.nvim'
    use 'simrat39/rust-tools.nvim'

    use {
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
    }

    use {
        'hoob3rt/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons', opt = true}
    }

    use 'shaunsingh/nord.nvim'

     -- Completion framework:
     use 'hrsh7th/nvim-cmp' 

     -- LSP completion source:
     use 'hrsh7th/cmp-nvim-lsp'
 
     -- Useful completion sources:
     use 'hrsh7th/cmp-nvim-lua'
     use 'hrsh7th/cmp-nvim-lsp-signature-help'
     use 'hrsh7th/cmp-vsnip'                             
     use 'hrsh7th/cmp-path'                              
     use 'hrsh7th/cmp-buffer'                            
     use 'hrsh7th/vim-vsnip'          
end)
