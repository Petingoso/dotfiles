--code to kickstart lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
-------------

local plugins = {
	--Github
	{
	"lewis6991/gitsigns.nvim", 
    	dependencies = {
		"nvim-lua/plenary.nvim",
		},
	}, 
	--QOL buffer changes 
	{'numToStr/Comment.nvim'}, -- "gc" to comment visual regions/lines
	{'booperlv/nvim-gomove'},  --Move lines in a cool way
	{'LunarWatcher/auto-pairs'}, --auto pair
 	{'tpope/vim-surround'}, -- change surrounding symbols ez "a"->(a)
 	{'chentoast/marks.nvim'}, --better marks
 	{'alvan/vim-closetag'}, --close html tags
 	{'ekickx/clipboard-image.nvim' }, --:PasteImg to paste an image
 	{'ibhagwan/smartyank.nvim'},  --better yank
 	{'rlue/vim-barbaric'}, -- for switching languages dynamically
 	{"NvChad/nvim-colorizer.lua" }, --preview colors 
	{
	'vladdoster/remember.nvim',
	config = [[ require('remember') ]]
    	}, --remember buffer position

    	{
      	'Pocco81/true-zen.nvim',
      	config = function()
       	require("true-zen").setup {}
      	end
      	},

    -- use {
    --   'edluffy/hologram.nvim',
    -- }  

	-- Treesitter
	{'nvim-treesitter/nvim-treesitter'}, -- Highlight, edit, and navigate code
	{'nvim-treesitter/nvim-treesitter-context'}, -- Add function name/context
	{
      	'nvim-treesitter/nvim-treesitter-textobjects',
      	--after = { 'nvim-treesitter' }
    	}, -- Additional textobjects for treesitter

    	-- LSP
	{'neovim/nvim-lspconfig'}, -- Collection of configurations for built-in LSP client 
	{'onsails/lspkind.nvim'},
	{ "folke/lsp-colors.nvim" },

	{"mfussenegger/nvim-dap"}, --debugging protocol
	{"rcarriga/nvim-dap-ui"},

	{'williamboman/mason.nvim'}, -- Manage external editor tooling i.e LSP servers
	{'williamboman/mason-lspconfig.nvim'}, -- Automatically install language servers to stdpath
	{'jay-babu/mason-nvim-dap.nvim'}, --mason for dap

	-- {'mfussenegger/nvim-lint'},
	{'mhartington/formatter.nvim'}, -- formatter config

    --location, gps sucessor
	{
       	"SmiteshP/nvim-navic",
	dependencies = "neovim/nvim-lspconfig"
	},

    	-- CMP and completion
	{
	'hrsh7th/nvim-cmp',
	dependencies = { 'hrsh7th/cmp-nvim-lsp' }
	}, -- Autocompletion

	{
	'L3MON4D3/LuaSnip',
	dependencies = { 'saadparwaiz1/cmp_luasnip' }
	}, -- Snippet Engine and Snippet Expansion

	{'rafamadriz/friendly-snippets'}, --extra snippets
	{'hrsh7th/cmp-omni'}, --general cmp completion 
	{'hrsh7th/cmp-buffer'}, --buffer completion 
	{'hrsh7th/cmp-path'}, --complete file paths
	{'f3fora/cmp-spell'}, --search dictionaries 
	{'sedm0784/vim-you-autocorrect'}, --autocorrect with spell

	-- GUI and UI
    -- Telescope

	{
      	'nvim-telescope/telescope.nvim',
      	dependencies = { 'nvim-lua/plenary.nvim' }
    	}, -- Fuzzy Finder (files, lsp, etc)

	{
      	'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
	cond = vim.fn.executable "make" == 1
    	}, -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available

    -- Themes
    	{'catppuccin/nvim', name = "catppuccin" },
    	{'rose-pine/neovim'},
    	{'shaunsingh/nord.nvim'},
    	{'folke/tokyonight.nvim'},
    	{"ericbn/vim-solarized"},
    	{'ellisonleao/gruvbox.nvim'},
	{'sainnhe/everforest'},
    	{'roosta/srcery'},

    	{'xiyaowong/nvim-transparent'},

    	{'goolord/alpha-nvim'}, --startup screen

    	{'nvim-lualine/lualine.nvim'}, -- Fancier statusline


    	{'lukas-reineke/indent-blankline.nvim'}, -- Add indentation guides even on blank lines
    	{'tpope/vim-sleuth'}, -- Detect tabstop and shiftwidth automatically


    --file manager 
	{"kevinhwang91/rnvimr"},

	{
      	"nvim-neo-tree/neo-tree.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"kyazdani42/nvim-web-devicons", -- not strictly required, but recommended 
		"MunifTanjim/nui.nvim",
      			}
    	},



	-- {"NvChad/nvterm"}, --floating term
	{"voldikss/vim-floaterm"}, --toggle term

	{
      	"folke/todo-comments.nvim",
      	dependencies = "nvim-lua/plenary.nvim",
      	config = function()
      	require("todo-comments").setup{}
      	end
      	}, --todo comments magic

	{'mrjones2014/smart-splits.nvim' }, --better spliting
	{
	 "anuvyklack/windows.nvim",
	 dependencies = {
	    "anuvyklack/middleclass"},
	 config = function()
	    require('windows').setup()
	 end
 	},


    --folds that look nice
	{
	'anuvyklack/pretty-fold.nvim',
	config = function()
	require('pretty-fold').setup()
	end
	},

    --markdown previewing
	{
	"iamcco/markdown-preview.nvim",
	build = function() vim.fn["mkdp#util#install"]() end,
	},

	{'lervag/vimtex'}, --latex completion and previewing

    --vim wiki, markdown collection
    	{'lervag/wiki.vim'},

    -- Which key
	{
      	"folke/which-key.nvim",
      	config = function()
	require("which-key").setup {}
      	end
       	},
}
require("lazy").setup(plugins, lazy_options)

