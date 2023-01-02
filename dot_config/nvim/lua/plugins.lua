-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

local is_bootstrap = false

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  is_bootstrap = true
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
  vim.cmd [[packadd packer.nvim]]
end
-------------
require('packer').startup(function(use)
  --##Package manager
  use 'lewis6991/impatient.nvim'  --lazy loading
  use 'wbthomason/packer.nvim'                                                         -- Package manager

  --##Github
  -- use 'tpope/vim-fugitive'                                                             -- Git commands in nvim
  -- use 'tpope/vim-rhubarb'                                                              -- Fugitive-companion to interact with github
  use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } }            -- Add git related info in the signs columns and pop ups

  --##QOL buffer changes 
  use 'numToStr/Comment.nvim'                                                          -- "gc" to comment visual regions/lines
  use 'booperlv/nvim-gomove'                                                            --Move lines in a cool way
  use 'LunarWatcher/auto-pairs' --auto pair
  use 'tpope/vim-surround' -- change surrounding symbols ez "a"->(a)
  use 'chentoast/marks.nvim' --better marks
  use 'alvan/vim-closetag' --close html tags
  use { 'vladdoster/remember.nvim', config = [[ require('remember') ]] } --remember buffer position
  use 'ekickx/clipboard-image.nvim' --:PasteImg to paste an image
  use 'https://github.com/ibhagwan/smartyank.nvim' --better yank
  use{ "Pocco81/true-zen.nvim",
    config = function()
      require("true-zen").setup {}
	end,
}


  --##treesitter
  use 'nvim-treesitter/nvim-treesitter'                                                -- Highlight, edit, and navigate code
  use { 'nvim-treesitter/nvim-treesitter-textobjects', after = { 'nvim-treesitter' } } -- Additional textobjects for treesitter

  --##LSP
  use 'neovim/nvim-lspconfig'                                                          -- Collection of configurations for built-in LSP client 
  use 'onsails/lspkind.nvim'

  use 'williamboman/mason.nvim'                                                        -- Manage external editor tooling i.e LSP servers
  use 'williamboman/mason-lspconfig.nvim'                                              -- Automatically install language servers to stdpath

  --##CMP and completion
  use { 'hrsh7th/nvim-cmp', requires = { 'hrsh7th/cmp-nvim-lsp' } }                    -- Autocompletion
  use { 'L3MON4D3/LuaSnip', requires = { 'saadparwaiz1/cmp_luasnip' } }                -- Snippet Engine and Snippet Expansion
  use 'rafamadriz/friendly-snippets' --extra snippets
  use 'hrsh7th/cmp-omni' --general cmp completion 
  use 'hrsh7th/cmp-buffer' --buffer completion 
  use 'hrsh7th/cmp-path' --complete file paths
  use 'f3fora/cmp-spell' --search dictionaries 
  use 'sedm0784/vim-you-autocorrect' --autocorrect with spell

  --#GUI and UI
  --##Telescope
  -- Fuzzy Finder (files, lsp, etc)
  use { 'nvim-telescope/telescope.nvim', branch = '0.1.x', requires = { 'nvim-lua/plenary.nvim' } }

  -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable "make" == 1 }

  --##Themes
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
  use 'roosta/srcery'

  use {
    'xiyaowong/nvim-transparent',
    require("transparent").setup({
      enable = true
    })
  }

  use 'goolord/alpha-nvim' --startup screen

  use 'nvim-lualine/lualine.nvim'                                                      -- Fancier statusline

  --location, gps sucessor
  use {
     "SmiteshP/nvim-navic",
      requires = "neovim/nvim-lspconfig"
  }

  --tabline duh
  use {
    'kdheepak/tabline.nvim',
    config = function()
     require'tabline'.setup {enable = false}
    end,
    requires = {'hoob3rt/lualine.nvim', 'kyazdani42/nvim-web-devicons'}
  }

  use 'lukas-reineke/indent-blankline.nvim'                                            -- Add indentation guides even on blank lines
  use 'tpope/vim-sleuth'                                                               -- Detect tabstop and shiftwidth automatically


  --file manager
  use {
  "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    }
  }

  use "NvChad/nvterm" --floating term

  --todo comments magic
  use {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
    require("todo-comments").setup{}
    end
    }

  use('mrjones2014/smart-splits.nvim') --better spliting

  --LSP warnings viewer
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup {
      }
    end
  }

  --folds that look nice
  use{ 'anuvyklack/pretty-fold.nvim',
    config = function()
       require('pretty-fold').setup()
    end
  }


  --## Previewing
  use 'ray-x/web-tools.nvim' --preview sites/js

  --markdown previewing
  use{
      "iamcco/markdown-preview.nvim",
     run = function() vim.fn["mkdp#util#install"]() end,
  }
  use 'lervag/vimtex' --latex completion and previewing

  --vim wiki, markdown collection
  use 'lervag/wiki.vim'

  --##Which key
  use {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup {}
    end
     }
------------
  if is_bootstrap then
    require('packer').sync()
  end
end)

if is_bootstrap then
  print '=================================='
  print '    Plugins are being installed'
  print '    Wait until Packer completes,'
  print '       then restart nvim'
  print '=================================='
  return
end
------------
-- Automatically source and re-compile packer whenever you save this init.lua
local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', {
  command = 'source <afile> | PackerCompile',
  group = packer_group,
  pattern = vim.fn.expand '$MYVIMRC',
})
