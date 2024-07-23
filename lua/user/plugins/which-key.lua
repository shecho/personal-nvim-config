return {
  "folke/which-key.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "echasnovski/mini.icons",
  },
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 200
  end,
  opts = {
    plugins = { spelling = true },
  },
  config = function(_, opts)
    local wk = require("which-key")
    wk.setup(opts)
    wk.add({
      { "<leader>a", group = "Actions" },
      { "<leader>b", group = "Buffer" },
      { "<leader>g", group = "git" },
      { "<leader>l", group = "Lsp" },
      { "<leader>n", group = "Harpoon" },
      { "<leader>s", group = "Search" },
      { "<leader>U", group = "Notify" },
      { "<leader>x", group = "Troble" },
    })

    -- wk.register(opts.defaults)
  end,
}
