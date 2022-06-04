package.path = package.path .. ";" .. os.getenv("HOME") .. "/.config/dwm/luastatus/colorscheme/?.lua"
local color = require("color")

widget = luastatus.require_plugin('mem-usage-linux').widget{
    timer_opts = {period = 2},
    cb = function(t)
        local used_kb = t.total.value - t.avail.value
        return string.format(color.sep .. color.brgn_ic_fg .. color.brgn_ic_bg .. '  ' .. color.brgn_fg .. color.brgn_bg ..'%3.2fGiB ', used_kb / 1024 / 1024)
    end,
}
