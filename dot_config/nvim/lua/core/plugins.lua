-- use {in manager

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-------------
require('packer').startup(
  function(use)
    -- Package manager

    use {'wbthomason/packer.nvim'} -- Package manager 
    use {'lewis6991/impatient.nvim'} --lazy loading

    --Github
    use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } }            -- Add git related info in the signs columns and pop ups

    -- QOL buffer changes 
    use {'numToStr/Comment.nvim'} -- "gc" to comment visual regions/lines
    use {'booperlv/nvim-gomove'}  --Move lines in a cool way
    use {'LunarWatcher/auto-pairs'} --auto pair
    use {'tpope/vim-surround'} -- change surrounding symbols ez "a"->(a)
    use {'chentoast/marks.nvim'} --better marks
    use {'alvan/vim-closetag'} --close html tags
    use {'ekickx/clipboard-image.nvim' } --:PasteImg to paste an image
    use {'ibhagwan/smartyank.nvim'}  --better yank
    use {'rlue/vim-barbaric'} -- for switching languages dynamically
    use { "NvChad/nvim-colorizer.lua" } --preview colors

    use {
      'vladdoster/remember.nvim',
      config = [[ require('remember') ]]
    } --remember buffer position

    use {
      'Pocco81/true-zen.nvim',
      config = function()
       require("true-zen").setup {}
      end,
      }

    -- use {
    --   'edluffy/hologram.nvim',
    -- }  

    -- Treesitter
    use {'nvim-treesitter/nvim-treesitter'} -- Highlight, edit, and navigate code
    use {'nvim-treesitter/nvim-treesitter-context'} -- Add function name/context
    use {
      'nvim-treesitter/nvim-treesitter-textobjects',
      after = { 'nvim-treesitter' }
    } -- Additional textobjects for treesitter

    -- LSP
    use {'neovim/nvim-lspconfig'} -- Collection of configurations for built-in LSP client 
    use {'onsails/lspkind.nvim'}
    use { "folke/lsp-colors.nvim" }


    use {'williamboman/mason.nvim'} -- Manage external editor tooling i.e LSP servers
    use {'williamboman/mason-lspconfig.nvim'} -- Automatically install language servers to stdpath

    --location, gps sucessor
    use {
       "SmiteshP/nvim-navic",
	requires = "neovim/nvim-lspconfig"
    }

    -- CMP and completion
    use {
      'hrsh7th/nvim-cmp',
      requires = { 'hrsh7th/cmp-nvim-lsp' }
    } -- Autocompletion

    use {
      'L3MON4D3/LuaSnip',
      requires = { 'saadparwaiz1/cmp_luasnip' }
    } -- Snippet Engine and Snippet Expansion

    use {'rafamadriz/friendly-snippets'} --extra snippets
    use {'hrsh7th/cmp-omni'} --general cmp completion 
    use {'hrsh7th/cmp-buffer'} --buffer completion 
    use {'hrsh7th/cmp-path'} --complete file paths
    use {'f3fora/cmp-spell'} --search dictionaries 
    use {'sedm0784/vim-you-autocorrect'} --autocorrect with spell

    -- GUI and UI
    -- Telescope

    use {
      'nvim-telescope/telescope.nvim',
      requires = { 'nvim-lua/plenary.nvim' }
    } -- Fuzzy Finder (files, lsp, etc)

    use {
      'nvim-telescope/telescope-fzf-native.nvim',
      run = 'make',
      cond = vim.fn.executable "make" == 1
    } -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available

    -- Themes
    use {'catppuccin/nvim', as = "catppuccin" }
    use {'rose-pine/neovim'}
    use {'shaunsingh/nord.nvim'}
    use {'folke/tokyonight.nvim'}
    use {'Mofiqul/dracula.nvim'}
    use {'ellisonleao/gruvbox.nvim'}
    use {'sainnhe/everforest'}
    use {'roosta/srcery'}

    use {
      'xiyaowong/nvim-transparent',
      require("transparent").setup({
	enable = true
      })
    }

    use {'goolord/alpha-nvim'} --startup screen

    use {'nvim-lualine/lualine.nvim'} -- Fancier statusline


    use {'lukas-reineke/indent-blankline.nvim'} -- Add indentation guides even on blank lines
    use {'tpope/vim-sleuth'} -- Detect tabstop and shiftwidth automatically


    --file manager 
    use {
      "nvim-neo-tree/neo-tree.nvim",
      requires = {
	"nvim-lua/plenary.nvim",
	"kyazdani42/nvim-web-devicons", -- not strictly required, but recommended 
	"MunifTanjim/nui.nvim",
      }
    }


    use {"NvChad/nvterm"} --floating term

    use {
      "folke/todo-comments.nvim",
      requires = "nvim-lua/plenary.nvim",
      config = function()
      require("todo-comments").setup{}
      end
      } --todo comments magic

    use {'mrjones2014/smart-splits.nvim' } --better spliting


    --folds that look nice
    use{ 'anuvyklack/pretty-fold.nvim',
      config = function()
	 require('pretty-fold').setup()
      end
    }

    --markdown previewing
    use{
	"iamcco/markdown-preview.nvim",
       run = function() vim.fn["mkdp#util#install"]() end,
    }
    use {'lervag/vimtex'} --latex completion and previewing

    --vim wiki, markdown collection
    use {'lervag/wiki.vim'}

    -- Which key
    use {
      "folke/which-key.nvim",
      config = function()
	require("which-key").setup {}
      end
       }

  end
)
