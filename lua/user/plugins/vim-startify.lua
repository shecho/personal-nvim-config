return {
  {
    "mhinz/vim-startify",
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- load the colorscheme here
      vim.cmd([[

      let g:startify_custom_header = [
      \ '  __     ___               ',
      \ '  \ \   / (_)_ __ ___      ',
      \ '   \ \ / /| | ''_ ` _ \    ',
      \ '    \ V / | | | | | | |    ',
      \ '     \_/  |_|_| |_| |_|    ',
      \ '',
      \ ]

      let g:startify_session_dir = '~/.config/nvim/session'


      let g:startify_lists = [
          \ { 'type': 'files',     'header': ['   Files']                        },
          \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
          \ { 'type': 'sessions',  'header': ['   Sessions']                     },
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']                    },
          \ ]


      let g:startify_session_autoload = 1
      let g:startify_session_delete_buffers = 1
      let g:startify_change_to_vcs_root = 1
      let g:startify_fortune_use_unicode = 1
      let g:startify_session_persistence = 1
      let g:webdevicons_enable_startify = 1


      let g:startify_bookmarks = [
            \ { 'c': '~/.config/kitty/kitty.conf' },
            \ { 'i': '~/.config/nvim/init.lua' },
            \ { 'l': '~/.zshrc' },
            \ { 'z': '/Users/sergio/' },
            \ '~/',
            \ ]

      let g:startify_enable_special = 0
      ]])
      local keymap = vim.keymap -- for conciseness
      keymap.set("n", "<leader>sp", "<cmd>Startify<cr>", { desc = "Start screen" })
    end,
  },
}
