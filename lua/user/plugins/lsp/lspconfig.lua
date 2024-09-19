return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
  },
  config = function()
    local lspconfig = require("lspconfig")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")
    local keymap = vim.keymap

    local on_attach = function(_, bufnr)
      local opts = { noremap = true, silent = true, buffer = bufnr }
      opts.buffer = bufnr
      -- set keybinds
      opts.desc = "Show LSP references"
      -- keymap.set("n", "<leader>lS", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references
      keymap.set("n", "<leader>lS", "<cmd>FzfLua lsp_references<CR>", opts) -- show definition, references
      keymap.set("n", "<leader>ls", "<cmd>Lspsaga finder<CR>", opts) -- show definition, references
      keymap.set("n", "<leader>lr", "<cmd>Telescope lsp_references<CR>", opts) -- see available code actions
      -- keymap.set("n", "<leader>lr", vim.lsp.buf.references, opts) -- see available code actions

      opts.desc = "Show LSP definitions"
      -- keymap.set("n", "<leader>lD", vim.lsp.buf.definition, opts) -- go to declaration
      keymap.set("n", "<leader>ld", "<cmd>Lspsaga goto_definition<CR>", opts) -- show lsp definitions
      keymap.set("n", "<leader>lD", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions
      -- opts.desc = "Show LSP saga definitions"
      -- keymap.set("n", "<leader>lD", "<cmd>Lspsaga goto_definition<CR>", opts) -- show lsp definitions

      opts.desc = "Show LSP implementation"
      keymap.set("n", "<leader>lI", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts) -- go to implementation

      opts.desc = "Show LSP implementations"
      keymap.set("n", "<leader>li", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

      opts.desc = "Show LSP type definitions"
      keymap.set("n", "<leader>lT", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

      opts.desc = "See available code actions"
      keymap.set({ "n", "v" }, "<leader>lq", "<cmd>Lspsaga code_action<CR>", opts) -- see available code actions
      keymap.set({ "n", "v" }, "<leader>la", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

      opts.desc = "rename"
      keymap.set("n", "<leader>le", vim.lsp.buf.rename, opts) -- smart rename
      opts.desc = "Saga rename"
      keymap.set("n", "<leader>lR", "<cmd>Lspsaga rename<CR>", opts) -- see available code actions

      opts.desc = "Show buffer diagnostics"
      -- keymap.set("n", "<leader>lD", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file
      keymap.set("n", "<leader>ll", "<cmd>Lspsaga show_buf_diagnostics<CR>", opts) -- show  diagnostics for file

      opts.desc = "Go to previous diagnostic"
      keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

      opts.desc = "Go to next diagnostic"
      keymap.set("n", "<leader>ln", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer
      keymap.set("n", "<leader>lN", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts) -- jump to next diagnostic in buffer

      opts.desc = "Show documentation under cursor"
      keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor
      opts.desc = "Show saga hover"
      keymap.set("n", "<leader>k", "<cmd>Lspsaga hover_doc<CR>", opts) -- show documentation for what is under cursor
      opts.desc = "Toggle winbar"
      keymap.set("n", "<leader>lo", "<cmd>Lspsaga winbar_toggle<CR>", opts) -- show documentation for what is under cursor

      opts.desc = "Format"
      keymap.set("n", "<leader>lf", vim.lsp.buf.format, opts) -- nnoremap <leader>lf :lua vim.lsp.buf.format({async = true})<CR>

      -- opts.desc = "Restart LSP"
      -- keymap.set("n", "<leader>lr", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
    end

    -- used to enable autocompletion (assign to every lsp server config)
    local capabilities = cmp_nvim_lsp.default_capabilities()

    local signs = {
      Error = " ",
      Warn = " ",
      Hint = "󰠠 ",
      Info = " ",
    }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    -- configure html server
    lspconfig["html"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- configure css server
    lspconfig["cssls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- configure tailwindcss server
    lspconfig["tailwindcss"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    lspconfig["svelte"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    lspconfig["prismals"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    lspconfig["graphql"].setup({
      capabilities = capabilities,
      on_attach = on_attach,

      filetypes = {
        "graphql",
        "gql",
        "svelte",
        "typescriptreact",
        "javascriptreact",
      },
    })

    -- configure emmet language server
    lspconfig["emmet_ls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      filetypes = {
        "html",
        "typescriptreact",
        "javascriptreact",
        "css",
        "sass",
        "scss",
        "less",
        "svelte",
      },
    })

    -- configure python server
    lspconfig["pyright"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })
    lspconfig.clangd.setup({
      capabilities = capabilities,
      cmd = {
        "clangd",
        "--offset-encoding=utf-16",
      },
      on_attach = on_attach,
    })

    lspconfig.flow.setup({
      on_attach = on_attach,
      capabilities = capabilities,
    })

    lspconfig.eslint.setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    lspconfig["ts_ls"].setup({
      capabilities = capabilities,
      cmd = { "typescript-language-server", "--stdio" },
      on_attach = on_attach,
      filetypes = {
        "javascript",
        "javascriptreact",
        "javascript.jsx",
        "typescript",
        "typescriptreact",
        "typescript.tsx",
      },
    })

    -- configure lua server (with special settings)
    lspconfig["lua_ls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      settings = { -- custom settings for lua
        Lua = {
          -- make the language server recognize "vim" global
          diagnostics = { globals = { "vim" } },
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
  end,
}
