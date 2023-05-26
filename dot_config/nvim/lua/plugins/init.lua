local editor = require("plugins.editor")
local themes = require("plugins.themes")
local tools = require("plugins.tools")
local ui = require("plugins.ui")

local plugins = { themes, ui, tools, editor }

require("lazy").setup(plugins)
