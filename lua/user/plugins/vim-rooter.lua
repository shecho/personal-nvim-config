return {
  "airblade/vim-rooter",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    vim.cmd([[
        let g:rooter_silent_chdir = 1
            ]])
  end,
}
