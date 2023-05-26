require("neo-tree").setup({
	source_selector = {
		winbar = true,
	},
	filesystem = {
		window = {
			mappings = {
				["o"] = "system_open",
			},
		},
		commands = {
			system_open = function(state)
				local node = state.tree:get_node()
				local path = node:get_id()
				vim.api.nvim_command(string.format("silent !xdg-open '%s'", path))
			end,
		},
	},
})
