return {
  {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      -- calling `setup` is optional for customization
      require("fzf-lua").setup({})
      local keymap = vim.keymap -- for conciseness
      keymap.set("n", "<leader>ss", "<cmd>FzfLua live_grep<cr>", { desc = "Fuzzy find files" })
      keymap.set("n", "<leader>sM'", "<cmd>FzfLua marks<cr>", { desc = "Marks" })
    end,
  },
  {
    "junegunn/fzf",
    build = "./install --bin",
    config = function()
      local keymap = vim.keymap -- for conciseness
      keymap.set("n", "<leader>sS", "<cmd>Fzf<cr>", { desc = "Fuzzy find files" })
    end,
  },
}
