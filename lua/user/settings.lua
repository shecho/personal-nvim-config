vim.cmd([[
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
	" You can't stop me
	cmap w!! w !sudo tee %
]])
