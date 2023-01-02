-- [[ Setting options ]]

--tab settings
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.noexpandtab = 1

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

--set wiki.vim root and filetypes
vim.g.wiki_root = '~/Documents/notes/'
vim.g.wiki_filetypes = {'md', 'markdown', 'wiki'}
vim.g.wiki_link_extension = '.md'
vim.g.wiki_link_target_type = 'md'

--enable spellchecking
vim.o.spell = true

--set spell langs
vim.opt.spelllang={'en', 'pt', 'cjk'}

--set conceallevel, hide some stuff
vim.o.conceallevel=1

--remove annoying vimtex warning
vim.g.vimtex_quickfix_open_on_warning = 0

--enable some stuff to work like minted
vim.g.vimtex_compiler_latexmk = {
  options = {
    '-pdf',
    '-shell-escape',
    '-verbose',
    '-file-line-error',
    '-synctex=1',
    '-interaction=nonstopmode',
  }
}

--set pairs on vim pairs
vim.g.AutoPairsMapBS = 1

