vim.api.nvim_command([[ hi def link LspReferenceText  CursorLine ]])
vim.api.nvim_command([[ hi def link LspReferenceWrite CursorLine ]])
vim.api.nvim_command([[ hi def link LspReferenceRead  CursorLine ]])

-- Change diagnostic symbols in the gutter
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.cmd([[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil,{focusable=false,scope="cursor"})]])

local nvim_lsp = require("lspconfig")
local util = require("util")

--[[
   [vim.diagnostic.config({
   [  virtual_text = true,
   [  signs = true,
   [  underline = true,
   [  update_in_insert = true,
   [  severity_sort = true,
   [  float = {
   [    focusable = true,
   [    style = "minimal",
   [    source = "always",
   [    header = "",
   [    prefix = "",
   [  },
   [})
   ]]

-- Use a loop to conveniently both setup defined servers
-- and map buffer local keybindings when the language server attaches
local servers = { "hls" }

for _, lsp in ipairs(servers) do
  local opts = {
    on_attach = util.on_attach,
    capabilities = util.capabilities,
    update_in_insert = true,
  }
  nvim_lsp[lsp].setup(opts)
end
