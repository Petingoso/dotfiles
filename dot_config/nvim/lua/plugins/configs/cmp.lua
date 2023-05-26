local cmp = require("cmp")
local lspkind = require("lspkind")
lspkind.init({
	symbol_map = {
		TypeParameter = "",
	},
})

cmp.setup({
	preselect = cmp.PreselectMode.None, -- Don't automatically select a completion
	mapping = {
		["<C-n>"] = cmp.mapping(cmp.mapping.select_next_item()),
		["<C-p>"] = cmp.mapping(cmp.mapping.select_prev_item()),
		["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i" }),
		["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i" }),
		["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
		["<CR>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		}),
		["<C-e>"] = cmp.mapping.close(),
		["<Tab>"] = cmp.mapping(cmp.mapping.select_next_item()),
		["<S-Tab>"] = cmp.mapping(cmp.mapping.select_prev_item()),
	},
	completion = {
		completeopt = "menu,menuone,noinsert,noselect",
	},
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	sources = cmp.config.sources({
		{ name = "luasnip", priority = 10 }, -- Force snippet/lsp suggestions to the top
		{ name = "nvim_lsp", priority = 9 },
		{ name = "nvim-lua" },
		{ name = "path" },
		{ name = "kitty", option = {
			listen_on = "/tmp/kitty*",
		} },
		{
			name = "spell",
			priority = -1,
			option = {
				keep_all_entries = false,
				enable_in_context = function()
					-- return require('cmp.config.context').in_treesitter_capture('spell')
					return true
				end,
			},
		},
		{
			name = "buffer",
			priority = -2, -- Force buffer suggestions to the bottom
			option = {
				get_bufnrs = function()
					return vim.api.nvim_list_bufs()
				end,
			},
		},
	}),
	window = {
		completion = cmp.config.window.bordered({
			-- col_offset = -3,
			side_padding = 0,
		}),
		documentation = cmp.config.window.bordered(),
	},
	formatting = {
		fields = { "kind", "abbr", "menu" },
		format = function(entry, vim_item)
			local kind = lspkind.cmp_format({
				mode = "symbol_text",
				maxwidth = 50,
				menu = { omni = "omni" },
			})(entry, vim_item)

			local strings = vim.split(kind.kind, "%s", { trimempty = true })

			kind.kind = " " .. (strings[1] or "") .. " "
			kind.menu = "    (" .. (strings[2] or "") .. ") " --  .. entry.source.name

			return kind
		end,
	},
	experimental = {
		ghost_text = false,
	},
	view = {
		entries = "custom",
		window = {
			completion = {
				border = "rounded",
				winhighlight = "FloatBorder",
			},
		},
	},
})

local cmdline_mapping = {
	["<C-n>"] = cmp.mapping(cmp.mapping.select_next_item(), { "c" }),
	["<C-p>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "c" }),
	["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "c" }),
	["<C-e>"] = cmp.mapping(cmp.mapping.close(), { "c" }),
	["<Tab>"] = cmp.mapping(cmp.mapping.select_next_item()),
	["<S-Tab>"] = cmp.mapping(cmp.mapping.select_prev_item()),
}

cmp.setup.cmdline(":", {
	mapping = cmdline_mapping,
	sources = {
		{ name = "cmdline", keyword_length = 2 }, -- Don't complete : commands until I type 2 characters
		{ name = "path" },
	},
})

cmp.setup.cmdline("/", {
	mapping = cmdline_mapping,
	sources = {
		{ name = "buffer" },
	},
})

cmp.setup.cmdline("?", {
	mapping = cmdline_mapping,
	sources = {
		{ name = "buffer" },
	},
})
