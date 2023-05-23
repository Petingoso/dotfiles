--- Neovim options

local options = {
--tab settings
softtabstop = 4,  --4 spaces for tab
shiftwidth = 4,   --number of spaces for autoindent
expandtab = true, --tabs to spaces

-- listchars:append('eol:'),
-- iskeyword:append "-", --add - to word recognition

-- Set highlight on search
hlsearch = true,   -- highlight all matches on previous search pattern
incsearch = true,  -- highlight all matches on previous search pattern

-- Case insensitive searching UNLESS /C or capital in search
ignorecase = true,
smartcase = true,

-- Make line numbers default
number = true,
relativenumber = true,
numberwidth = 2, -- set number column width to 2 {default 4}

showtabline = 2, -- always show tabs

scrolloff = 8, -- minimal number of screen lines to keep above and below the cursor
sidescrolloff = 8, -- minimal number of screen columns either side of cursor if wrap is `false`

signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time

wrap = true, -- display lines as one long line
linebreak = true, -- companion to wrap, don't split words

cursorline = true, -- highlight the current line
cursorcolumn = true, -- highlight the current column

-- Enable mouse mode
mouse = 'a',

-- Enable break indent
breakindent = true,

-- Save undo history
undofile = true,

-- Decrease update time
updatetime = 250,

-- disables the -- INSERT -- line
showmode = false,

-- Set colorscheme
termguicolors = true,

--enable spellchecking
spell = true,

--set spell langs
spelllang={'en', 'pt', 'cjk'},

--set conceallevel, hide some stuff
conceallevel=1,

completeopt = { "menuone", "noselect" }, -- mostly just for cmp_luasnip
}

for key, value in pairs(options) do
  vim.opt[key] = value
end


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

--set wiki.vim root and filetypes
vim.g.wiki_root = '~/Documents/notes/'
vim.g.wiki_filetypes = {'md', 'markdown', 'wiki'}
vim.g.wiki_link_extension = '.md'
vim.g.wiki_link_target_type = 'md'
vim.cmd [[let g:wiki_export = {
        \ 'args' : '--pdf-engine=xelatex -F mermaid-filter --template=gothic.tex',
        \ 'view' : v:true,
        \ 'output': 'school/exported',
        \}]]
--set pairs on vim pairs
vim.g.AutoPairsMapBS = 1

vim.cmd [[colorscheme gruvbox]]

-- vim.cmd([[augroup FormatAutogroup
--   autocmd!
--   autocmd BufWritePost * FormatWrite
-- augroup END]])
