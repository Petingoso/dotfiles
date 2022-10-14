-- Enable Comment.nvim
require('Comment').setup()

-- Enable `lukas-reineke/indent-blankline.nvim`
-- See `:help indent_blankline.txt`
require('indent_blankline').setup {
  char = '┊',
  show_trailing_blankline_indent = false,
}

require("neo-tree").setup({
    source_selector = {
        winbar = true,
        statusline = true
    }
})

require'marks'.setup {
  default_mappings = true,
  cyclic = true,
  force_write_shada = false,
  refresh_interval = 250,
  sign_priority = { lower=10, upper=15, builtin=8, bookmark=20 },
  excluded_filetypes = {},
  mappings = {}
}

require('pretty-fold').setup{
   keep_indentation = false,
   fill_char = '━',
   sections = {
      left = {
         '━ ', function() return string.rep('*', vim.v.foldlevel) end, ' ━┫', 'content', '┣'
      },
      right = {
         '┫ ', 'number_of_folded_lines', ': ', 'percentage', ' ┣━━',
      }
   }
}

require'web-tools'.setup({
  keymaps = {
    rename = nil,  -- by default use same setup of lspconfig
    repeat_rename = '.', -- . to repeat
  },
})

-- require("notify").setup({
--     stages = "fade_in_slide_out",
--     render = "minimal"
-- })
