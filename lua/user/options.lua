local options = {
	backup = false, -- creates a backup file
	nu = true,
	clipboard = "unnamedplus", -- allows neovim to access the system clipboard
	completeopt = { "menuone", "noselect" }, -- mostly just for cmp
	conceallevel = 0, -- so that `` is visible in markdown files
	fileencoding = "utf-8", -- the encoding written to a file
	hlsearch = true, -- highlight all matches on previous search pattern
	ignorecase = true, -- ignore case in search patterns
	mouse = "a", -- allow the mouse to be used in neovim
	pumheight = 10, -- pop up menu height
	showmode = false, -- we don't need to see things like -- INSERT -- anymore
	showtabline = 2, -- always show tabs
	smartcase = true, -- smart case
	smartindent = true, -- make indenting smarter again
	splitbelow = true, -- force all horizontal splits to go below current window
	splitright = true, -- force all vertical splits to go to the right of current window
	swapfile = false, -- creates a swapfile
	termguicolors = true, -- set term gui colors (most terminals support this)
	undofile = true, -- enable persistent undo writebackup = false, -- if a expandtab = true, -- convert tabs to spaces
	shiftwidth = 2, -- the number of spaces inserted for each indentation
	tabstop = 4, -- insert 2 spaces for a tab
	softtabstop = 4,
	cursorline = true, -- highlight the current line
	number = true, -- set numbered lines
	laststatus = 2,
	showcmd = false,
	ruler = false,
	relativenumber = true, -- set relative numbered lines
	numberwidth = 4, -- set number column width to 2 {default 4}
	signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time
	wrap = false, -- display lines as one long line
	-- scrolloff = 8,                           -- is one of my fav
	sidescrolloff = 8,
	-- guifont = "monospace:h17", -- the font used in graphical neovim applications
	title = true,
	cmdheight = 2,
	-- t_Co = 256,
	smarttab = true,
	autoindent = true,
	background = "dark",
	-- noshowmode = true,
	-- nobackup = true,
	-- nowritebackup = true,
	updatetime = 300,
	timeoutlen = 100,
	incsearch = true,
	-- colorcolumn = "80",
	-- colorcolumn = "120",
}
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1
-- vim.opt.fillchars.eob = " "
-- vim.opt.fillchars = vim.opt.fillchars + "vertleft: "
-- vim.opt.fillchars = vim.opt.fillchars + "vertright: "
vim.opt.fillchars = vim.opt.fillchars + "eob: "
vim.opt.fillchars:append({
	stl = " ",
})
vim.opt.shortmess:append("c")
vim.opt.clipboard = "unnamedplus"

for k, v in pairs(options) do
	vim.opt[k] = v
end
vim.cmd("set whichwrap+=<,>,[,],h,l")
vim.cmd([[set formatoptions-=cro]]) -- TODO: this doesn't seem to work
vim.cmd([[ syntax enable ]]) -- TODO: this doesn't seem to work

vim.filetype.add({
	extension = {
		conf = "dosini",
	},
})
