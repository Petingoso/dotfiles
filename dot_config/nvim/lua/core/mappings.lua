vim.g.mapleader = "ç"
vim.g.maplocalleader = ","

local map = vim.keymap.set --easier syntax

local dap = require("dap")
local dap_ui = require("dapui")
local telescope = require("telescope.builtin")
local splits = require("smart-splits")
local gitsigns = require("gitsigns")

--"Vanilla Keymaps"
map({ "n", "v" }, "<Space>", "<Nop>", { silent = true }) -- space not do anything on visual
map("n", "<C-x>", "<cmd>!xdg-open %<CR>", { desc = "Open file on xdg-open" })

map("n", "<leader>d", '"_d', { silent = true, desc = "delete without cut" })
map("v", "<leader>", '"_d', { silent = true, desc = "delete without cut Visual" })
map("v", "<leader>p", '"_dP', { silent = true, desc = "Paste from non cut" })

map("n", "<F11>", ":set spell!<cr>", { silent = true, desc = "Toggle spell" })
map("i", "<F11>", "<C-O>:set spell!<cr>", { silent = true })
map("n", "<F3>", ":noh<cr>", {silent = true, desc ="Remove last highlited search"})

--Toggle Terminal, Explorer,...
map({ "n", "v", "t" }, "<C-t>", "<C-Bslash><C-N>:FloatermToggle<CR>", { desc = "Toggle Terminal" })
map("n", "<leader>zm", ":TZMinimalist<CR>", { desc = "Toggle Minimal Zen Mode" })
map("n", "<leader>e", ":RnvimrToggle<CR>", { desc = "Toggle Explorer" })
map("t", "<leader>e", "<C-Bslash><C-n>:RnvimrToggle<CR>", { desc = "Toggle Explorer from window" })
map("n", "<leader>o", ":NeoTreeFocusToggle<CR>", { desc = "Toggle NeoTree" })

--format
map("n", "<localleader>f", ":Format<CR>", { desc = "Call Formatter" })

--go up
map("n", "<leader>cd", "<cmd>cd ..<cr>", { desc = "[C]hange [D]irectory Up" })

-- Telescope
map("n", "<C-P>t", "<cmd>Telescope<CR>", { desc = "Open Telescope" })

map("n", "<leader>sf", telescope.find_files, { desc = "[S]earch [F]iles" })
map("n", "<leader>sh", telescope.help_tags, { desc = "[S]earch [H]elp" })
map("n", "<leader>sw", telescope.grep_string, { desc = "[S]earch current [W]ord" })
map("n", "<leader>sg", telescope.live_grep, { desc = "[S]earch by [G]rep" })
map("n", "<leader>sd", telescope.diagnostics, { desc = "[S]earch by [D]iagnostics" })
map("n", "<leader>st", telescope.oldfiles, { desc = "[S]earch his[T]ory" })
map("n", "<leader>s<space>", telescope.buffers, { desc = "[  ] Find existing buffers" })
map("n", "<leader>s/", function()
	telescope.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
		previewer = false,
	}))
end, { desc = "[/] Fuzzily search in current buffer]" })

-- LSP
-- basic mappings
map("n", "<leader>rn", vim.lsp.buf.rename, { desc = "[R]e[n]ame" })
map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "[C]ode [A]ction" })
map("n", "gd", vim.lsp.buf.definition, { desc = "[G]oto [D]efinition" })
-- map('n', "gi"        , vim.lsp.buf.implementation, { desc = "[G]oto [I]mplementation" })
map("n", "<leader>ds", telescope.lsp_document_symbols, { desc = "[D]ocument [S]ymbols" })
map("n", "<leader>ws", telescope.lsp_dynamic_workspace_symbols, { desc = "[W]orkspace [S]ymbols" })

-- Diagnostic keymaps
map("n", "<S-g>d", vim.diagnostic.goto_prev, { desc = "Go to previous lsp diagnostic" })
map("n", "<S-g>f", vim.diagnostic.goto_next, { desc = "Go to next lsp diagnostic" })
map("n", "<leader>f", vim.diagnostic.open_float, { desc = "Open diagnostic window" })
-- map('n', '<leader>q', require('telescope.builtin').lsp_references, { desc = "List LSP diagnostics" }) --telescope.diagnostics instead

