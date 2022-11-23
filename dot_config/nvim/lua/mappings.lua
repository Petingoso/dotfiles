
-- [[ Basic Keymaps ]]
-- Set <space> as the leader key
-- See `:help mapleader`
-- Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = 'ç'
vim.g.maplocalleader = ','
local map = vim.keymap.set

-- Keymaps for better default experience
-- See `:help map()`
map('n', "<C-P>", "<cmd>Telescope<CR>",{})
map({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
map('t', "<ESC>", "<CR><C-d><CR>", {} )
map('n', "<C-x>", "<cmd>!xdg-open %<CR>", {} )
map('i', "<C-l>", "<C-x><C-o>", { desc = "Suggest wiki pages"  } )

-- Remap for dealing with word wrap
map('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

map('n', '<F11>', ":set spell!<cr>", { silent = true, desc= "Toggle spell" })
map('i', '<F11>', "<C-O>:set spell!<cr>", { silent = true })
map('n', '<F10>', ":EnableAutocorrect<cr>", { silent = true, desc= "Enable autocorrect" })
map('n', '<S-F10>', ":DisableAutocorrect<cr>", { silent = true, desc= "Disable autocorrect" })

-- Diagnostic keymaps
map('n', '<S-g>d', vim.diagnostic.goto_prev)
map('n', '<S-g>f', vim.diagnostic.goto_next)
map('n', '<leader>e', vim.diagnostic.open_float)
map('n', '<leader>q', vim.diagnostic.setloclist)

map( "n", "<S-h>", "<Plug>GoNSMLeft", {} )
map( "n", "<S-j>", "<Plug>GoNSMDown", {} )
map( "n", "<S-k>", "<Plug>GoNSMUp", {} )
map( "n", "<S-l>", "<Plug>GoNSMRight", {} )

map( "x", "<S-h>", "<Plug>GoVSMLeft", {} )
map( "x", "<S-j>", "<Plug>GoVSMDown", {} )
map( "x", "<S-k>", "<Plug>GoVSMUp", {} )
map( "x", "<S-l>", "<Plug>GoVSMRight", {} )

map( "n", "<C-h>", "<Plug>GoNSDLeft", {} )
map( "n", "<C-j>", "<Plug>GoNSDDown", {} )
map( "n", "<C-k>", "<Plug>GoNSDUp", {} )
map( "n", "<C-l>", "<Plug>GoNSDRight", {} )

map( "x", "<C-h>", "<Plug>GoVSDLeft", {} )
map( "x", "<C-j>", "<Plug>GoVSDDown", {} )
map( "x", "<C-k>", "<Plug>GoVSDUp", {} )
map( "x", "<C-l>", "<Plug>GoVSDRight", {} )


map('n', "<S-lt>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer tab" })
map('n', "<S-ht>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Previous buffer tab" })
map('n', "<S-l>", "<cmd>bnext<cr>", { desc = "Next buffer" })
map('n', "<S-h>", "<cmd>bprevious<cr>", { desc = "Previous buffer" })


map('n', "<leader>gj", function() require("gitsigns").next_hunk() end, {desc = "Next git hunk" })
map('n', "<leader>gk", function() require("gitsigns").prev_hunk() end, {desc = "Previous git hunk" })
map('n', "<leader>gl", function() require("gitsigns").blame_line() end, {desc = "View git blame" })
map('n', "<leader>gp", function() require("gitsigns").preview_hunk() end, {desc = "Preview git hunk" })
map('n', "<leader>gh", function() require("gitsigns").reset_hunk() end, {desc = "Reset git hunk" })
map('n', "<leader>gr", function() require("gitsigns").reset_buffer() end, {desc = "Reset git buffer" })
map('n', "<leader>gs", function() require("gitsigns").stage_hunk() end, {desc = "Stage git hunk" })
map('n', "<leader>gu", function() require("gitsigns").undo_stage_hunk() end, {desc = "Unstage git hunk" })
map('n', "<leader>gd", function() require("gitsigns").diffthis() end, {desc = "View git diff" })


-- ('n', "r window navigation
map('n', "<C-h>", function() require("smart-splits").move_cursor_left() end, {desc = "Move to left split" })
map('n', "<C-j>", function() require("smart-splits").move_cursor_down() end, {desc = "Move to below split" })
map('n', "<C-k>", function() require("smart-splits").move_cursor_up() end, {desc = "Move to above split" })
map('n', "<C-l>", function() require("smart-splits").move_cursor_right() end, {desc = "Move to right split" })

-- ('n', "e with arrows
map('n', "<C-Up>", function() require("smart-splits").resize_up() end, {desc = "Resize split up" })
map('n', "<C-Down>", function() require("smart-splits").resize_down() end, {desc = "Resize split down" })
map('n', "<C-Left>", function() require("smart-splits").resize_left() end, {desc = "Resize split left" })
map('n', "<C-Right>", function() require("smart-splits").resize_right() end, {desc = "Resize split right" })

map('n', "<leader>st", function() require("telescope.builtin").oldfiles() end, {desc = "[S]earch his[T]ory" })

local wk = require("which-key")
-- method 4
wk.register({
  ["<leader>sf"] = { "<cmd>Telescope find_files<cr>", "[S]earch [F]iles" },
  ["<leader>sh"] = { require('telescope.builtin').help_tags, "[S]earch [H]elp" },
  ["<leader>sw"] = { require('telescope.builtin').grep_string, "[S]earch current [W]ord" },
  ["<leader>sg"] = { require('telescope.builtin').live_grep, "[S]earch by [G]rep" },
  ["<leader>sd"] = { require('telescope.builtin').diagnostics, "[S]earch by [D]iagnostics" },
  ["<leader>?"] = { require('telescope.builtin').oldfiles, "[?] Find recently opened files" },
  ["<leader><space>"] = { require('telescope.builtin').buffers, "[  ] Find existing buffers" },

  --lsp binds
      ["<leader>rn"] = { vim.lsp.buf.rename, "[R]e[n]ame" },
      ["<leader>ca"] = { vim.lsp.buf.code_action, "[C]ode [A]ction" },
      ["gd"] = { vim.lsp.buf.definition, "[G]oto [D]efinition" },
      ["gi"] = { vim.lsp.buf.implementaion, "[G]oto [I]mplementation" },
  ["<leader>e"] = {"<cmd>Neotree toggle<cr>", "Toggle Explorer"},
  ["<leader>o"] = {"<cmd>Neotree focus<cr>", "Toggle Explorer"}
})
