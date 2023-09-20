return {
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = true,
	},
	{
		"tpope/vim-fugitive",
		event = { "BufReadPre", "BufNewFile" },
		config = function() end,
	},
	{
		"junegunn/gv.vim",
		event = { "BufReadPre", "BufNewFile" },
		config = function() end,
	},
	{
		"f-person/git-blame.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function() end,
	}, -- some changes
	{
		"mbbill/undotree",
		event = { "BufReadPre", "BufNewFile" },
		config = function() end,
	}, -- some changes
	{
		"airblade/vim-gitgutter",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			vim.cmd([[
            let g:gitgutter_sign_added              = ''
            let g:gitgutter_sign_modified           = '▎'
            let g:gitgutter_sign_removed            = ''
            let g:gitgutter_sign_removed_first_line = '▎'
            let g:gitgutter_sign_modified_removed   = '▎'
            let g:gitgutter_preview_win_floating = 1

            let g:gitgutter_enabled = 1

            highlight GitGutterAdd    guifg=#98c379 ctermfg=2
            highlight GitGutterChange guifg=#61afef ctermfg=3
            highlight GitGutterDelete guifg=#e06c75 ctermfg=1
            ]])
		end,
	},
}
