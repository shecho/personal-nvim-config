if vim.loader then
  vim.loader.enable()
  vim.schedule(function()
    vim.notify("nvim loader is enabled")
  end)
end

require("user.options")
require("user.keymaps")
require("user.lazy")

vim.cmd([[
  set guifont=JetBrain\ Operator\ Fira\ Code\ Hack\ Nerd\ Font
  cmap w!! w !sudo tee %
]])
