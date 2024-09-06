return {
  "xiyaowong/transparent.nvim",
  keys = {
    { "<leader>at", "<cmd>TransparentToggle<cr>", desc = "TransparentToggle" },
  },
  config = function()
    require("transparent").setup({})
    -- opts = { use_diagnostic_signs = true },
  end,
}
