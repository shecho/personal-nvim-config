return {
  {
    "lewis6991/gitsigns.nvim",
    cmd = { "Gitsigns" },
    -- event = { "BufReadPre", "BufNewFile" },
    config = true,
  },
  {
    "tpope/vim-fugitive",
    event = { "BufReadPre", "BufNewFile" },
    config = function() end,
    keys = {
      { "<leader>ga", "<cmd>Git add .<cr>", nowait = true, desc = "Add" },
      { "<leader>gc", "<cmd>Git commit<cr>", nowait = true, desc = "Commit" },
      { "<leader>gD", "<cmd>Git diff<cr>", nowait = true, desc = "Diff" },
      { "<leader>gd", "<cmd>Gvdiffsplit<cr>", nowait = true, desc = "Diff split" },
      -- { "<leader>gd", "<cmd>Git diff<cr>", nowait = true, desc = "Diff" },
      { "<leader>gp", "<cmd>Git push<cr>", nowait = true, desc = "Push" },
      { "<leader>gP", "<cmd>Git pull<cr>", nowait = true, desc = "Pull" },
    },
  },
  {
    "junegunn/gv.vim",
    -- event = { "BufReadPre", "BufNewFile" },
    cmd = { "GV" },
    keys = {
      { "<leader>gh", "<cmd>GV<cr>", nowait = true, desc = "Git History" },
      { "<leader>gH", "<cmd>GV!<cr>", nowait = true, desc = "Buffer commits" },
    },
    config = function() end,
  },
  {
    "f-person/git-blame.nvim",
    -- event = { "BufReadPre", "BufNewFile" },
    cmd = { "GitBlameToggle" },
    keys = { { "<leader>gb", "<cmd>GitBlameToggle<cr>", nowait = true, desc = "Git Blame" } },
    config = function()
      local blame = require("gitblame")
      blame.setup({
        enabled = false,
      })
      vim.cmd([[
        let g:gitblame_enabled = 0
      ]])
    end,
  },
  {
    "mbbill/undotree",
    keys = {
      { "<leader>u", "<cmd>UndotreeToggle<cr>", desc = "UndotreeToggle", noremap = true, nowait = true, silent = true },
    },
    -- event = { "BufReadPre", "BufNewFile" },
    cmd = { "UndotreeToggle" },
    config = function() end,
  },
  -- {
  --   "airblade/vim-gitgutter",
  --   event = { "BufReadPre", "BufNewFile" },
  --   config = function()
  --     vim.cmd([[
  --           let g:gitgutter_sign_added              = ''
  --           let g:gitgutter_sign_modified           = '▎'
  --           let g:gitgutter_sign_removed            = ''
  --           let g:gitgutter_sign_removed_first_line = '▎'
  --           let g:gitgutter_sign_modified_removed   = '▎'
  --           let g:gitgutter_preview_win_floating = 1
  --
  --           let g:gitgutter_enabled = 1
  --
  --           highlight GitGutterAdd    guifg=#98c379 ctermfg=2
  --           highlight GitGutterChange guifg=#61afef ctermfg=3
  --           highlight GitGutterDelete guifg=#e06c75 ctermfg=1
  --           ]])
  --   end,
  -- },
}
