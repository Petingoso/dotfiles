require("nvterm").setup()

local toggle_modes = {'n', 't'}

local mappings = {
  { toggle_modes, '<C-t>', function () require("nvterm.terminal").toggle('float') end },
}
local opts = { noremap = true, silent = true }
for _, mapping in ipairs(mappings) do
  vim.keymap.set(mapping[1], mapping[2], mapping[3], opts)
end
