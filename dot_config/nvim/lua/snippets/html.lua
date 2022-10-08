local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local l = require("luasnip.extras").lambda
local r = require("luasnip.extras").rep
local p = require("luasnip.extras").partial
local m = require("luasnip.extras").match
local n = require("luasnip.extras").nonempty
local dl = require("luasnip.extras").dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local types = require("luasnip.util.types")
local conds = require("luasnip.extras.expand_conditions")

local snip = {
  -- trigger is fn.
  s({ trig = "htmlbsc", dscr = "Basic html template", name = "DOCTYPE" }, {
    t({
      "<!DOCTYPE html>",
      '<html lang="en">',
      "<head>",
      '<meta charset="UTF-8">',
      '<meta name="viewport" content="width=device-width, initial-scale=1.0">',
      "<title>",
    }),
    -- Placeholder/Insert.
    i(1, "Title"),
    t({
      "</title>",
      "</head>",
      "",
      "<body>",
      "\t",
    }),
    -- Placeholder with initial text.
    i(0),
    t({
      "",
      "</body>",
      "</html>",
    }),
  }),
}

return snip
