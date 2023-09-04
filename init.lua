if vim.loader then
	vim.loader.enable()
	vim.schedule(function()
		vim.notify("nvim loader is enabled")
	end)
end
vim.api.nvim_create_autocmd("User", {
	pattern = "LazyVimStarted",
	callback = function()
		vim.schedule(function()
			-- require("util.profiler").stop()
		end)
	end,
})

vim.cmd([[
"source $HOME/.config/nvim/vim-plug/plugins.vim
source $HOME/.config/nvim/general/settings.vim
source $HOME/.config/nvim/general/functions.vim
"source $HOME/.config/nvim/themes/airline.vim
"source $HOME/.config/nvim/themes/onedark.vim

]])

require("user.settings")
require("user.options") -- Some options missing from settings.vim file
require("user.keymaps")
require("shecho.lazy")

-- require("user.plugins.illuminate")
-- require("user.plugins.true-zen")
-- require("user.plugins.plug-colorizer")
-- require("user.plugins.treesitter")
-- require("user.plugins.indentline")
-- require("user.plugins.autopairs")
-- require("user.plugins.autotag")
-- require("user.plugins.barbar")

-- Finders
-- require("user.plugins.telescope")
-- require("user.plugins.harpoon")
-- require("user.plugins.project")
-- require("user.nvim-tree")
--" require "user.copilot"

vim.cmd([[
  "source $HOME/.config/nvim/keys/which-key.vim
 " source $HOME/.config/nvim/plug-config/vim-commentary.vim
  "source $HOME/.config/nvim/plug-config/fzf.vim
  "source $HOME/.config/nvim/plug-config/codi.vim
  "source $HOME/.config/nvim/plug-config/start-screen.vim
  "source $HOME/.config/nvim/plug-config/gitgutter.vim
 "" source $HOME/.config/nvim/plug-config/floaterm.vim
  "source $HOME/.config/nvim/plug-config/rainbow.vim
 " source $HOME/.config/nvim/plug-config/quickscope.vim

]])

-- require("user.plugins.cmp")
-- require("user.plugins.copilot")
-- Lsp
-- require("user.plugins.lsp.lspsaga")
-- require("user.plugins.luasnip")
-- require("user.plugins.lsp.lspconfig")
-- require("user.plugins.lsp.mason")
-- require("user.plugins.lsp.null-ls")
-- require("user.plugins.lsp.lspkind")
-- vim.opt.guifont = { "Hack" }

-- vim.cmd([[

-- if !empty(glob("~/.config/nvim/paths.vim"))
--   source $HOME/.config/nvim/paths.vim
-- endif
-- set guifont=JetBrain\ Operator\ Fira\ Code\ Hack\ Nerd\ Font

-- syntax enable

-- ]])
