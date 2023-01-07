---@diagnostic disable: undefined-global
local cmp_status, cmp = pcall(require, "cmp")
if not cmp_status then
	return
end

-- import luasnip plugin safely
local luasnip_status, luasnip = pcall(require, "luasnip")
if not luasnip_status then
	return
end

-- import lspkind plugin safely
local lspkind_status, lspkind = pcall(require, "lspkind")
if not lspkind_status then
	return
end

-- load vs-code like snippets from plugins (e.g. friendly-snippets)
require("luasnip/loaders/from_vscode").lazy_load()

vim.opt.completeopt = "menu,menuone,noselect"

cmp.setup({
	view = {
		entries = "native_menu",
	},
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
		-- ["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
		["<C-e>"] = cmp.mapping.abort(), -- close completion window
		["<CR>"] = cmp.mapping.confirm({ select = false }),
		["<C-l>"] = cmp.mapping.confirm({ select = false }),
	}),
	-- sources for autocompletion
	sources = cmp.config.sources({
		{ name = "nvim_lua" },
		{ name = "vsnip" }, -- For vsnip users.
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "copilot" },
	}, {
		{ name = "path" },
		{ name = "buffer" },
	}, {
		{ name = "gh_issues" },
	}),
	-- configure lspkind for vs-code like icons
	formatting = {
		format = lspkind.cmp_format({
			mode = "symbol", -- show only symbol annotations
			maxwidth = 50,
			ellipsis_char = "...",
		}),
	},
	experimental = {
		ghost_text = true,
	},
})
