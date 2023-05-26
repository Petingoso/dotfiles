-- Setup mason so it can manage external tooling
require("mason").setup()

require("mason-nvim-dap").setup({
	automatic_setup = true,
	ensure_installed = {},
	handlers = {
		function(config)
			-- all sources with no handler get passed here
			-- Keep original functionality
			require("mason-nvim-dap").default_setup(config)
		end,
	},
})

require("mason-lspconfig").setup()
require("mason-lspconfig").setup_handlers({
	function(server_name)
		require("lspconfig")[server_name].setup({})
	end,
})
