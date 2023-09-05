return {
    "RRethy/vim-illuminate",
    event = {"BufReadPost", "BufNewFile"},
    opts = {
        delay = 200,
        large_file_cutoff = 2000,
        large_file_overrides = {
            providers = {"lsp", "treesitter", "regex"},
            delay = 300,
            under_cursor = true,
            large_file_cutoff = nil,
            large_file_overrides = nil,
            min_count_to_highlight = 2
        }
    }
}
