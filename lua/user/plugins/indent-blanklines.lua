return {
  "lukas-reineke/indent-blankline.nvim",
  -- cmd = { "IndentBlanklineEnable", "IndentBlanklineToggle", "IndentBlanklineDisable" },
  main = "ibl",
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    -- indent = { highlight = highlight },
    -- char = "▏",
    char = "│",
    filetype_exclude = {
      "help",
      "alpha",
      "dashboard",
      "neo-tree",
      "Trouble",
      "lazy",
      "mason",
      "notify",
      "toggleterm",
      "lazyterm",
      "help",
      "startify",
      "dashboard",
      "packer",
      "neogitstatus",
      -- "NvimTree",
      "Trouble",
      "text",
    },
    show_trailing_blankline_indent = false,
    show_current_context_start = true,
  },
  config = function()
    require("ibl").setup()
  end,
}
