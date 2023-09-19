---@diagnostic disable: undefined-global

-- local lsp_status, lspzero = pcall(require, "lsp-zero")
-- if not lsp_status then
-- 	return
-- end
local cmp_status, cmp = pcall(require, "cmp")
if not cmp_status then
  return
end
-- import lspconfig plugin safely
local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status then
  return
end

-- import cmp-nvim-lsp plugin safelylspcon
local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then
  return
end

-- import typescript plugin safely
local typescript_setup, typescript = pcall(require, "typescript")
if not typescript_setup then
  return
end

local keymap = vim.keymap -- for conciseness
-- local protocol = require("vim.lsp.protocol")
-- local augroup_format = vim.api.nvim_create_augroup("Format", { clear = true })

-- vim.api.nvim_create_autocmd("BufWritePre", {
-- 	group = vim.api.nvim_create_augroup("LspFormatting", { clear = true }),
-- 	buffer = bufnr,
-- 	callback = function()
-- 		vim.lsp.buf.format()
-- 	end,
-- })
-- enable keybinds only for when lsp server available
local on_attach = function(client, bufnr)
  -- keybind options
  local opts = { noremap = true, silent = true, buffer = bufnr }
  -- set keybinds
  keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts) -- go to implementation
  keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts) -- see available code actions
  -- typescript specific keymaps (e.g. rename file and update imports)
  -- if client.name == "tsserver" then
  --   keymap.set("n", "<leader>rf", ":TypescriptRenameFile<CR>") -- rename file and update imports
  --   keymap.set("n", "<leader>oi", ":TypescriptOrganizeImports<CR>") -- organize imports (not in youtube nvim video)
  --   keymap.set("n", "<leader>ru", ":TypescriptRemoveUnused<CR>") -- remove unused variables (not in youtube nvim video)
  -- end
end

-- used to enable autocompletion (assign to every lsp server config)
local capabilities = cmp_nvim_lsp.default_capabilities()

-- Change the Diagnostic symbols in the sign column (gutter)
-- (not in youtube nvim video)
local signs = { Error = " ", Warn = " ", Hint = "ﴞ ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

-- configure html server
lspconfig["html"].setup({
  on_attach = function(_, bufnr)
    on_attach(_, bufnr)
  end,
})

-- configure typescript server with plugin
-- lspconfig["tsserver"].setup({
-- 	capabilities = capabilities,
-- 	on_attach = on_attach,
-- filetypes = { "typescript", "typescriptreact", "typescript.tsx" },

-- })

lspconfig.flow.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

typescript.setup({
  server = {
    capabilities = capabilities,
    on_attach = on_attach,
  },
})
lspconfig["tsserver"].setup({
  capabilities = capabilities,
  cmd = { "typescript-language-server", "--stdio" },
  on_attach = function(_, bufnr)
    on_attach(_, bufnr)
  end,
  filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
})

-- configure css server
lspconfig["cssls"].setup({
  capabilities = capabilities,
  on_attach = function(_, bufnr)
    on_attach(_, bufnr)
  end,
})

-- configure tailwindcss server
lspconfig["tailwindcss"].setup({
  capabilities = capabilities,
  on_attach = function(_, bufnr)
    on_attach(_, bufnr)
  end,
})

lspconfig["vimls"].setup({
  capabilities = capabilities,
  on_attach = function(_, bufnr)
    on_attach(_, bufnr)
  end,
})

-- configure emmet language server
lspconfig["emmet_ls"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
  filetypes = { "html", "typescriptreact", "javascriptreact" },
})

-- configure lua server (with special settings)
lspconfig["lua_ls"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
  settings = { -- custom settings for lua
    Lua = {
      -- make the language server recognize "vim" global
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        -- make language server aware of runtime files
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.stdpath("config") .. "/lua"] = true,
        },
      },
    },
  },
})
cmp.setup.cmdline({ "/", "?" }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = "buffer" },
  },
})
cmp.setup.cmdline(":", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = "path" },
  }, {
    { name = "cmdline" },
  }),
})
vim.cmd([[
set completeopt=menuone,noinsert,noselect
highlight! default link CmpItemKind CmpItemMenuDefault
]])

vim.diagnostic.config({ virtual_text = true })
-- some test
-- local lsp_configss = {
-- 	capabilities = capabilities,
-- 	on_attach = function(_, bufnr)
-- 		on_attach(_, bufnr)
-- 	end,
-- }

-- require("mason-lspconfig").setup_handlers({
-- 	function(server_name)
-- 		require("lspconfig")[server_name].setup(lsp_config)
-- 	end,
-- 	sumneko_lua = function()
-- 		require("lspconfig").sumneko_lua.setup(vim.tbl_extend("force", lsp_config, {
-- 			settings = {
-- 				Lua = {
-- 					diagnostics = {
-- 						globals = { "vim" },
-- 					},
-- 				},
-- 			},
-- 		}))
-- 	end,
-- 	tsserver = function()
-- 		require("typescript").setup({
-- 			server = vim.tbl_extend("force", lsp_config, {
-- 				on_attach = function(_, bufnr)
-- 					on_attach(_, bufnr)
-- 				end,
-- 				init_options = {
-- 					preferences = {
-- 						importModuleSpecifierPreference = "project=relative",
-- 						jsxAttributeCompletionStylr = "none",
-- 					},
-- 				},
-- 			}),
-- 		})
-- 	end,
-- })
-- lspzero.preset("recommended")
-- lspzero.setup()
