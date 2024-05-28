return {
  {
    "echasnovski/mini.bufremove",
    -- stylua: ignore
    keys = {
      { "<leader>d", function() require("mini.bufremove").delete(0, false) end, desc = "Delete Buffer" },
      { "<leader>D", function() require("mini.bufremove").delete(0, true) end,  desc = "Delete Buffer (Force)" },
      { "<leader>Q", function() require("mini.bufremove").delete(0, true) end,  desc = "Delete Buffer (Force)" }
    }
,
  },
  {
    "glepnir/flybuf.nvim",
    cmd = "FlyBuf",
    keys = { { "=", "<cmd>FlyBuf<cr>", nowait = true, desc = "Buffers" } },
    config = function()
      require("flybuf").setup({})
    end,
  },
  -- { "rbgrouleff/bclose.vim", event = { "BufReadPre", "BufNewFile" }, confing = true },
  -- { "moll/vim-bbye", cmd = { "Bdelete" } },
}
