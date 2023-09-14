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
source $HOME/.config/nvim/general/settings.vim
source $HOME/.config/nvim/general/functions.vim
]])

-- require("user.settings")
-- require("user.options") -- Some options missing from settings.vim file
require("user.keymaps")
require("shecho.lazy")

vim.cmd([[
  "source $HOME/.config/nvim/keys/which-key.vim
 "" source $HOME/.config/nvim/plug-config/floaterm.vim

]])
-- require("user.plugins.cmp")
-- require("user.plugins.copilot")
-- Lsp
-- require("user.plugins.luasnip")
-- require("user.plugins.lsp.lspconfig")
-- require("user.plugins.lsp.mason")
-- require("user.plugins.lsp.null-ls")
-- require("user.plugins.lsp.lspkind")

vim.cmd([[

set guifont=JetBrain\ Operator\ Fira\ Code\ Hack\ Nerd\ Font

syntax enable

]])
