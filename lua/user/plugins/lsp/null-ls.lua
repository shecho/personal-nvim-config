return {
  "nvimtools/none-ls.nvim", -- configure formatters & linters
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local null_ls = require("null-ls")
    local formatting = null_ls.builtins.formatting -- to setup formatters
    -- local null_ls_utils = require("null-ls.utils")
    -- local diagnostics = null_ls.builtins.diagnostics -- to setup linters

    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

    null_ls.setup({
      -- add package.json as identifier for root (for typescript monorepos)
      -- root_dir = null_ls_utils.root_pattern(".null-ls-root", "Makefile", ".git", "package.json"),
      -- setup formatters & linters
      sources = {
        formatting.prettier, -- js/ts formatter
        null_ls.builtins.diagnostics.eslint,
        -- formatting.prettierd,
        formatting.stylua, -- lua formatter
        null_ls.builtins.completion.spell, -- diagnostics.eslint,
        -- diagnostics.eslint_d.with({ -- js/ts linter
        --   condition = function(utils)
        --     return utils.root_has_file({
        --       ".eslintrc.js",
        --       ".eslintrc.cjs",
        --     }) -- only enable if root has .eslintrc.js or .eslintrc.cjs
        --   end,
        -- }), -- diagnostics.eslint_d.with({ -- js/ts linter
        -- 	-- diagnostics_format = "[eslint] #{m}\n(#{c})",
        -- 	condition = function(utils)
        -- 		return utils.root_has_file(".eslintrc.js") -- change file extension if you use something else
        -- 	end,
        -- }),
      },
      -- configure format on save
      on_attach = function(current_client, bufnr)
        if current_client.supports_method("textDocument/formatting") then
          vim.api.nvim_clear_autocmds({
            group = augroup,
            buffer = bufnr,
          })
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format({
                filter = function(client)
                  return client.name == "null-ls"
                end,
                bufnr = bufnr,
              })
            end,
          })
        end
      end,
    })
  end,
}
