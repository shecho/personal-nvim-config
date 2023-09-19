if vim.loader then
  vim.loader.enable()
  vim.schedule(function()
    vim.notify("nvim loader is enabled")
  end)
end

vim.cmd([[
  source $HOME/.config/nvim/general/settings.vim
]])

require("user.keymaps")
require("shecho.lazy")

vim.cmd([[
  set guifont=JetBrain\ Operator\ Fira\ Code\ Hack\ Nerd\ Font
  syntax enable
]])