-- Gomove, for moving blocks
map("n", "<S-h>", "<Plug>GoNSMLeft", {})
map("n", "<S-j>", "<Plug>GoNSMDown", {})
map("n", "<S-k>", "<Plug>GoNSMUp", {})
map("n", "<S-l>", "<Plug>GoNSMRght", {})

map("x", "<S-h>", "<Plug>GoVSMLeft", {})
map("x", "<S-j>", "<Plug>GoVSMDown", {})
map("x", "<S-k>", "<Plug>GoVSMUp", {})
map("x", "<S-l>", "<Plug>GoVSMRight", {})

map("n", "<C-h>", "<Plug>GoNSDLeft", {})
map("n", "<C-j>", "<Plug>GoNSDDown", {})
map("n", "<C-k>", "<Plug>GoNSDUp", {})
map("n", "<C-l>", "<Plug>GoNSDRight", {})

map("x", "<C-h>", "<Plug>GoVSDLeft", {})
map("x", "<C-j>", "<Plug>GoVSDDown", {})
map("x", "<C-k>", "<Plug>GoVSDUp", {})
map("x", "<C-l>", "<Plug>GoVSDRight", {})

-- Splits --
-- via hjkl
map("n", "<C-h>", splits.move_cursor_left, { desc = "Move to left split" })
map("n", "<C-j>", splits.move_cursor_down, { desc = "Move to below split" })
map("n", "<C-k>", splits.move_cursor_up, { desc = "Move to above split" })
map("n", "<C-l>", splits.move_cursor_right, { desc = "Move to right split" })

-- via arrow keys
map("n", "<C-Up>", splits.resize_up, { desc = "Resize split up" })
map("n", "<C-Down>", splits.resize_down, { desc = "Resize split down" })
map("n", "<C-Left>", splits.resize_left, { desc = "Resize split left" })
map("n", "<C-Right>", splits.resize_right, { desc = "Resize split right" })

-- Buffer and Tab management
map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next buffer" })
map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Previous buffer" })

-- Git signs mappings
map("n", "<leader>gj", gitsigns.next_hunk, { desc = "Next git hunk" })
map("n", "<leader>gk", gitsigns.prev_hunk, { desc = "Previous git hunk" })
map("n", "<leader>gl", gitsigns.blame_line, { desc = "View git blame" })
map("n", "<leader>gp", gitsigns.preview_hunk, { desc = "Preview git hunk" })
map("n", "<leader>gh", gitsigns.reset_hunk, { desc = "Reset git hunk" })
map("n", "<leader>gr", gitsigns.reset_buffer, { desc = "Reset git buffer" })
map("n", "<leader>gs", gitsigns.stage_hunk, { desc = "Stage git hunk" })
map("n", "<leader>gu", gitsigns.undo_stage_hunk, { desc = "Unstage git hunk" })
map("n", "<leader>gd", gitsigns.diffthis, { desc = "View git diff" })

--Debugging
vim.fn.sign_define("DapBreakpoint", { text = "🐞" })

-- Start debugging session
map("n", "<localleader>ds", function()
	dap.continue()
	dap_ui.toggle({})
	vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-w>=", false, true, true), "n", false) -- Spaces buffers evenly
end, { desc = "Start [D]ebug [S]ession" })

-- Set breakpoints, get variable values, step into/out of functions, etc.
map("n", "<localleader>dl", require("dap.ui.widgets").hover)
map("n", "<localleader>dc", dap.continue, { desc = "DAP continue" })
map("n", "<localleader>db", dap.toggle_breakpoint, { desc = "DAP toggle breakpoint" })
map("n", "<localleader>dn", dap.step_over, { desc = "DAP step next" })
map("n", "<localleader>di", dap.step_into, { desc = "DAP step into" })
map("n", "<localleader>do", dap.step_out, { desc = "DAP setp out" })
map("n", "<localleader>dC", dap.clear_breakpoints, { desc = "DAP Clear Breakpoints" })
--
-- Close debugger and clear breakpoints
map("n", "<localleader>de", function()
	dap.clear_breakpoints()
	dap_ui.toggle({})
	dap.terminate()
	vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-w>=", false, true, true), "n", false)
end, { desc = "[D]ebug [E]xit" })
