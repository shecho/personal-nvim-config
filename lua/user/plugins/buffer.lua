return {
  {
    "echasnovski/mini.bufremove",
    -- stylua: ignore
    opts = {
      force = false,
    },
    keys = {
      -- {
      --   "<leader>d",
      --   function()
      --     require("mini.bufremove").delete(0, false)
      --   end,
      --   desc = "Delete Buffer",
      -- },
      {
        "<leader>DD",
        function()
          require("mini.bufremove").delete(0, true)
        end,
        desc = "Delete Buffer (Force)",
      },
      {
        "<leader>Q",
        function()
          require("mini.bufremove").delete(0, true)
        end,
        desc = "Delete Buffer (Force)",
      },
    },
  },
  {
    "glepnir/flybuf.nvim",
    cmd = "FlyBuf",
    keys = { { "=", "<cmd>FlyBuf<cr>", nowait = true, desc = "Buffers" } },
    opts = {},
  },
  -- { "rbgrouleff/bclose.vim", event = { "BufReadPre", "BufNewFile" }, confing = true },
  -- { "moll/vim-bbye", cmd = { "Bdelete" } },
}
