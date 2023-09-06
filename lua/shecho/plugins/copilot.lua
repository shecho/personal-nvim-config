return {
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		build = ":Copilot auth",
		event = "InsertEnter",
		opts = {
			cmp = {
				enabled = true,
				method = "getCompletionsCycling",
			},
			suggestion = {
				panel = { enabled = false },
				enabled = true,
				auto_trigger = true,
				debounce = 75,
				keymap = {
					-- accept = "<c-j>",
					accept = "<c-l>",
					accept_word = false,
					accept_line = false,
					-- accept_word = true,
					-- accept_line = true,
					-- next = "<c-p>",
					-- prev = "<M-[>",
					dismiss = "<C-]>",
				},
			},
			panel = { enabled = false },
			filetypes = { markdown = true, help = true },
			server_opts_overrides = {
				-- trace = "verbose",
				settings = {
					advanced = {
						-- listCount = 10, -- #completions for panel
						inlineSuggestCount = 3, -- #completions for getCompletions
					},
				},
			},
		},
	},
}
