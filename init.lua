if vim.loader then
  vim.loader.enable()
  vim.schedule(function()
    vim.notify("nvim loader is enabled")
  end)
end

require("users.options")
require("users.keymaps")
require("user.lazy")

vim.cmd([[
  set guifont=JetBrain\ Operator\ Fira\ Code\ Hack\ Nerd\ Font
  autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
  cmap w!! w !sudo tee %
  syntax enable
]])
