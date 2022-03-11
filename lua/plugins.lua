local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
  use "kyazdani42/nvim-web-devicons"

  use {'numToStr/Comment.nvim', config = "require('plugins.comment')"}

  use {"windwp/nvim-autopairs", config = "require('plugins.autopairs')"}

  use {"kyazdani42/nvim-tree.lua", config = "require('plugins.nvim-tree')"}

  use {"lukas-reineke/indent-blankline.nvim", config = "require('plugins.indentline')"}

  use {"akinsho/toggleterm.nvim", config = "require('plugins.toggleterm')"}
  use "voldikss/vim-floaterm"

  use {'stevearc/dressing.nvim', requires = 'MunifTanjim/nui.nvim', config = "require('plugins.dressing')"}

  -- status line
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = "require('plugins.lualine')"
  }

  use {'romgrk/barbar.nvim', config = "require('plugins.barbar')"}
  use "moll/vim-bbye"
  use "ahmedkhalf/project.nvim"
  use {"lewis6991/impatient.nvim", config = "require('plugins.impatient')"}
  use "goolord/alpha-nvim"
  use "antoinemadec/FixCursorHold.nvim" -- This is needed to fix lsp doc highlight
  use "folke/which-key.nvim"
  use {
    'iamcco/markdown-preview.nvim',
    run = function() vim.fn['mkdp#util#install']() end,
    ft = {'markdown'}
  }
  use "RRethy/vim-illuminate" -- highlight current word

  -- Colorschemes
  -- use "lunarvim/colorschemes" -- A bunch of colorschemes you can try out
  use "lunarvim/darkplus.nvim"
  use "morhetz/gruvbox"
  use "ghifarit53/tokyonight-vim"
  use "joshdick/onedark.vim"
  use "sainnhe/everforest"

  -- cmp plugins
  use {"hrsh7th/nvim-cmp", config = "require('plugins.cmp')"} -- The completion plugin
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "hrsh7th/cmp-nvim-lsp"

  -- snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  -- LSP
  use "neovim/nvim-lspconfig" -- enable LSP
  use "williamboman/nvim-lsp-installer" -- simple to use language server installer
  use "tamago324/nlsp-settings.nvim" -- language server settings defined in json for
  use "lukas-reineke/lsp-format.nvim"
  use { "jose-elias-alvarez/null-ls.nvim" }

  -- Trouble
  use {"folke/trouble.nvim", config = "require('plugins.trouble')"}

  -- Telescope
  use {'nvim-telescope/telescope.nvim',
      config = "require('plugins.telescope')",
      requires = {
        {'nvim-lua/popup.nvim'},
        {'nvim-lua/plenary.nvim'},
        {'nvim-telescope/telescope-fzf-native.nvim'}
      }
    }
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use {'cljoly/telescope-repo.nvim'}

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = "require('plugins.treesitter')",
  }
  use "JoosepAlviste/nvim-ts-context-commentstring"

  -- Git
  use {"lewis6991/gitsigns.nvim", config = "require('plugins.gitsigns')"}
  use "tpope/vim-fugitive"

  -- Dashboard
  use "mhinz/vim-startify"

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
