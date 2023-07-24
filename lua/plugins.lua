-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use({ "wbthomason/packer.nvim" })

  -- IDK
  use({ "nvim-lua/plenary.nvim" })

  -- File explorer
  use({ "kyazdani42/nvim-web-devicons" })
  use({ "kyazdani42/nvim-tree.lua", config = function() require('plugins.nvim-tree') end })

  -- Coding utilities
  use({ 'numToStr/Comment.nvim', config = function() require('Comment').setup({}) end })
  use({ "windwp/nvim-autopairs", config = function() require('nvim-autopairs').setup({}) end })
  use({ "ray-x/lsp_signature.nvim", config = function() require('lsp_signature').setup({}) end })

  -- Git
  use({ "lewis6991/gitsigns.nvim", config = function() require('gitsigns').setup({}) end })

  -- Colorschemes
  use({
    "ellisonleao/gruvbox.nvim",
    "razcoen/fleet.nvim"
  })

  -- LSP Support
  use({
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    run = ":MasonUpdate"
  })

  -- Autocompletion
  use({ "hrsh7th/nvim-cmp", config = function() require('plugins.cmp') end })
  use({ "hrsh7th/cmp-buffer" })
  use({ "hrsh7th/cmp-path" })
  use({ "hrsh7th/cmp-cmdline" })
  use({ "hrsh7th/cmp-nvim-lsp" })
  use({ "hrsh7th/cmp-vsnip" })
  use({ "hrsh7th/vim-vsnip" })

  -- Sets the filetype to be helm
  use({ 'towolf/vim-helm' })

  -- Better go support
  use({
    'ray-x/go.nvim',
    config = function()
      require('go').setup({
        luasnip = true,
        textobjects = false,
      })
    end,
    requires = {
      'ray-x/guihua.lua',
      'neovim/nvim-lspconfig',
      'nvim-treesitter/nvim-treesitter'
    }
  })

  -- Telescope
  use({
    'nvim-telescope/telescope.nvim',
    config = function() require('plugins.telescope') end,
    requires = {
      { 'nvim-lua/plenary.nvim' },
    }
  })

  -- Treesitter
  use({
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = function() require('plugins.treesitter') end,
  })

end)
