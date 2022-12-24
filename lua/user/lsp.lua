local lsp = require('lsp-zero')
lsp.preset('recommended')

lsp.ensure_installed({
  'tsserver',
  'eslint',
  'typescript',
})
lsp.nvim_workspace()
lsp.setup()
