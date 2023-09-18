---@diagnostic disable: unused-local, undefined-global
local M = {}
local opts = { noremap = true, silent = true }
local km = vim.api.nvim_set_keymap
local keymap = vim.keymap.set

-- Remap space as leader key
km("n", "<Space>", "", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "
-- keymap("n", "<C-Space>", "<cmd>WhichKey \\<leader><cr>", opts)
km("n", "<C-i>", "<C-i>", opts)

-- Modes
--   normal_mode = "n",
-- insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation

km("n", "<m-h>", "<C-w>h", opts)
km("n", "<m-j>", "<C-w>j", opts)
km("n", "<m-k>", "<C-w>k", opts)
km("n", "<m-l>", "<C-w>l", opts)

-- Resize with arrows
-- keymap("n", "<S-Up>", ":resize -2<CR>", opts)
-- keymap("n", "<S-Down>", ":resize +2<CR>", opts)
-- keymap("n", "<C-Left>", ":vertical resize +2<CR>", opts)
-- keymap("n", "<C-Right>", ":vertical resize -2<CR>", opts)

-- Better movement on the code
km("n", "n", "nzzzv", opts)
km("n", "N", "Nzzzv", opts)

-- Naviagate buffers
km("n", "<S-l>", ":bnext<CR>", opts)
km("n", "<S-h>", ":bprevious<CR>", opts)

-- Move text up and down
km("n", "<A-J>", "<Esc>:m .+1<CR>==gi", opts)
km("n", "<A-K>", "<Esc>:m .-2<CR>==gi", opts)

-- Insert --
-- Press jk fast to enter
km("i", "kj", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
km("v", ">", ">gv", opts)
km("v", "<", "<gv", opts)
-- Move text up and down
km("v", "<A-k>", ":m .-2<CR>==", opts)
km("v", "<A-j>", ":m .+1<CR>==", opts)

-- Visual Block --
-- Move text up and down
km("x", "J", ":move '>+1<CR>gv-gv", opts)
km("x", "K", ":move '<-2<CR>gv-gv", opts)
km("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
km("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- LSP move to lsp config
km("n", "<leader>le", "<cmd> lua vim.lsp.buf.rename()<cr>", opts)

-- keymap("n", "<F11>", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
-- zen mode
km("n", "<C-z>", "<cmd>TZMinimalist<cr>", opts)
-- keymap("n", "=", "<cmd>JABSOpen<cr>", { noremap = true, silent = true, nowait = true })

-- Some actions
km("n", "<C-x>", '<cmd>lua require("ts-node-action").node_action()<cr>', opts)
km("n", "<leader>u", "<cmd>UndotreeToggle<cr>", opts)

-- Floaterm
opts.desc = "Floaterm toogle"
keymap({ "n", "t", "v" }, "<leader>2", "<cmd>FloatermToggle<cr>", opts)

-- remove S as a command
km("n", "<leader>;", ":", opts)
keymap({ "n", "v", "x" }, "s", "<Esc>", opts)

-- TABS and buffer
km("n", "<TAB>", "<cmd>bnext<cr>", opts)
km("n", "<S-TAB>", "<cmd>bprevious<cr>", opts)
km("n", "Q", "<cmd>Bdelete!<CR>", opts)
opts.desc = "Delete buffer"
km("n", "<leader>q", "<cmd>Bdelete<CR>", opts)
km("n", "<leader>1", "<c-^>", { noremap = true, silent = true, nowait = true, desc = "Previous file" })

-- esc
km("n", "<C-c>", "<Esc>", { noremap = true, silent = true, nowait = true })
km("n", "<C-c>", "<cmd>:noh<cr>", { noremap = true, silent = true, nowait = true })

-- select_all
km("n", "<C-a>", "gg<S-v>Gy", { noremap = true, silent = true, nowait = true, desc = "Select all" })

-- Alternate way to save
km("n", "<C-s>", "<cmd>w<cr>", { noremap = true, silent = true, nowait = true })
km("n", "<C-q>", "<cmd>:wq!<cr>", { noremap = true, silent = true, nowait = true })

-- nnoremap <leader>0 :e $MYVIMRC <CR>
km("n", "<leader>0", "<cmd>e $MYVIMRC<cr>", { noremap = true, silent = true, nowait = true, desc = "MyVimrc" })

-- splits
keymap("n", "<leader>v", "<C-W>v", { noremap = true, silent = true, nowait = true, desc = "Vertical Split" })
keymap("n", "<leader>ah", "<C-W>s", { noremap = true, silent = true, nowait = true, desc = "Hori Split" })

-- ease caps
-- " inoremap <c-u> <ESC>viwUi

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
keymap("n", "K", ":lua require('user.keymaps').show_documentation()<CR>", opts)

vim.cmd([[
	" Easy CAPS
	" nnoremap <c-u> viwU<Esc>
	" vnoremap <c-u> viwU<Esc>
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

    " TODO: move to lsp config"
	nnoremap <leader>lf :lua vim.lsp.buf.format({async = true})<CR>
	nnoremap <leader>lF :lua vim.lsp.buf.formating()<CR>
	nnoremap <leader>le :lua vim.lsp.buf.rename()<CR>
	nnoremap <leader>lq :lua vim.lsp.buf.code_action()<CR>
	nnoremap <leader>li :lua vim.lsp.buf.implementation()<CR>
]])
return M
