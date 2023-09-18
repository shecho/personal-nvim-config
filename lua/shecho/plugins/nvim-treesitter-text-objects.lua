return {
    "nvim-treesitter/nvim-treesitter-textobjects",
    event = {"BufReadPost", "BufNewFile"},
    dependencies = {"nvim-treesitter/nvim-treesitter"},
    config = function()
        require("nvim-treesitter.configs").setup({
            textobjects = {
                select = {
                    enable = false,
                    -- Automatically jump forward to textobj, similar to targets.vim
                    lookahead = true
                }
                -- swap = {
                --   enable = true,
                --   swap_next = {
                --     ["<leader>on"] = "@parameter.inner", -- swap object under cursor with next
                --   },
                --   swap_previous = {
                --     ["<leader>op"] = "@parameter.inner", -- swap object under cursor with previous
                --   },
                -- },
            }
        })
    end
}
