-- [[ Basic Keymaps ]]
-- Set <space> as the leader key
-- See `:help mapleader`
-- Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = 'ç'
vim.g.maplocalleader = ','
local map = vim.keymap.set
-- Keymaps for better default experience 
-- See `:help map()`
local dap_ok, dap = pcall(require, "dap")
local dap_ui_ok, ui = pcall(require, "dapui")

--Misc Keymaps 
map({ 'n', 'v' }, '<Space>', '<Nop>'                 , { silent = true }) -- space not do anything on visual
map('n'         , "<C-x>"  , "<cmd>!xdg-open %<CR>"  , { desc = "Open file on xdg-open" })
map( {'n','v','t'}, '<C-t>'  , '<C-Bslash><C-N>:FloatermToggle<CR>'      , {desc="Toggle Terminal"})


-- map('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true }) -- Remap for dealing with word wrap
-- map('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

map('n', '<F11>'  , ":set spell!<cr>"         , { silent = true, desc = "Toggle spell" })
map('i', '<F11>'  , "<C-O>:set spell!<cr>"    , { silent = true })
map('n', '<F10>'  , ":EnableAutocorrect<cr>"  , { silent = true, desc = "Enable autocorrect" })
map('n', '<S-F10>', ":DisableAutocorrect<cr>" , { silent = true, desc = "Disable autocorrect" })

map('n', "<leader>zm", ":TZMinimalist<CR>", { desc = "Toggle Minimal Zen Mode" })


map('n', "<leader>e" , "<cmd>Neotree toggle<cr>", { desc = "Toggle Explorer" })
map('n', "<leader>o" , "<cmd>Neotree focus<cr>" , { desc = "Focus Explorer" })
map('n', "<leader>cd" ,"<cmd>cd ..<cr>" , { desc = "[C]hange [D]irectory Up" })

-- Telescope
map('n', "<C-P>t"     , "<cmd>Telescope<CR>"   ,{ desc = "Open Telescope" })

map('n', "<leader>sf", "<cmd>Telescope find_files<cr>"          , { desc = "[S]earch [F]iles" })
map('n', "<leader>sh", require('telescope.builtin').help_tags   , { desc = "[S]earch [H]elp" })
map('n', "<leader>sw", require('telescope.builtin').grep_string , { desc = "[S]earch current [W]ord" })
map('n', "<leader>sg", require('telescope.builtin').live_grep   , { desc = "[S]earch by [G]rep" })
map('n', "<leader>sd", require('telescope.builtin').diagnostics , { desc = "[S]earch by [D]iagnostics" })
map('n', "<leader>st", require("telescope.builtin").oldfiles    , {desc = "[S]earch his[T]ory" })
map('n', "<leader>s<space>", require('telescope.builtin').buffers, { desc = "[  ] Find existing buffers" })
map('n', '<leader>s/', function()
require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer]' })

-- LSP 
-- basic mappings
map('n', "<leader>rn", vim.lsp.buf.rename       , { desc = "[R]e[n]ame" })
map('n', "<leader>ca", vim.lsp.buf.code_action  , { desc = "[C]ode [A]ction" })
map('n', "gd"        , vim.lsp.buf.definition   , { desc = "[G]oto [D]efinition" })
-- map('n', "gi"        , vim.lsp.buf.implementation, { desc = "[G]oto [I]mplementation" })
map('n', '<leader>ds', require('telescope.builtin').lsp_document_symbols, { desc = '[D]ocument [S]ymbols'})
map('n', '<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, { desc = '[W]orkspace [S]ymbols'})

  -- See `:help K` for why this keymap
-- map('n', 'K', vim.lsp.buf.hover, { desc ='Hover Documentation'})
-- map('n', '<C-k>', vim.lsp.buf.signature_help, { desc = 'Signature Documentation'})

  -- Lesser used LSP functionality
-- map('n', 'gD', vim.lsp.buf.declaration, { desc = '[G]oto [D]eclaration'})
-- map('n', '<leader>td', vim.lsp.buf.type_definition, { desc = '[T]ype [D]efinition'})
-- map('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, { desc = '[W]orkspace [A]dd Folder'})
-- map('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, { desc ='[W]orkspace [R]emove Folder'})
-- map('n', '<leader>wl', function()
    -- print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  -- end, { desc = '[W]orkspace [L]ist Folders'})



-- Diagnostic keymaps
map('n', '<S-g>d'   , vim.diagnostic.goto_prev  , { desc= "Go to previous lsp diagnostic" })
map('n', '<S-g>f'   , vim.diagnostic.goto_next  , { desc= "Go to next lsp diagnostic" })
map('n', '<leader>f', vim.diagnostic.open_float , { desc = "Open diagnostic window"})
-- map('n', '<leader>q', require('telescope.builtin').lsp_references, { desc = "List LSP diagnostics" })


-- Gomove, for moving blocks
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

-- Splits --
-- ('n', "r window navigation
map('n', "<C-h>", function() require("smart-splits").move_cursor_left() end  , {desc = "Move to left split" })
map('n', "<C-j>", function() require("smart-splits").move_cursor_down() end  , {desc = "Move to below split" })
map('n', "<C-k>", function() require("smart-splits").move_cursor_up() end    , {desc = "Move to above split" })
map('n', "<C-l>", function() require("smart-splits").move_cursor_right() end , {desc = "Move to right split" })

-- ('n', "e with arrows
map('n', "<C-Up>"   , function() require("smart-splits").resize_up() end    , {desc = "Resize split up" })
map('n', "<C-Down>" , function() require("smart-splits").resize_down() end  , {desc = "Resize split down" })
map('n', "<C-Left>" , function() require("smart-splits").resize_left() end  , {desc = "Resize split left" })
map('n', "<C-Right>", function() require("smart-splits").resize_right() end , {desc = "Resize split right" })


-- Buffer and Tab management
map('n', "<S-l>"  , "<cmd>bnext<cr>"              , { desc = "Next buffer" })
map('n', "<S-h>"  , "<cmd>bprevious<cr>"          , { desc = "Previous buffer" })


-- Git signs mappings
map('n', "<leader>gj", function() require("gitsigns").next_hunk() end       , {desc = "Next git hunk" })
map('n', "<leader>gk", function() require("gitsigns").prev_hunk() end       , {desc = "Previous git hunk" })
map('n', "<leader>gl", function() require("gitsigns").blame_line() end      , {desc = "View git blame" })
map('n', "<leader>gp", function() require("gitsigns").preview_hunk() end    , {desc = "Preview git hunk" })
map('n', "<leader>gh", function() require("gitsigns").reset_hunk() end      , {desc = "Reset git hunk" })
map('n', "<leader>gr", function() require("gitsigns").reset_buffer() end    , {desc = "Reset git buffer" })
map('n', "<leader>gs", function() require("gitsigns").stage_hunk() end      , {desc = "Stage git hunk" })
map('n', "<leader>gu", function() require("gitsigns").undo_stage_hunk() end , {desc = "Unstage git hunk" })
map('n', "<leader>gd", function() require("gitsigns").diffthis() end        , {desc = "View git diff" })

--Debugging
vim.fn.sign_define('DapBreakpoint', { text = '🐞' })

-- Start debugging session
map("n", "<localleader>ds", function()
  dap.continue()
  ui.toggle({})
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-w>=", false, true, true), "n", false) -- Spaces buffers evenly
end, {desc="Start [D]ebug [S]ession"})

-- Set breakpoints, get variable values, step into/out of functions, etc.
map("n", "<localleader>dl", require("dap.ui.widgets").hover)
map("n", "<localleader>dc", dap.continue, { desc = "DAP continue" })
map("n", "<localleader>db", dap.toggle_breakpoint, { desc = "DAP toggle breakpoint" })
map("n", "<localleader>dn", dap.step_over, { desc = "DAP step next" })
map("n", "<localleader>di", dap.step_into, { desc = "DAP step into" })
map("n", "<localleader>do", dap.step_out,  { desc = "DAP setp out"})
map("n", "<localleader>dC", function()
  dap.clear_breakpoints()
end, {desc = "DAP Clear Breakpoints"})
--
-- Close debugger and clear breakpoints
map("n", "<localleader>de", function()
  dap.clear_breakpoints()
  ui.toggle({})
  dap.terminate()
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-w>=", false, true, true), "n", false)
end, { desc= "[D]ebug [E]xit" })
