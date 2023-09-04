---@diagnostic disable: unused-local, undefined-global
local M = {}
local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("n", "<Space>", "", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "
keymap("n", "<C-Space>", "<cmd>WhichKey \\<leader><cr>", opts)
keymap("n", "<C-i>", "<C-i>", opts)

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation

keymap("n", "<m-h>", "<C-w>h", opts)
keymap("n", "<m-j>", "<C-w>j", opts)
keymap("n", "<m-k>", "<C-w>k", opts)
keymap("n", "<m-l>", "<C-w>l", opts)
-- Tabs --
-- keymap("n", "<m-t>", ":tabnew %<cr>", opts)
-- keymap("n", "<m-y>", ":tabclose<cr>", opts)
-- keymap("n", "<m-\\>", ":tabonly<cr>", opts)

-- Resize with arrows
keymap("n", "<S-Up>", ":resize -2<CR>", opts)
keymap("n", "<S-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize +2<CR>", opts)

keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)

-- Naviagate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- keymap("n", "<RightMouse>", ":Alpha<CR>", opts)

-- Move text up and down
keymap("n", "<A-J>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-K>", "<Esc>:m .-2<CR>==gi", opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "kj", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "<A-j>", ":m .+1<CR>==", opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Custom
keymap("n", "Q", "<cmd>Bdelete!<CR>", opts)
keymap("n", "d", "<cmd>BufferClose<CR>", opts)
-- keymap("n", "<F11>", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
keymap("n", "<C-p>", "<cmd>Telescope projects<cr>", opts)
keymap("n", "<leader>le", "<cmd> lua vim.lsp.buf.rename()<cr>", opts)
keymap("n", "<C-z>", "<cmd>TZMinimalist<cr>", opts)
-- keymap("n", "=", "<cmd>JABSOpen<cr>", { noremap = true, silent = true, nowait = true })
keymap("n", "<C-x>", '<cmd>lua require("ts-node-action").node_action()<cr>', opts)
-- keymap("n", "<C-c>", "<cmd>:noh<cr>", { noremap = true, silent = true, nowait = true })

vim.cmd([[nnoremap c* /\<<C-R>=expand('<cword>')<CR>\>\C<CR>``cgn]])

M.show_documentation = function()
	local filetype = vim.bo.filetype
	if vim.tbl_contains({ "vim", "help" }, filetype) then
		vim.cmd("h " .. vim.fn.expand("<cword>"))
	elseif vim.tbl_contains({ "man" }, filetype) then
		vim.cmd("Man " .. vim.fn.expand("<cword>"))
	elseif vim.fn.expand("%:t") == "Cargo.toml" then
		require("crates").show_popup()
	else
		vim.lsp.buf.hover()
	end
end

vim.api.nvim_set_keymap("n", "K", ":lua require('user.keymaps').show_documentation()<CR>", opts)
-- vim.api.nvim_set_keymap("n", "<c-e>", "NvimTreeToggle<cr>", opts)

vim.cmd([[
	imap <C-h> <C-w>h
	imap <C-j> <C-w>j
	imap <C-k> <C-w>k
	imap <C-l> <C-w>l
	" g Leader key
	let mapleader=" "
	" let localleader=" "
	nnoremap <Space> <Nop>
	" Better indenting
	vnoremap < <gv
	vnoremap > >gv
	" I hate escape more than anything else
	" inoremap k <Esc>
	" inoremap kj <Esc>
	nnoremap <leader>; :
	nnoremap s <Esc>
	xnoremap s <Esc>
	vnoremap s <Esc>
	" Easy CAPS
	inoremap <c-u> <ESC>viwUi
	nnoremap <c-u> viwU<Esc>
	vnoremap <c-u> viwU<Esc>
	" TAB in general mode will move to text buffer
	nnoremap <silent> <TAB> :bnext<CR>
	" SHIFT-TAB will go back
	" nnoremap <silent> <S-TAB> :bprevious<CR>

	" Move selected line / block of text in visual mode
	" shift + k to move up
	" shift + j to move down
	xnoremap K :move '<-2<CR>gv-gv
	xnoremap J :move '>+1<CR>gv-gv
	" Alternate way to save
	nnoremap <silent> <C-s> :w<CR>
	" Alternate way to quit
	nnoremap <silent> <C-Q> :wq!<CR>
	" Use control-c instead of escape
	nnoremap <silent> <C-c> <Esc>
	" <TAB>: completion.
	 inoremap <silent> <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
	 " inoremap <silent> <expr><C-j> pumvisible() ? "\<C-n>" : "\<TAB>"
	" Better window navigation
	nnoremap <C-h> <C-w>h
	nnoremap <C-j> <C-w>j
	nnoremap <C-k> <C-w>k
	nnoremap <C-l> <C-w>l
	" Use alt + hjkl to resize windows
	nnoremap <silent> <C-j>    :resize -2<CR>
	nnoremap <silent> <C-k>    :resize +2<CR>
	nnoremap <silent> <S-h>    :vertical resize -2<CR>
	nnoremap <silent> <S-l>    :vertical resize +2<CR>
	nnoremap <nowait><silent> <C-C> :noh<CR>

	" keymap("n", "<C-Up>", ":resize -2<CR>", opts)
	" keymap("n", "<C-Down>", ":resize +2<CR>", opts)
	" keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
	" keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

	" Better nav for omnicomplete
	" inoremap <expr> <c-j> ("\<C-n>")
	" inoremap <expr> <c-k> ("\<C-p>")

	"Some better remaps
	nnoremap Y y$ "
	nnoremap N Nzzzv
	nnoremap J mzJ`z
	cnoremap Q q

	" Select all and some surround like keybindings
	nmap <C-a> gg<S-v>Gy

	xnoremap <leader>9 xi()<Esc>P
	nnoremap <leader>9 ciw()<Esc>P

	xnoremap <leader>4 xi{}<Esc>P
	nnoremap <leader>4 ciw{}<Esc>P

	xnoremap <leader>5 xi[]<Esc>P
	nnoremap <leader>5 ciw[]<Esc>P

	xnoremap <leader>7 xi''<Esc>P
	nnoremap <leader>7 ciw''<Esc>P

	xnoremap <leader>8 xi""<Esc>P
	nnoremap <leader>8 ciw""<Esc>P

	nnoremap <leader>1 <c-^>


	
	nnoremap <leader>0 :e $MYVIMRC <CR>
	nnoremap <leader>lf :lua vim.lsp.buf.format({async = true})<CR>
	nnoremap <leader>lF :lua vim.lsp.buf.formating()<CR>
	nnoremap <leader>le :lua vim.lsp.buf.rename()<CR>
	nnoremap <leader>lq :lua vim.lsp.buf.code_action()<CR>
	nnoremap <leader>li :lua vim.lsp.buf.implementation()<CR>
	nnoremap <leader>aa :lua require("ts-node-action").node_action()<CR>

  function! QuickFixToggle()
    if empty(filter(getwininfo(), 'v:val.quickfix'))
      copen
    else
      cclose
    endif
  endfunction
]])

return M
