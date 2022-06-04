local ls = require("luasnip")
local ai = require("luasnip.nodes.absolute_indexer")
local s = ls.snippet
local sn = ls.snippet_node
local r = ls.restore_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local l = require("luasnip.extras").lambda
local rep = require("luasnip.extras").rep
local p = require("luasnip.extras").partial
local m = require("luasnip.extras").match
local n = require("luasnip.extras").nonempty
local dl = require("luasnip.extras").dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local types = require("luasnip.util.types")
local conds = require("luasnip.extras.expand_conditions")

local snip = {
  -- int main()
  s({ trig = "main", dscr = "main function", name = "main" }, {
    t({
      "int main(",
    }),
    c(1, {
      t("void"),
      t("int argc, char **argv"),
      t("int argc, char **argv, char **envp"),
    }),
    t({
      "){",
      "\t",
    }),
    i(0),
    t({
      "",
      "}",
    }),
  }),

  s("for", {
    t("for("),
    c(1, {
      sn(nil, {
        i(1),
        t(";;"),
      }),
      sn(nil, {
        i(1, "int i = 0"),
        t("; "),
        i(2, "i < 10"),
        t("; "),
        i(3, "i++"),
      }),
    }),
    t({
      "){",
      "\t",
    }),
    i(2),
    t({
      "",
      "}",
    }),
  }),

  s("ifn", {
    t("#ifndef "),
    sn(1, {
      f(function()
        return string.upper(vim.fn.expand("%:T"):match("(.+)%..+$"))
      end),
      i(1),
    }),
    t({ "", "" }),
    t("define "),
    rep(1),
    t({ "", "" }),
    i(2),
    t(""),
    t({ "", "#endif " }),
    rep(1),
  }),

  s("ifd", {
    t("#ifdef "),
    sn(1, {
      f(function()
        return string.upper(vim.fn.expand("%:T"):match("(.+)%..+$"))
      end),
      i(1),
    }),
    t({ "", "" }),
    i(2),
    t(""),
    t({ "", "#endif " }),
    rep(1),
  }),
}

return snip
--[[
   [s("trig", {
   [  t("for("),
   [  sn(1, {
   [    t("int "),
   [    i(1),
   [    t(" = 0"),
   [  }),
   [  t("; "),
   [  f(function(args)
   [    return args[1]
   [  end, ai[1][1]),
   [  t(" < 0"),
   [  t("; "),
   [  f(function(args)
   [    return args[1]
   [  end, ai[1][1]),
   [  t("++"),
   [  t("){"),
   [  i(2),
   [  t("}"),
   [}),
   ]]
