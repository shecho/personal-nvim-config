-- import lspsaga safely
local saga_status, saga = pcall(require, "lspsaga")
if not saga_status then
	return
end

saga.setup({
	ui = {
		-- currently only round theme
		theme = "round",
		-- border type can be single,double,rounded,solid,shadow.
		border = "rounded",
		winblend = 5,
		expand = "",
		collaspe = "",
		preview = " ",
		code_action = "💡",
		diagnostic = "🐞",
		incoming = " ",
		outgoing = " ",
		colors = {
			--float window normal bakcground color
			normal_bg = "#3b4048", --#181a1f #4b5263 #3b4048
			--title background color
			title_bg = "#afd700",
			red = "#e95678",
			magenta = "#b33076",
			orange = "#FF8700",
			yellow = "#f7bb3b",
			green = "#afd700",
			cyan = "#36d0e0",
			blue = "#61afef",
			purple = "#CBA6F7",
			white = "#d1d4cf",
			black = "#1c1c19",
		},
		-- kind = {},
		finder = {
			max_height = 0.6,
			min_width = 30,
			force_max_height = false,
			keys = {
				jump_to = "p",
				expand_or_jump = "o",
				vsplit = "s",
				split = "i",
				tabe = "<C-j>",
				tabnew = "l",
				quit = { "q", "<ESC>" },
				close_in_preview = "<ESC>",
			},
		},
		finder_action_keys = {
			open = "l",
			vsplit = "v",
			split = "s",
			quit = { "q", "<ESC>" },
		},
	},
})
