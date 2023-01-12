-- For copilot.vim
-- vim.g.copilot_filetypes = {
--   ["*"] = false,
-- }

-- vim.cmd [[
--   imap <silent><script><expr> <C-A> copilot#Accept("\<CR>")
--   let g:copilot_no_tab_map = v:true
-- ]]

local status_ok, copilot = pcall(require, "copilot")
if not status_ok then
	return
end
-- vim.g.copilot_no_tab_map = true
-- vim.g.copilot_assume_mapped = true
-- vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })

copilot.setup({
	panel = { enabled = false },
	cmp = {
		enabled = true,
		method = "getCompletionsCycling",
	},
	suggestion = {
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
			next = "<c-p>",
			prev = "<M-[>",
			dismiss = "<C-]>",
		},
	},
	ft_disable = { "markdown" },
	server_opts_overrides = {
		-- trace = "verbose",
		settings = {
			advanced = {
				-- listCount = 10, -- #completions for panel
				inlineSuggestCount = 3, -- #completions for getCompletions
			},
		},
	},
})
