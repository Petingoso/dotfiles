local ui = {
	{
		"goolord/alpha-nvim",
		config = function()
			require("plugins.configs.alpha")
		end,
	}, --startup screen

	{
		"nvim-lualine/lualine.nvim",
		config = function()
			require("plugins.configs.lualine")
		end,
	}, -- Fancier statusline

	{
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("plugins.configs.indent-blankline")
		end,
	}, -- Add indentation guides even on blank lines

	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		config = function()
			require("plugins.configs.treesitter")
		end,
	}, -- Highlight, edit, and navigate code

	{
		"nvim-treesitter/nvim-treesitter-context",
		config = function()
			require("treesitter-context").setup({})
		end,
	}, -- Highlight, edit, and navigate code

	-- Which key
	{
		"folke/which-key.nvim",
		config = function()
			require("which-key").setup({})
		end,
	},

	{ "kevinhwang91/rnvimr" },

	{
		"nvim-neo-tree/neo-tree.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
		},
		config = function()
			require("plugins.configs.neo-tree")
		end,
	},

	{
		"folke/todo-comments.nvim",
		dependencies = "nvim-lua/plenary.nvim",
		config = function()
			require("plugins.configs.todo")
		end,
	}, --todo comments magic

	--folds that look nice
	{
		"anuvyklack/pretty-fold.nvim",
		config = function()
			require("plugins.configs.pretty-fold")
		end,
	},

	{
		"NvChad/nvim-colorizer.lua",
		config = function()
			require("plugins.configs.colorizer")
		end,
	}, --preview colors

	--Github
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("plugins.configs.gitsigns")
		end,
	},
	{
		"Pocco81/true-zen.nvim",
		config = function()
			require("true-zen").setup({})
		end,
	},

	{ "mrjones2014/smart-splits.nvim" }, --better spliting
	{
		"anuvyklack/windows.nvim",
		dependencies = {
			"anuvyklack/middleclass",
		},
		config = function()
			require("windows").setup()
		end,
	},
}

return ui
