-- foreground
fg_black = "^c#2f373b^";
fg_black0 = "^c#4b565c^";
fg_white = "^c#d3c6aa^";
fg_white0 = "^c#d3c6aa^";
fg_gray1 = "^c#868d80^";
fg_gray2 = "^c#868d80^";
fg_red1 = "^c#e67e80^";
fg_red2 = "^c#e67e80^";
fg_green1 = "^c#a7c080^";
fg_green2 = "^c#a7c080^";
fg_yellow1 = "^c#dbbc7f^";
fg_yellow2 = "^c#dbbc7f^";
fg_blue1 = "^c#458588^";
fg_blue2 = "^c#83a598^";
fg_purple1 = "^c#d699b6^";
fg_purple2 = "^c#d699b6^";
fg_aqua1 = "^c#83c092^";
fg_aqua2 = "^c#83c092^";
fg_orange1 = "^c#e69875^";
fg_orange2 = "^c#e69875^";

-- background
bg_black = "^b#2b3339^";
bg_black0 = "^b#2b3339^";
bg_white = "^b#d3c6aa^";
bg_white0 = "^b#d3c6aa^";
bg_gray1 = "^b#868d80^";
bg_gray2 = "^b#868d80^";
bg_red1 = "^b#e67e80^";
bg_red2 = "^b#e67e80^";
bg_green1 = "^b#a7c080^";
bg_green2 = "^b#a7c080^";
bg_yellow1 = "^b#dbbc7f^";
bg_yellow2 = "^b#dbbc7f^";
bg_blue1 = "^b#7f373b^";
bg_blue2 = "^b#7f373b^";
bg_purple1 = "^b#d699b6^";
bg_purple2 = "^b#d699b6^";
bg_aqua1 = "^b#83c092^";
bg_aqua2 = "^b#83c092^";
bg_orange1 = "^b#e69875^";
bg_orange2 = "^b#e69875^";


local color =
{
	-- set colors to modules
	sep = bg_black .. fg_black .. '|'; -- separator

	date_ic_fg = fg_black;
	date_ic_bg = bg_orange1;
	date_fg = fg_orange2;
	date_bg = bg_black;

	time_ic_fg = fg_black;
	time_ic_bg = bg_yellow1;
	time_fg = fg_yellow2;
	time_bg = bg_black;

	wifi_ic_fg = fg_black;
	wifi_ic_bg = bg_green1;
	wifi_fg = fg_green2;
	wifi_bg = bg_black;

	btt_ic_fg = fg_black; -- battery
	btt_ic_bg = bg_aqua1;
	btt_fg = fg_aqua2;
	btt_bg = bg_black;
	
	vol_ic_fg = fg_black; -- volume
	vol_ic_bg = bg_purple1;
	vol_fg = fg_black;
	vol_bg = bg_purple2;

	brgn_ic_fg = fg_black; -- brightness
	brgn_ic_bg = bg_aqua1;
	brgn_fg = fg_black;
	brgn_bg = bg_aqua2;
}

return color
