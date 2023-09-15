if vim.loader then
  vim.loader.enable()
  vim.schedule(function()
    vim.notify("nvim loader is enabled")
  end)
end

vim.cmd([[
source $HOME/.config/nvim/general/settings.vim
"source $HOME/.config/nvim/general/functions.vim
]])

-- require("user.settings")
-- require("user.options") -- Some options missing from settings.vim file
require("user.keymaps")
require("shecho.lazy")

vim.cmd([[
  "source $HOME/.config/nvim/keys/which-key.vim
]])

vim.cmd([[

set guifont=JetBrain\ Operator\ Fira\ Code\ Hack\ Nerd\ Font

syntax enable

]])
