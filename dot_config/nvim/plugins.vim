"""""""""
"PLUGINS"
"""""""""
" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin(stdpath('data') . '/plugged')

"Themes
Plug 'SmiteshP/nvim-gps'
" Plug 'srcery-colors/srcery-vim'
Plug 'catppuccin/nvim', {'as': 'catppuccin'}
Plug 'folke/tokyonight.nvim'
Plug 'shapeoflambda/dark-purple.vim'
Plug 'Mofiqul/dracula.nvim'
Plug 'ellisonleao/gruvbox.nvim'
Plug 'shaunsingh/nord.nvim'
Plug 'frazrepo/vim-rainbow' "Colored Brackets, pretty cool
Plug 'ap/vim-css-color' " CSS Color Preview #000000
Plug 'glepnir/dashboard-nvim' "Dashboard screen
Plug 'nvim-lualine/lualine.nvim'

"Appearance and stuff
Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'} "File manager
Plug 'voldikss/vim-floaterm' "Cool for the execution of code
Plug 'vimlab/split-term.vim' "Better terminal
Plug 'tc50cal/vim-terminal' " Vim Terminal
Plug 'camspiers/lens.vim' "Resize windwos smartly
Plug 'kyazdani42/nvim-web-devicons' " Developer Icons
Plug 'tribela/vim-transparent'
Plug 'fladson/vim-kitty'
Plug 'folke/todo-comments.nvim'

"Writing and Formating
" Plug 'junegunn/fzf.vim' "For pop menus
Plug 'tpope/vim-commentary' "For quick commentary 
Plug 'qaiviq/vim-tiler' "Tiling
Plug 'zhamlin/tiler.vim' "See above
Plug 'jiangmiao/auto-pairs' "For double quotes, paretheses and stuff
Plug 'tpope/vim-surround' " Surrounding and changing paretheses n stuff
Plug 'vim-scripts/restore_view.vim' "for remebering session
Plug 'booperlv/nvim-gomove' "moving lines pog
Plug 'chentoast/marks.nvim'
"copilot
" Plug 'github/copilot.vim'

"LSP
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'hrsh7th/cmp-omni'
Plug 'hrsh7th/cmp-calc'
" For luasnip users.
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'rafamadriz/friendly-snippets'

"VS pictograms
Plug 'onsails/lspkind.nvim'

"Telescope
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-ui-select.nvim'
Plug 'nvim-lua/plenary.nvim'
"Other
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'liuchengxu/vim-which-key' "To remember binds
Plug 'vim-scripts/AutoComplPop'
call plug#end()

