local autopairs_setup, illuminate = pcall(require, "illuminate")
if not autopairs_setup then
	return
end

illuminate.configure({
	-- providers: provider used to get references in the buffer, ordered by priority
	providers = {
		"lsp",
		"treesitter",
		"regex",
	},
	delay = 300,
	under_cursor = true,
	large_file_cutoff = nil,
	large_file_overrides = nil,
	min_count_to_highlight = 2,
})
