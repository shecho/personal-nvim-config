return {
  {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      -- calling `setup` is optional for customization
      require("fzf-lua").setup({
        winopts = {
          win_height = 0.95,
          win_width = 0.90,
        },
      })
      local keymap = vim.keymap -- for conciseness
      keymap.set("n", "<leader>ss", "<cmd>FzfLua live_grep<cr>", { desc = "Fuzzy find files" })
      keymap.set("n", "<leader>sM", "<cmd>FzfLua marks<cr>", { desc = "Marks" })
      keymap.set("n", "<leader>F", "<cmd>FzfLua files<cr>", { desc = "Find files" })
      keymap.set("n", "<leader>P", "<cmd>FzfLua files<cr>", { desc = "Find files" })
      keymap.set("n", "<leader>sB", "<cmd>FzfLua buffers<cr>", { desc = "Find buffers" })
      keymap.set("n", "<leader>sO", "<cmd>FzfLua oldfiles<cr>", { desc = "Find oldfiles" })
      keymap.set("n", "<leader>sW", "<cmd>FzfLua grep_cword<cr>", { desc = "Find current word" })
      keymap.set(
        "n",
        "<leader>sF",
        "<cmd>lua require('fzf-lua').files({ ['winopts.split'] = 'belowright new' })<cr>",
        -- :FzfLua files winopts.split=belowright\ new
        { desc = "Files system" }
      )
    end,
  },
  {
    "junegunn/fzf",
    build = "./install --bin",
    config = function()
      local keymap = vim.keymap -- for conciseness
      keymap.set("n", "<leader>sS", "<cmd>Fzf files<cr>", { desc = "Fuzzy find files" })
    end,
  },
}
