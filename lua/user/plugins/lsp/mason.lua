return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "jayp0521/mason-null-ls.nvim",
  },
  opts = {
    ensure_installed = {
      "stylua",
    },
  },
  config = function(_, opts)
    require("mason").setup(opts)
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    local mason_null_ls = require("mason-null-ls")

    require("mason").setup(opts)
    local mr = require("mason-registry")
    mr:on("package:install:success", function()
      vim.defer_fn(function()
        -- trigger FileType event to possibly load this newly installed LSP server
        require("lazy.core.handler.event").trigger({
          event = "FileType",
          buf = vim.api.nvim_get_current_buf(),
        })
      end, 100)
    end)

    mr.refresh(function()
      for _, tool in ipairs(opts.ensure_installed) do
        local p = mr.get_package(tool)
        if not p:is_installed() then
          p:install()
        end
      end
    end)

    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    mason_lspconfig.setup({
      ensure_installed = {
        "ts_ls",
        "html",
        -- "cssls",
        -- "ccls",
        "tailwindcss",
        -- "svelte",
        -- "graphql",
        "emmet_ls",
        "lua_ls",
        -- "bashls",
      },
      -- auto-install configured servers (with lspconfig)
      automatic_installation = true, -- not the same as ensure_installed
    })

    mason_null_ls.setup({
      ensure_installed = {
        "stylua", -- lua formatter
        -- "prettier", -- ts/js formatter
        -- "eslint_d", -- ts/js linter
      },
      -- auto-install configured servers (with lspconfig)
      automatic_installation = true,
    })
  end,
}
