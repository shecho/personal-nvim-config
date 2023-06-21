---@diagnostic disable: unused-local, undefined-global
local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
	return
end

local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if not config_status_ok then
	return
end

local icons = require("user.icons")
local tree_cb = nvim_tree_config.nvim_tree_callback

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
	vim.keymap.set("n", "l", api.tree.open.edit, opts("Open"))
end
---@diagnostic disable-next-line: unused-local
-- local function notify_level(level)
-- 	return function(msg)
-- 		vim.schedule(function()
-- 			vim.api.nvim_echo({ { msg, "WarningMsg" } }, false, {})
-- 		end)
-- 	end
-- end

-- utils.notify.warn = notify_level(vim.log.levels.WARN)
-- utils.notify.error = notify_level(vim.log.levels.ERROR)
-- utils.notify.info = notify_level(vim.log.levels.INFO)
-- utils.notify.debug = notify_level(vim.log.levels.DEBUG)

nvim_tree.setup({
	on_attach = my_on_attach,
	hijack_directories = {
		enable = false,
	},
	disable_netrw = true,
	hijack_netrw = true,
	-- open_on_setup = false,
	filters = {
		-- dotfiles = false,
		-- custom = { ".git" },
		exclude = { ".env" },
	},
	-- auto_close = true,
	open_on_tab = true,
	-- hijack_cursor = false,
	update_cwd = true,
	-- update_to_buf_dir = {
	--   enable = true,
	--   auto_open = true,
	-- },
	--   error
	-- --   info
	-- --   question
	-- --   warning
	-- --   lightbulb
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
					staged = "S",
					unmerged = "",
					renamed = "➜",
					untracked = "?",
					deleted = "",
					ignored = "◌",
				},
			},
		},
	},
	diagnostics = {
		enable = true,
		icons = {
			hint = icons.diagnostics.Hint,
			info = icons.diagnostics.Information,
			warning = icons.diagnostics.Warning,
			error = icons.diagnostics.Error,
		},
	},
	update_focused_file = {
		enable = true,
		update_cwd = true,
		ignore_list = {},
	},
	-- system_open = {
	--   cmd = nil,
	--   args = {},
	-- },
	-- filters = {
	--   dotfiles = false,
	--   custom = {},
	-- },
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
})
