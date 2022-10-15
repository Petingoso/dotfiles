-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  is_bootstrap = true
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
  vim.cmd [[packadd packer.nvim]]
end

-- stylua: ignore start
require('packer').startup(function(use)
  use 'lewis6991/impatient.nvim'
  use 'wbthomason/packer.nvim'                                                         -- Package manager
  use 'tpope/vim-fugitive'                                                             -- Git commands in nvim
  use 'tpope/vim-rhubarb'                                                              -- Fugitive-companion to interact with github
  use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } }            -- Add git related info in the signs columns and popups
  use 'numToStr/Comment.nvim'                                                          -- "gc" to comment visual regions/lines
  use 'nvim-treesitter/nvim-treesitter'                                                -- Highlight, edit, and navigate code
  use { 'nvim-treesitter/nvim-treesitter-textobjects', after = { 'nvim-treesitter' } } -- Additional textobjects for treesitter
  use 'neovim/nvim-lspconfig'                                                          -- Collection of configurations for built-in LSP client 
  use'onsails/lspkind.nvim'

  use 'williamboman/mason.nvim'                                                        -- Manage external editor tooling i.e LSP servers
  use 'williamboman/mason-lspconfig.nvim'                                              -- Automatically install language servers to stdpath
  use { 'hrsh7th/nvim-cmp', requires = { 'hrsh7th/cmp-nvim-lsp' } }                    -- Autocompletion
  use { 'L3MON4D3/LuaSnip', requires = { 'saadparwaiz1/cmp_luasnip' } }                -- Snippet Engine and Snippet Expansion
  use 'rafamadriz/friendly-snippets'

  use {
 	"catppuccin/nvim",
 	as = "catppuccin",
	config = function()
		vim.g.catppuccin_flavour = "macchiato" -- latte, frappe, macchiato, mocha
		require("catppuccin").setup()
	end
   }
  use 'mjlbach/onedark.nvim'                                                           -- Theme inspired by Automatically
  use 'shaunsingh/nord.nvim'
  use 'folke/tokyonight.nvim'
  use 'Mofiqul/dracula.nvim'
  use 'ellisonleao/gruvbox.nvim'
  use 'sainnhe/everforest'

  use 'goolord/alpha-nvim'

  use 'nvim-lualine/lualine.nvim'                                                      -- Fancier statusline
  use {
    'kdheepak/tabline.nvim',
    config = function()
     require'tabline'.setup {enable = false}
    end,
    requires = {'hoob3rt/lualine.nvim', 'kyazdani42/nvim-web-devicons'}
  }
  use 'lukas-reineke/indent-blankline.nvim'                                            -- Add indentation guides even on blank lines
  use 'tpope/vim-sleuth'                                                               -- Detect tabstop and shiftwidth automatically
  use 'booperlv/nvim-gomove'                                                           --Move lines in a cool way

  -- Fuzzy Finder (files, lsp, etc)
  use { 'nvim-telescope/telescope.nvim', branch = '0.1.x', requires = { 'nvim-lua/plenary.nvim' } }

  -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable "make" == 1 }

  use {
  "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    }
  }

  use "NvChad/nvterm"

  use {
     "SmiteshP/nvim-navic",
      requires = "neovim/nvim-lspconfig"
  }

  use {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
    require("todo-comments").setup{}
    end
    }
  use 'jiangmiao/auto-pairs'
  use 'tpope/vim-surround'
  use {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup {}
    end
     }
  use 'alvan/vim-closetag'
  use('mrjones2014/smart-splits.nvim')
  use 'chentoast/marks.nvim'
  use{ 'anuvyklack/pretty-fold.nvim',
    config = function()
       require('pretty-fold').setup()
    end
  }
  use({ 'vladdoster/remember.nvim', config = [[ require('remember') ]] })
  use 'ray-x/web-tools.nvim'
-- Packer
-- use({
--   "folke/noice.nvim",
--   requires = {
--     "MunifTanjim/nui.nvim",
--     "rcarriga/nvim-notify",
--     }
-- })

use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
})

  use 'lervag/wiki.vim'


  -- Lua
use {
  "folke/trouble.nvim",
  requires = "kyazdani42/nvim-web-devicons",
  config = function()
    require("trouble").setup {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  end
}

  use 'lervag/vimtex'
  use 'xuhdev/vim-latex-live-preview'
  use 'hrsh7th/cmp-omni'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'

  if is_bootstrap then
    require('packer').sync()
  end
end)
-- stylua: ignore end

-- When we are bootstrapping a configuration, it doesn't
-- make sense to execute the rest of the init.lua.
--
-- You'll need to restart nvim, and then it will work.
if is_bootstrap then
  print '=================================='
  print '    Plugins are being installed'
  print '    Wait until Packer completes,'
  print '       then restart nvim'
  print '=================================='
  return
end

-- Automatically source and re-compile packer whenever you save this init.lua
local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', {
  command = 'source <afile> | PackerCompile',
  group = packer_group,
  pattern = vim.fn.expand '$MYVIMRC',
})
