return {
  "xiyaowong/transparent.nvim",
  keys = {
    { "<leader>at", "<cmd>TransparentToggle<cr>", desc = "Document Diagnostics (Trouble)" },
  },
  config = function()
    require("transparent").setup({})
    -- opts = { use_diagnostic_signs = true },
  end,
}
