return {
  "stevearc/dressing.nvim",
  event = "VeryLazy",
  lazy = true,
  init = function()
    ---@diagnostic disable-next-line: duplicate-set-field
    local lazy = require("lazy")
    vim.ui.select = function(...)
      lazy.load({ plugins = { "dressing.nvim" } })
      return vim.ui.select(...)
    end
    ---@diagnostic disable-next-line: duplicate-set-field
    vim.ui.input = function(...)
      lazy.load({ plugins = { "dressing.nvim" } })
      return vim.ui.input(...)
    end
  end,
}
