local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
	return "no found"
end

local icons = require("user.icons")
local utils = require("nvim-tree.utils")

local function my_on_attach(bufnr)
	local api = require("nvim-tree.api")
	local function opts(desc)
		return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
	end

	-- default mappings
	api.config.mappings.default_on_attach(bufnr)

	-- custom mappings
	vim.keymap.set("n", "<C-t>", api.tree.change_root_to_parent, opts("Up"))
	vim.keymap.set("n", "?", api.tree.toggle_help, opts("Help"))
	-- vim.keymap.set("n", "l", api.tree.open.edit, opts("Open"))
end

nvim_tree.setup({
	on_attach = my_on_attach,
	sort_by = "case_sensitive",
	hijack_directories = {
		enable = false,
	},
	disable_netrw = true,
	hijack_netrw = true,
	open_on_tab = true,
	update_cwd = true,
	-- open_on_setup = false,
	filters = {
		-- dotfiles = false,
		-- dotfiles = true,
		-- custom = { ".git" },
		exclude = { ".env" },
	},
	git = {
		enable = true,
		-- ignore = true,
		timeout = 500,
	},
	view = {
		width = 40,
		-- height = 30,
		hide_root_folder = false,
		side = "right",
		-- auto_resize = true,
		number = false,
		relativenumber = false,
		adaptive_size = true,
	},
	renderer = {
		add_trailing = false,
		group_empty = false,
		highlight_git = true,
		highlight_opened_files = "none",
		root_folder_modifier = ":t",
		indent_markers = {
			enable = false,
			icons = {
				corner = "└ ",
				edge = "│ ",
				none = "  ",
			},
		},
		icons = {
			webdev_colors = true,
			git_placement = "before",
			padding = " ",
			symlink_arrow = " ➛ ",
			show = {
				file = true,
				folder = true,
				folder_arrow = true,
				git = true,
			},
			glyphs = {
				default = "",
				symlink = "",
				folder = {
					arrow_open = icons.ui.ArrowOpen,
					arrow_closed = icons.ui.ArrowClosed,
					default = "",
					open = "",
					empty = "",
					empty_open = "",
					symlink = "",
					symlink_open = "",
				},
				git = {
					unstaged = "",
					staged = "",
					unmerged = "",
					renamed = "➜",
					untracked = "?",
					deleted = "",
					ignored = "◌",
				},
			},
		},
	},
})
