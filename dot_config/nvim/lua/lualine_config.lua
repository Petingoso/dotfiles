local gps = require("nvim-gps")

--[[local function charcount()
  local x = vim.api.nvim_call_function("wordcount",{})
  return x.chars
end]]

require("lualine").setup({
  options = {
    icons_enabled = true,
    theme = 'dracula',
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    disabled_filetypes = {},
    always_divide_middle = false,
    globalstatus = true,
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = {
      "branch",
      {
        "diff",
        symbols = { added = "", modified = "", removed = "" },
      },
      {
        "diagnostics",
        sources = { "nvim_diagnostic" },
      },
    },
    lualine_c = {
      { "filename" },
      { gps.get_location, condition = gps.is_available },
    },
    --lualine_x = {charcount ,'encoding', 'fileformat', 'filetype'},
    lualine_x = { "encoding", "fileformat", "filetype" },
    lualine_y = { "progress" },
    lualine_z = { "location" },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { "filename" },
    lualine_x = { "location" },
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {
    lualine_a = { {
      "tabs",
      max_length = vim.o.columns / 1,
      mode = 1,
    } },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },
  extensions = {},
})
