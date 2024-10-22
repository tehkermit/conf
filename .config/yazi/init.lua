-- require("eza-preview"):setup()
function Linemode:size_and_mtime()
	local year = os.date("%Y")
	local time = math.floor(self._file.cha.modified or 0)

	if time > 0 and os.date("%Y", time) == year then
		time = os.date("%d/%H:%M", time)
	else
		time = time and os.date("%b %d  %Y", time) or ""
	end

	local size = self._file:size()
	return ui.Line(string.format(" %s %s ", size and ya.readable_size(size) or "-", time))
end

function Status:name()
	local h = self._tab.current.hovered
	if not h then
		return ui.Line({})
	end

	local linked = ""
	if h.link_to ~= nil then
		linked = " -> " .. tostring(h.link_to)
	end
	return ui.Line(" " .. h.name .. linked)
end

require("zoxide"):setup({
	update_db = true,
})

-- ~/.config/yazi/init.lua
-- require("relative-motions"):setup({ show_numbers = "relative_absolute", show_motion = true })

-- require("starship"):setup()

-- local catppuccin_theme = require("yatline-catppuccin"):setup("latte")

-- require("yatline"):setup({
-- 	-- theme = catppuccin_theme,
-- 	-- section_separator = { open = "", close = "" },
-- 	part_separator = { open = "", close = "" },
-- 	section_separator = { open = "", close = "" },
-- 	-- part_separator = { open = "", close = "" },
-- 	inverse_separator = { open = "", close = "" },
--
-- 	style_a = {
-- 		fg = "black",
-- 		bg_mode = {
-- 			normal = "#007FF0",
-- 			select = "#D66300",
-- 			un_set = "#228478",
-- 		},
-- 	},
-- 	style_b = { bg = "#007FF0", fg = "#1a1b1c" },
-- 	style_c = { bg = "#E1E2E7", fg = "#007FF0" },
--
-- 	permissions_t_fg = "green",
-- 	permissions_r_fg = "yellow",
-- 	permissions_w_fg = "red",
-- 	permissions_x_fg = "cyan",
-- 	permissions_s_fg = "darkgray",
--
-- 	tab_width = 2,
-- 	tab_use_inverse = false,
--
-- 	selected = { icon = "󰻭", fg = "yellow" },
-- 	copied = { icon = "", fg = "green" },
-- 	cut = { icon = "", fg = "red" },
--
-- 	total = { icon = "󰮍", fg = "yellow" },
-- 	succ = { icon = "", fg = "green" },
-- 	fail = { icon = "", fg = "red" },
-- 	found = { icon = "󰮕", fg = "blue" },
-- 	processed = { icon = "󰐍", fg = "green" },
--
-- 	show_background = false,
--
-- 	display_header_line = true,
-- 	display_status_line = true,
--
-- 	header_line = {
-- 		left = {
-- 			section_a = { { type = "coloreds", custom = true, name = { { " ", "#E1E2E7" } } } },
-- 			section_b = {
-- 				{ type = "line", custom = false, name = "tabs", params = { "left" } },
-- 			},
-- 			section_c = {},
-- 		},
-- 		right = {
-- 			section_a = {},
-- 			section_b = {
-- 				{ type = "coloreds", custom = true, name = { { " 󰇥 ", "#3c3836" } } },
-- 			},
-- 			section_c = {
-- 				{ type = "coloreds", custom = false, name = "count" },
-- 			},
-- 		},
-- 	},
--
-- 	status_line = {
-- 		left = {
-- 			section_a = {},
-- 			section_b = {},
-- 			section_c = {},
-- 		},
-- 		right = {
-- 			section_a = {},
-- 			section_b = {},
-- 			section_c = {},
-- 		},
-- 	},
-- })
-- require("current-size"):setup({
-- 	folder_size_ignore = { "/home/user", "/" },
-- })

-- require("yatline"):setup({
-- 		theme = catppuccin_theme,
--
-- 	-- section_separator = { open = "", close = "" },
-- 	-- part_separator = { open = "", close = "" },
-- 	-- inverse_separator = { open = "", close = "" },
-- 	section_separator = { open = " ", close = " " },
-- 	part_separator = { open = " ", close = " " },
-- 	inverse_separator = { open = " ", close = " " },
--
-- 	style_a = {
-- 		fg = "blue",
-- 		bg_mode = {
-- 			normal = "black",
-- 			select = "yellow",
-- 			un_set = "blue",
-- 		},
-- 	},
-- 	style_b = { bg = "black", fg = "red" },
-- 	style_c = { bg = "black", fg = "yellow" },
--
-- 	permissions_t_fg = "green",
-- 	permissions_r_fg = "yellow",
-- 	permissions_w_fg = "red",
-- 	permissions_x_fg = "cyan",
-- 	permissions_s_fg = "darkgray",
--
-- 	tab_width = 20,
-- 	tab_use_inverse = true,
--
-- 	selected = { icon = "󰻭", fg = "yellow" },
-- 	copied = { icon = "", fg = "green" },
-- 	cut = { icon = "", fg = "red" },
--
-- 	total = { icon = "󰮍", fg = "yellow" },
-- 	succ = { icon = "", fg = "green" },
-- 	fail = { icon = "", fg = "red" },
-- 	found = { icon = "󰮕", fg = "blue" },
-- 	processed = { icon = "󰐍", fg = "green" },
--
-- 	show_background = true,
--
-- 	display_header_line = true,
-- 	display_status_line = true,
--
-- 	header_line = {
-- 		left = {
-- 			section_a = {
-- 				{ type = "line", custom = false, name = "tabs", params = { "left" } },
-- 			},
-- 			section_b = {},
-- 			section_c = {},
-- 		},
-- 		right = {
-- 			section_a = {
-- 				{ type = "string", custom = false, name = "date", params = { "%A, %d %B %Y" } },
-- 			},
-- 			section_b = {
-- 				{ type = "string", custom = false, name = "date", params = { "%X" } },
-- 			},
-- 			section_c = {},
-- 		},
-- 	},
--
-- 	status_line = {
-- 		left = {
-- 			section_a = {
-- 				{ type = "string", custom = false, name = "tab_mode" },
-- 			},
-- 			section_b = {
-- 				{ type = "string", custom = false, name = "hovered_size" },
-- 			},
-- 			section_c = {
-- 				{ type = "string", custom = false, name = "hovered_name" },
-- 				{ type = "coloreds", custom = false, name = "count" },
-- 			},
-- 		},
-- 		right = {
-- 			section_a = {
-- 				{ type = "string", custom = false, name = "cursor_position" },
-- 			},
-- 			section_b = {
-- 				{ type = "string", custom = false, name = "cursor_percentage" },
-- 			},
-- 			section_c = {
-- 				{ type = "string", custom = false, name = "hovered_file_extension", params = { true } },
-- 				{ type = "coloreds", custom = false, name = "permissions" },
-- 			},
-- 		},
-- 	},
-- })
--
-- require("full-border"):setup({
-- 	-- Available values: ui.Border.PLAIN, ui.Border.ROUNDED
-- 	type = ui.Border.ROUNDED,
-- })
