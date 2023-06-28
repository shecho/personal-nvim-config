vim.cmd([[
source $HOME/.config/nvim/vim-plug/plugins.vim
source $HOME/.config/nvim/general/settings.vim
source $HOME/.config/nvim/general/functions.vim
source $HOME/.config/nvim/themes/airline.vim
source $HOME/.config/nvim/themes/onedark.vim

]])

--require "user.settings"
--require "user.options" -- Some options missing from settings.vim file
--require "user.impatient"
require("user.keymaps")
require("user.illuminate")
require("user.true-zen")
require("user.plug-colorizer")
require("user.treesitter")
require("user.indentline")
require("user.autopairs")
require("user.autotag")
require("user.barbar")

-- Finders
require("user.nvim-tree")
require("user.telescope")
require("user.harpoon")
require("user.project")
--" require "user.copilot"

vim.cmd([[
  source $HOME/.config/nvim/keys/which-key.vim
  source $HOME/.config/nvim/plug-config/vim-commentary.vim
  source $HOME/.config/nvim/plug-config/better-whitespace.vim
  "source $HOME/.config/nvim/plug-config/fzf.vim
  source $HOME/.config/nvim/plug-config/codi.vim
  source $HOME/.config/nvim/plug-config/start-screen.vim
  source $HOME/.config/nvim/plug-config/gitgutter.vim
  source $HOME/.config/nvim/plug-config/git-messenger.vim
  source $HOME/.config/nvim/plug-config/floaterm.vim
  source $HOME/.config/nvim/plug-config/rainbow.vim
  source $HOME/.config/nvim/plug-config/quickscope.vim

]])

require("user.cmp")
require("user.copilot")
-- Lsp
require("user.lsp.lspsaga")
require("user.luasnip")
require("user.lsp.lspconfig")
require("user.lsp.mason")
require("user.lsp.null-ls")
require("user.lsp.lspkind")
-- vim.opt.guifont = { "Hack" }
vim.cmd([[

if !empty(glob("~/.config/nvim/paths.vim"))
  source $HOME/.config/nvim/paths.vim
endif
set guifont=JetBrain\ Operator\ Fira\ Code\ Hack\ Nerd\ Font
syntax enable

]])
