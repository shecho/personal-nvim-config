return {
  -- {
  -- "tpope/vim-commentary",
  -- cmd = "Commentary",
  -- event = { "BufReadPre", "BufNewFile" },
  -- config = function()
  -- vim.cmd([[
  -- vnoremap <silent> <space>/ :call Comment()
  -- vnoremap <silent> <space>3 :Commentary
  -- vnoremap <silent> <leader>/ :Commentary<CR>
  -- autocmd FileType javascript.jsx setlocal commentstring={/*\ %s\ */}
  -- ]])
  -- end,
  -- },
  {
    "numToStr/Comment.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
    -- keys = {
    -- {
    -- "<leader>3",
    -- function()
    -- local api = require("Comment.api")
    -- local config = require("Comment.config"):get()
    -- local esc = vim.api.nvim_replace_termcodes("<ESC>", true, false, true)
    -- end,
    -- desc = "Comment",
    -- },
    -- },

    config = function()
      -- import comment plugin safely
      local comment = require("Comment")

      local ts_context_commentstring = require("ts_context_commentstring.integrations.comment_nvim")
      -- enable comment
      comment.setup({
        -- for commenting tsx and jsx files
        pre_hook = ts_context_commentstring.create_pre_hook(),
      })

      local keymap = vim.keymap -- for conciseness
      local api = require("Comment.api")
      local config = require("Comment.config"):get()
      local esc = vim.api.nvim_replace_termcodes("<ESC>", true, false, true)

      -- keymap.set(
      -- "n",
      -- "<leader>3",
      -- "<cmd>lua require('Comment.api').toggle.linewise.current()<cr>",
      -- { desc = "Comment" }
      -- )
      -- keymap.set(
      -- "v",
      -- "<leader>3",
      -- "<ESC><CMD>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>",
      -- { desc = "Comment" }
      -- )
      keymap.set(
        "x",
        "<leader>/",
        "<ESC><CMD>lua require('Comment.api').locked.toggle_linewise_op(vim.fn.visualmode())<CR>",
        { desc = "Comment" }
      )
      keymap.set("n", "<leader>3", api.locked("toggle.linewise.current"))
      keymap.set("v", "<leader>3", api.locked("toggle.linewise.count"))
      keymap.set("x", "<leader>3", function()
        vim.api.nvim_feedkeys(esc, "nx", false)
        api.locked("toggle.linewise")(vim.fn.visualmode())
      end)

      -- Linewise toggle using C-/
    end,
  },
}
