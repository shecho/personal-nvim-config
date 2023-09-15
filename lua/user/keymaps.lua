---@diagnostic disable: unused-local, undefined-global
local M = {}
local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

-- Remap space as leader key
keymap("n", "<Space>", "", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "
-- keymap("n", "<C-Space>", "<cmd>WhichKey \\<leader><cr>", opts)
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

-- Resize with arrows
-- keymap("n", "<S-Up>", ":resize -2<CR>", opts)
-- keymap("n", "<S-Down>", ":resize +2<CR>", opts)
-- keymap("n", "<C-Left>", ":vertical resize +2<CR>", opts)
-- keymap("n", "<C-Right>", ":vertical resize -2<CR>", opts)

-- Better movement on the code
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)

-- Naviagate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Move text up and down
keymap("n", "<A-J>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-K>", "<Esc>:m .-2<CR>==gi", opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "kj", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", ">", ">gv", opts)
keymap("v", "<", "<gv", opts)
-- Move text up and down
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "<A-j>", ":m .+1<CR>==", opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Project move to telescope
keymap("n", "<C-p>", "<cmd>Telescope projects<cr>", opts)

-- LSP move to lsp config
keymap("n", "<leader>le", "<cmd> lua vim.lsp.buf.rename()<cr>", opts)

-- keymap("n", "<F11>", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
-- zen mode
keymap("n", "<C-z>", "<cmd>TZMinimalist<cr>", opts)
-- keymap("n", "=", "<cmd>JABSOpen<cr>", { noremap = true, silent = true, nowait = true })

-- Some actions
keymap("n", "<C-x>", '<cmd>lua require("ts-node-action").node_action()<cr>', opts)
keymap("n", "<leader>u", "<cmd>UndotreeToggle<cr>", opts)

-- Floaterm
keymap("n", "<leader>2", "<cmd>FloatermToggle<cr>", opts)
keymap("t", "<leader>2", "<cmd>FloatermToggle<cr>", opts)
keymap("v", "<leader>2", "<cmd>FloatermToggle<cr>", opts)

-- remove S as a command
keymap("n", "<leader>;", ":", opts)
keymap("n", "s", "<Esc>", opts)
keymap("v", "s", "<Esc>", opts)
keymap("x", "s", "<Esc>", opts)

-- TABS and buffer
keymap("n", "<TAB>", "<cmd>bnext<cr>", opts)
keymap("n", "<S-TAB>", "<cmd>bprevious<cr>", opts)
keymap("n", "Q", "<cmd>Bdelete!<CR>", opts)
keymap("n", "<leader>1", "<c-^>", { noremap = true, silent = true, nowait = true, desc = "Previous file" })

-- esc
keymap("n", "<C-c>", "<Esc>", { noremap = true, silent = true, nowait = true })
keymap("n", "<C-c>", "<cmd>:noh<cr>", { noremap = true, silent = true, nowait = true })

-- select_all
keymap("n", "<C-a>", "gg<S-v>Gy", { noremap = true, silent = true, nowait = true, desc = "Select all" })

-- Alternate way to save
keymap("n", "<C-s>", "<cmd>w<cr>", { noremap = true, silent = true, nowait = true })
keymap("n", "<C-q>", "<cmd>:wq!<cr>", { noremap = true, silent = true, nowait = true })

-- nnoremap <leader>0 :e $MYVIMRC <CR>
keymap("n", "<leader>0", "<cmd>e $MYVIMRC<cr>", { noremap = true, silent = true, nowait = true, desc = "MyVimrc" })

-- splits
keymap("n", "<leader>v", "<C-W>v", { noremap = true, silent = true, nowait = true, desc = "Vertical Split" })
keymap("n", "<leader>ah", "<C-W>s", { noremap = true, silent = true, nowait = true, desc = "Vertical Split" })

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

	" Easy CAPS
	inoremap <c-u> <ESC>viwUi
	nnoremap <c-u> viwU<Esc>
	vnoremap <c-u> viwU<Esc>
	" Better window navigation
	nnoremap <C-h> <C-w>h
	nnoremap <C-j> <C-w>j
	nnoremap <C-k> <C-w>k
	nnoremap <C-l> <C-w>l
	nnoremap <silent> <C-j>    :resize -2<CR>
	nnoremap <silent> <C-k>    :resize +2<CR>
	nnoremap <silent> <S-h>    :vertical resize -2<CR>
	nnoremap <silent> <S-l>    :vertical resize +2<CR>

	"Some better remaps
	nnoremap Y y$ "
	nnoremap J mzJ`z
	cnoremap Q q

"sorround remaps
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

	"nnoremap <leader>1 <c-^>


" TODO: move to lsp config"
	nnoremap <leader>lf :lua vim.lsp.buf.format({async = true})<CR>
	nnoremap <leader>lF :lua vim.lsp.buf.formating()<CR>
	nnoremap <leader>le :lua vim.lsp.buf.rename()<CR>
	nnoremap <leader>lq :lua vim.lsp.buf.code_action()<CR>
	nnoremap <leader>li :lua vim.lsp.buf.implementation()<CR>
	nnoremap <leader>aa :lua require("ts-node-action").node_action()<CR>
]])
return M
