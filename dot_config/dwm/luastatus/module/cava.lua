package.path = package.path .. ";" .. os.getenv("HOME") .. "/.config/dwm/luastatus/colorscheme/?.lua"
local color = require("color")

widget = {
    plugin = 'timer',
    cb = function()
		local handle = io.popen('~/cava.sh')
		local result = handle:read("*a")
		print(result)
        return {
						string.format(color.sep .. color.date_ic_fg .. color.date_ic_bg .. "  " .. color.date_fg .. color.date_bg .. result), --date
        }
    end,
}
