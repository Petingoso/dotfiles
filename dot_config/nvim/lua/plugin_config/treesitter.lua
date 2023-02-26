-- [[ Configure Treesitter ]]
-- See `:help nvim-treesitter`
require('nvim-treesitter.configs').setup {
  -- Add languages to be installed here that you want installed for treesitter

  highlight = { enable = true },
  indent = { enable = true },
  incremental_selection = {
    enable = true,
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
    },
    swap = {
      enable = true,
    },
  },
}
