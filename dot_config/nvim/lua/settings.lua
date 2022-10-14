-- [[ Setting options ]]
-- See `:help vim.o`
-- vim.o.foldexpr = 'nvim_treesitter#foldexpr()'
-- vim.o.foldtext = "getline(v:foldstart).'...'.trim(getline(v:foldend))"

vim.o.softtabstop = true
vim.o.tabstop = 3
vim.o.shiftwidth = 3

vim.opt.listchars:append('eol:')
-- Set highlight on search
vim.o.hlsearch = false

-- Make line numbers default
vim.wo.number = true
vim.o.relativenumber = true
-- Enable mouse mode
vim.o.mouse = 'a'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = 'yes'

-- Set colorscheme
vim.o.termguicolors = true
vim.cmd [[colorscheme nord]]

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

vim.g.wiki_root = '~/Documents/notes/'
vim.g.wiki_link_extension = '.md'
vim.g.wiki_link_target_type = 'md'

