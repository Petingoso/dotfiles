"Pet's Nvim

set encoding=UTF-8
set clipboard=unnamedplus
set list
set listchars=tab:-->
set syntax=on
set number
set autoindent
set tabstop=4
set shiftwidth=4
set smarttab
set softtabstop=4
set mouse=a
set splitbelow 
set splitright
set termguicolors
set foldmethod=manual
set number relativenumber
set laststatus=3
filetype plugin on

let g:mapleader ="ç"
let g:maplocalleader = ','

let g:python_host_prog  = 'usr/bin/python'
let g:python3_host_prog = '/usr/bin/python3'


let g:catppuccin_flavour = "macchiato"
colorscheme dracula
let g:rainbow_active = 1
set dictionary+=/usr/share/dict/words
set complete+=k
" set spell spelllang=en,pt
set spellsuggest=best,9

nnoremap <silent> <F11> :set spell!<cr>
inoremap <silent> <F11> <C-O>:set spell!<cr>

:lua << EOF
local lsp_installer = require("nvim-lsp-installer")
-- Register a handler that will be called for each installed server when it's ready (i.e. when installation is finished
-- or if the server is already installed).
lsp_installer.on_server_ready(function(server)
    local opts = {}
	server:setup(opts)
end)
EOF
