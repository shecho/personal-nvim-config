---@diagnostic disable: undefined-global, deprecated
local cmp_status, cmp = pcall(require, "cmp")
if not cmp_status then
	return
end

-- local cmp_autopairs_status, cmp_autopairs = pcall(require, "cmp")
-- if not cmp_autopairs_status then
-- 	return
-- end

-- import luasnip plugin safely
local luasnip_status, luasnip = pcall(require, "luasnip")
if not luasnip_status then
	return
end
-- icnos
-- local icons_status, icons = pcall(require, "nvim-web-devicons")
-- if not icons_status then
-- 	return
-- end

-- import lspkind plugin safely

local lspkind_status, lspkind = pcall(require, "lspkind")
if not lspkind_status then
	return
end

vim.api.nvim_set_hl(0, "CmpItemKind", { fg = "#61afef" })
vim.api.nvim_set_hl(0, "CmpItemKindColor", { fg = "#528bff" })
vim.api.nvim_set_hl(0, "CmpItemKindFunction", { fg = "#c678dd" })
vim.api.nvim_set_hl(0, "CmpItemKindConstant", { fg = "#98c379" })
vim.api.nvim_set_hl(0, "CmpItemKindSnippet", { fg = "#d19a66" })
vim.api.nvim_set_hl(0, "CmpItemKindVariable", { fg = "#526fff" })

local loader = require("luasnip/loaders/from_vscode")
loader.lazy_load()

local has_words_before = function()
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end
-- vim.opt.completeopt = "menu,menuone,noselect"
-- vim.opt.completeopt = "menu,menuone"
-- vim.opt.completeopt = "menu,preview,menuone,noselect"
vim.opt.completeopt = { "menu", "menuone", "noselect" }
-- vim.opt.completeopt = "menuone,noselect"

cmp.setup({
	preselect = cmp.PreselectMode.None,
	-- preselect = cmp.PreselectMode.item,
	-- view = {
	-- entries = "native_menu",
	-- },
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		["<CR>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = false,
		}),
		["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
		-- ["<C-c>"] = cmp.mapping({
		-- 	i = cmp.mapping.abort(),
		-- 	c = cmp.mapping.close(),
		-- }),
		-- ["<C-j>"] = cmp.mapping.confirm({ select = false }),
		["<C-j>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		}),
		["<C-l>"] = nil,
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c", "n" }),
		["<C-e>"] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		}),
		-- ["<Tab>"] = cmp.mapping({
		-- 	i = function()
		-- 		if vim.fn["UltiSnips#CanExpandSnippet"]() == 1 then
		-- 			return cmp.confirm({ select = true })
		-- 		end
		-- 		cmp.select_next_item({ behavior = cmp.SelectBehavior.Replace })
		-- 	end,
		-- 	c = function()
		-- 		if cmp.visible() and has_words_before() then
		-- 			cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
		-- 		else
		-- 			fallback()
		-- 		end
		-- 	end,
		-- }),
		["<Tab>"] = vim.schedule_wrap(function(fallback)
			if cmp.visible() and has_words_before() then
				cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
			else
				fallback()
			end
		end, { "i", "s" }),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),
		-- ["<Right>"] = cmp.mapping({
		-- 	i = cmp.mapping.confirm({ select = true }),
		-- }),
	}),
	-- sources for autocompletion
	sources = cmp.config.sources({
		{ name = "luasnip" },
		{ name = "nvim_lua" },
		{ name = "vsnip" }, -- For vsnip users.
		{ name = "nvim_lsp" },
		{ name = "path" },
		-- { name = "copilot", group_index = 2 },
		{
			name = "buffer",
			option = {
				get_bufnrs = function()
					return vim.api.nvim_list_bufs()
				end,
			},
		},
		{ name = "spell" },
		-- { name = "emoji" },
		-- { name = "look" },
		-- { name = "gh_issues" },
		-- { name = "treesitter" },
		-- { name = "rg", keyword_length = 3 },
	}),
	-- configure lspkind for vs-code like icons
	formatting = {
		-- fields = { "abbr", "kind", "menu" },
		fields = {
			cmp.ItemField.Abbr,
			cmp.ItemField.Kind,
			cmp.ItemField.Menu,
		},
		format = lspkind.cmp_format({
			mode = "symbol_text",
			maxwidth = 60,
			before = function(entry, vim_item)
				vim_item.menu = ({
					luasnip = "",
					nvim_lsp = "",
					nvim_lua = "ﲳ",
					treesitter = "",
					buffer = "﬘",
					path = "ﱮ",
					zsh = "",
					vsnip = "",
					spell = "暈",
				})[entry.source.name]
				return vim_item
			end,
		}),
	},
	experimental = {
		ghost_text = false,
	},
	window = {
		documentation = cmp.config.window.bordered(),
		completion = cmp.config.window.bordered(),
	},
	sorting = {
		priority_weight = 2,
		comparators = {
			-- require("copilot_cmp.comparators").prioritize,
			-- require("copilot_cmp.comparators").score,
			-- Below is the default comparitor list and order for nvim-cmp
			cmp.config.compare.offset,
			-- cmp.config.compare.scopes, --this is commented in nvim-cmp too
			cmp.config.compare.exact,
			cmp.config.compare.score,
			require("cmp-under-comparator").under,
			cmp.config.compare.recently_used,
			cmp.config.compare.locality,
			cmp.config.compare.kind,
			cmp.config.compare.sort_text,
			cmp.config.compare.length,
			cmp.config.compare.order,
		},
	},
})
vim.cmd(
	[[ autocmd FileType lua lua require'cmp'.setup.buffer { sources = { { name = 'buffer' },{ name = 'nvim_lua'},{name = "nvim_lsp"}},} ]]
)
local autocmd = vim.api.nvim_create_autocmd
autocmd("FileType", {
	pattern = "conf",
	callback = function()
		require("cmp").setup.buffer({ enabled = false })
	end,
})

cmp.setup.cmdline("/", {
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

cmp.event:on("menu_opened", function()
	vim.b.copilot_suggestion_hidden = false
end)
cmp.event:on("menu_closed", function()
	vim.b.copilot_suggestion_hidden = false
end)

-- vim.cmd([[
-- highlight! default link CmpItemKind CmpItemMenuDefault
-- ]])
