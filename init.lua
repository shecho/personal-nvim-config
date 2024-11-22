if vim.loader then
  vim.loader.enable()
  vim.schedule(function()
    vim.notify("nvim is enabled")
  end)
end

require("user.options")
require("user.core")
require("user.keymaps")
require("user.lazy")

-- vim.cmd([[
--   highlight Normal guibg=none
--   highlight NonText guibg=none
--   highlight Normal ctermbg=none
--   highlight NonText ctermbg=none
-- ]])
