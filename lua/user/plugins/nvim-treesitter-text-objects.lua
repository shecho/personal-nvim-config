return {
  "nvim-treesitter/nvim-treesitter-textobjects",
  event = { "BufReadPost", "BufNewFile" },
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  config = function()
    require("nvim-treesitter.configs").setup({
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            -- You can use the capture groups defined in textobjects.scm
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["at"] = "@class.outer",
            ["it"] = "@class.inner",
            ["ac"] = "@call.outer",
            ["ic"] = "@call.inner",
            ["aa"] = "@parameter.outer",
            ["ia"] = "@parameter.inner",
            ["al"] = "@loop.outer",
            ["il"] = "@loop.inner",
            ["ai"] = "@conditional.outer",
            ["ii"] = "@conditional.inner",
            ["a/"] = "@comment.outer",
            ["i/"] = "@comment.inner",
            ["ab"] = "@block.outer",
            ["ib"] = "@block.inner",
            ["as"] = "@statement.outer",
            ["is"] = "@scopename.inner",
            ["aA"] = "@attribute.outer",
            ["iA"] = "@attribute.inner",
            ["aF"] = "@frame.outer",
            ["iF"] = "@frame.inner",
          },
        },
        move = {
          enable = true,
          set_jumps = true, -- whether to set jumps in the jumplist
          goto_next_start = {
            ["am"] = "@function.outer",
            ["a]"] = "@class.outer",
          },
          goto_next_end = {
            ["AM"] = "@function.outer",
            ["]["] = "@class.outer",
          },
          goto_previous_start = {
            ["[m"] = "@function.outer",
            -- ["[["] = "@class.outer",
          },
          goto_previous_end = {
            ["[M"] = "@function.outer",
            ["[]"] = "@class.outer",
          },
        },
        swap = {
          -- swap_next = { ["<leader>."] = "@parameter.inner" },
          -- swap_previous = { ["<leader>,"] = "@parameter.inner" },
          enable = true,
          swap_next = {
            ["<leader>on"] = "@parameter.inner", -- swap object under cursor with next
          },
          swap_previous = {
            ["<leader>op"] = "@parameter.inner", -- swap object under cursor with previous
          },
        },
      },
    })
  end,
}
