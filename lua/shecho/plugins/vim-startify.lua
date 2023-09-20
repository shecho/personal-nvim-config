return {
	{
		"mhinz/vim-startify",
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			-- load the colorscheme here
			vim.cmd([[

let g:startify_custom_header = [
  \ '        _   ___    ________          __   ',
  \ '       / | / / |  / / ____/___  ____/ /__ ',
  \ '      /  |/ /| | / / /   / __ \/ __  / _ \',
  \ '     / /|  / | |/ / /___/ /_/ / /_/ /  __/',
  \ '    /_/ |_/  |___/\____/\____/\__,_/\___/ ',
  \]
                                
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
      \ { 'i': '~/.config/nvim/init.vim' },
      \ { 'l': '~/.zshrc' },
      \ { 'z': '/Users/sergio.valencia/Documents/' },
      \ '~/',
      \ ]

let g:startify_enable_special = 0
      ]])
		end,
	},
}
