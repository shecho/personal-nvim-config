return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 200
  end,
  opts = {
    plugins = { spelling = true },
    defaults = {
      mode = { "n", "v" },
      ["g"] = { name = "+git" },
      ["<leader>b"] = { name = "+Buffer" },
      ["<leader>a"] = { name = "+Actions" },
      ["<leader>s"] = { name = "+Search" },
      ["<leader>g"] = { name = "+Git" },
      ["<leader>l"] = { name = "+Lsp" },
      ["<leader>u"] = { name = "+Notify" },
      ["<leader>x"] = { name = "+Diagnostics/quickfix" },
      ["<leader>n"] = { name = "+Harpoon" },
    },
  },
  config = function(_, opts)
    local wk = require("which-key")
    wk.setup(opts)
    wk.register(opts.defaults)
  end,
}
