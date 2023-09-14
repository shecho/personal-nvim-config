return {
  {
    "tpope/vim-commentary",
    cmd = "Commentary",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      vim.cmd([[
          vnoremap <silent> <space>/ :call Comment()
          vnoremap <silent> <space>3 :Commentary
          vnoremap <silent> <leader>/ :Commentary<CR>
          autocmd FileType javascript.jsx setlocal commentstring={/*\ %s\ */}
        ]])
    end,
  },
}
