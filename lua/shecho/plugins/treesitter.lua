return {
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPre", "BufNewFile" },
		build = ":TSUpdate",
		dependencies = {
			"windwp/nvim-ts-autotag",
			"axelvc/template-string.nvim",
			"nvim-treesitter/nvim-treesitter-refactor",
		},
		config = function()
			local template_string = require("template-string")

			template_string.setup({
				filetypes = {
					"typescript",
					"javascript",
					"typescriptreact",
					"javascriptreact",
					"python",
				}, -- filetypes where the plugin is active
				jsx_brackets = true, -- must add brackets to jsx attributes
				remove_template_string = false, -- remove backticks when there are no template string
				restore_quotes = {
					-- quotes used when "remove_template_string" option is enabled
					normal = [[']],
					jsx = [["]],
				},
			})
			-- import nvim-treesitter plugin
			local treesitter = require("nvim-treesitter.configs")
			-- configure treesitter
			treesitter.setup({ -- enable syntax highlighting
				highlight = { enable = true },
				-- autotag = { enable = true },
				autotag = {
					enable = true,
					enable_rename = true,
					enable_close = true,
					enable_close_on_slash = true,
				},

				-- ensure these language parsers are installed
				ignore_install = { "php", "phpdoc", "sql", "erlang" },
				ensure_installed = {
					"json",
					"javascript",
					"typescript",
					"tsx",
					"yaml",
					"html",
					"css",
					"prisma",
					"markdown",
					"markdown_inline",
					"svelte",
					"graphql",
					"bash",
					"lua",
					"vim",
					"dockerfile",
					"gitignore",
				},
				-- enable nvim-ts-context-commentstring plugin for commenting tsx and jsx
				context_commentstring = { enable = true, enable_autocmd = false },
				-- auto install above language parsers
				auto_install = true,
				playground = {
					enable = true,
					disable = {},
					updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
					persist_queries = false, -- Whether the query persists across vim sessions
				},
				autopairs = { enable = true },
				indent = { enable = true, disable = { "python", "css", "rust" } },
				refactor = { highlight_current_scope = { enable = false } },
				rainbow = {
					enable = true,
					extended_mode = true,
					colors = {
						-- "#68a0b0",
						-- "#946EaD",
						-- "#c7aA6D",
						"Gold",
						"Orchid",
						"DodgerBlue",
						-- "Cornsilk",
						-- "Salmon",
						-- "LawnGreen",
					},
					disable = { "html" },
				},
				-- termcolors = {} -- table of colour name strings
				textobjects = {
					select = {
						enable = true,
						-- Automatically jump forward to textobj, similar to targets.vim
						lookahead = true,
						keymaps = {
							-- You can use the capture groups defined in textobjects.scm
							["af"] = "@function.outer",
							["if"] = "@function.inner",
							["at"] = "@class.outer",
							["it"] = "@class.inner",
							["ac"] = "@call.outer",
							["ic"] = "@call.inner",
							["aa"] = "@parameter.outer",
							["ia"] = "@parameter.inner",
							["al"] = "@loop.outer",
							["il"] = "@loop.inner",
							["ai"] = "@conditional.outer",
							["ii"] = "@conditional.inner",
							["a/"] = "@comment.outer",
							["i/"] = "@comment.inner",
							["ab"] = "@block.outer",
							["ib"] = "@block.inner",
							["as"] = "@statement.outer",
							["is"] = "@scopename.inner",
							["aA"] = "@attribute.outer",
							["iA"] = "@attribute.inner",
							["aF"] = "@frame.outer",
							["iF"] = "@frame.inner",
						},
					},
					move = {
						enable = true,
						set_jumps = true, -- whether to set jumps in the jumplist
						goto_next_start = {
							["]m"] = "@function.outer",
							["]]"] = "@class.outer",
						},
						goto_next_end = {
							["]M"] = "@function.outer",
							["]["] = "@class.outer",
						},
						goto_previous_start = {
							["[m"] = "@function.outer",
							["[["] = "@class.outer",
						},
						goto_previous_end = {
							["[M"] = "@function.outer",
							["[]"] = "@class.outer",
						},
					},
					swap = {
						enable = true,
						swap_next = { ["<leader>."] = "@parameter.inner" },
						swap_previous = { ["<leader>,"] = "@parameter.inner" },
					},
				},
			})
		end,
	},
}
