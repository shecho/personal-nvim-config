---@diagnostic disable: undefined-global
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
local icons_status, icons = pcall(require, "nvim-web-devicons")
if not icons_status then
	return
end

-- import lspkind plugin safely
local lspkind_status, lspkind = pcall(require, "lspkind")
if not lspkind_status then
	return
end

-- load vs-code like snippets from plugins (e.g. friendly-snippets)
local loader = require("luasnip/loaders/from_vscode")
loader.lazy_load()

local has_words_before = function()
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end
-- vim.opt.completeopt = "menu,menuone,noselect"
vim.opt.completeopt = "menuone,noselect"

cmp.setup({
	-- view = {
	-- entries = "native_menu",
	-- },
	preselect = cmp.PreselectMode.Item,
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
		-- ["<CR>"] = cmp.mapping({
		-- 	i = cmp.mapping.confirm({ select = true }),
		-- }),
		["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
		-- ["<C-c>"] = cmp.mapping({
		-- 	i = cmp.mapping.abort(),
		-- 	c = cmp.mapping.close(),
		-- }),
		["<C-j>"] = cmp.mapping.confirm({ select = false }), -- next suggestion
		-- ["<C-l>"] = cmp.mapping.confirm({ select = false }),
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c", "n" }),
		["<C-e>"] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		}),
		["<Tab>"] = vim.schedule_wrap(function(fallback)
			if cmp.visible() and has_words_before() then
				cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
			else
				fallback()
			end
		end, { "i", "c" }),
		["<Right>"] = cmp.mapping({
			i = cmp.mapping.confirm({ select = true }),
		}),
	}),
	-- sources for autocompletion
	sources = cmp.config.sources({
		{ name = "luasnip" },
		{ name = "nvim_lua" },
		{ name = "vsnip" }, -- For vsnip users.
		{ name = "nvim_lsp" },
		{ name = "path" },
		{ name = "copilot", group_index = 2 },
		{
			name = "buffer",
			option = {
				get_bufnrs = function()
					return vim.api.nvim_list_bufs()
				end,
			},
		},
		{ name = "spell" },
		-- { name = "gh_issues" },
	}),
	-- configure lspkind for vs-code like icons
	formatting = {
		fields = { "kind", "abbr", "menu" },
		format = function(entry, vim_item)
			if vim.tbl_contains({ "path" }, entry.source.name) then
				local icon, hl_group = icons.get_icon(entry:get_completion_item().label)
				if icon then
					vim_item.kind = icon
					vim_item.kind_hl_group = hl_group
					return vim_item
				end
			end
			vim_item.menu = ({
				nvim_lua = "",
				nvim_lsp = "",
				luasnip = "",
				buffer = "",
				path = "",
				emoji = "",
			})[entry.source.name]
			return lspkind.cmp_format({ with_text = true })(entry, vim_item)
		end,

		-- format = lspkind.cmp_format({
		-- 	mode = "symbol", -- show only symbol annotations
		-- 	maxwidth = 50,
		-- 	ellipsis_char = "...",
		-- }),
	},
	experimental = {
		ghost_text = true,
	},
	window = {
		documentation = cmp.config.window.bordered(),
		completion = cmp.config.window.bordered(),
	},
	sorting = {
		priority_weight = 2,
		comparators = {
			require("copilot_cmp.comparators").prioritize,
			require("copilot_cmp.comparators").score,
			-- Below is the default comparitor list and order for nvim-cmp
			cmp.config.compare.offset,
			-- cmp.config.compare.scopes, --this is commented in nvim-cmp too
			cmp.config.compare.exact,
			cmp.config.compare.score,
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
