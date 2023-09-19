---@diagnostic disable: undefined-global
local setup, null_ls = pcall(require, "null-ls")
if not setup then
	return
end

-- for conciseness
local formatting = null_ls.builtins.formatting -- to setup formatters
local diagnostics = null_ls.builtins.diagnostics -- to setup linters

-- to setup format on save
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local lsp_formatting = function(bufnr)
	vim.lsp.buf.format({
		filter = function(client)
			-- apply whatever logic you want (in this example, we'll only use null-ls)
			return client.name == "null-ls"
		end,
		bufnr = bufnr,
	})
end
-- if you want to set up formatting on save, you can use this as a callback
-- local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

-- configure null_ls
null_ls.setup({
	-- setup formatters & linters
	-- debug = false,
	sources = {
		formatting.prettier, -- js/ts formatter
		-- formatting.prettierd,
		formatting.stylua, -- lua formatter
		null_ls.builtins.completion.spell,
		diagnostics.eslint,
		-- diagnostics.eslint_d.with({ -- js/ts linter
		-- 	-- diagnostics_format = "[eslint] #{m}\n(#{c})",
		-- 	condition = function(utils)
		-- 		return utils.root_has_file(".eslintrc.js") -- change file extension if you use something else
		-- 	end,
		-- }),
		require("typescript.extensions.null-ls.code-actions"),
		-- diagnostics.shellcheck,
	},
	-- configure format on save
	on_attach = function(current_client, bufnr)
		if current_client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
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

vim.api.nvim_create_user_command("DisableLspFormatting", function()
	vim.api.nvim_clear_autocmds({ group = augroup, buffer = 0 })
end, { nargs = 0 })
