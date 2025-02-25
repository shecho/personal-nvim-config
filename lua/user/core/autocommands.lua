local f = require("user.core.functions")
-- show cursor line only in active window
-- vim.api.nvim_create_autocmd({ "InsertLeave", "WinEnter" }, {
--   callback = function()
--     if vim.w.auto_cursorline then
--       vim.wo.cursorline = true
--       vim.w.auto_cursorline = nil
--     end
--   end,
-- })
-- vim.api.nvim_create_autocmd({ "InsertEnter", "WinLeave" }, {
--   callback = function()
--     if vim.wo.cursorline then
--       vim.w.auto_cursorline = true
--       vim.wo.cursorline = false
--     end
--   end,
-- })
local function augroup(name)
  return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end
vim.api.nvim_create_autocmd("FileType", {
  group = augroup("close_with_q"),
  pattern = {
    "PlenaryTestPopup",
    "checkhealth",
    "dbout",
    "gitsigns-blame",
    "grug-far",
    "help",
    "lspinfo",
    "neotest-output",
    "neotest-output-panel",
    "neotest-summary",
    "notify",
    "qf",
    "spectre_panel",
    "startuptime",
    "tsplayground",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.schedule(function()
      vim.keymap.set("n", "q", function()
        vim.cmd("close")
        pcall(vim.api.nvim_buf_delete, event.buf, { force = true })
      end, {
        buffer = event.buf,
        silent = true,
        desc = "Quit buffer",
      })
    end)
  end,
})
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = {
    "Jaq",
    "qf",
    "help",
    "man",
    "lspinfo",
    "spectre_panel",
    "lir",
    "DressingSelect",
    "tsplayground",
    "Markdown",
  },
  callback = function()
    vim.cmd([[
      nnoremap <silent> <buffer> q :close<CR>
      nnoremap <silent> <buffer> <esc> :close<CR>
      set nobuflisted
    ]])
  end,
})

-- vim.api.nvim_create_autocmd({ "BufEnter" }, {
--   pattern = { "" },
--   callback = function()
--     local buf_ft = vim.bo.filetype
--     if buf_ft == "" or buf_ft == nil then
--       vim.cmd([[
--       nnoremap <silent> <buffer> q :close<CR>
--       nnoremap <silent> <buffer> <c-j> j<CR>
--       nnoremap <silent> <buffer> <c-k> k<CR>
--       set nobuflisted
--     ]])
--     end
--   end,
-- })

vim.api.nvim_create_autocmd({ "BufEnter" }, {
  pattern = { "" },
  callback = function()
    local get_project_dir = function()
      local cwd = vim.fn.getcwd()
      local project_dir = vim.split(cwd, "/")
      local project_name = project_dir[#project_dir]
      return project_name
    end

    vim.opt.titlestring = get_project_dir() .. " - nvim"
  end,
})

-- vim.api.nvim_create_autocmd({ "VimResized" }, {
--   callback = function()
--     vim.cmd("tabdo wincmd =")
--   end,
-- })

vim.api.nvim_create_autocmd({ "CmdWinEnter" }, {
  callback = function()
    vim.cmd("quit")
  end,
})

-- vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
--   callback = function()
--     vim.cmd("set formatoptions-=cro")
--   end,
-- })

-- highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
    -- vim.highlight.on_yank({ higroup = "Visual", timeout = 200 })
  end,
})

-- vim.api.nvim_create_autocmd({ "TextChanged", "InsertLeave" }, {
--   pattern = { "*" },
--   callback = function()
--     if vim.bo.ft == "harpoon" then
--       return
--     end
--     vim.cmd("silent! wall")
--   end,
--   nested = true,
-- })
--
-- vim.api.nvim_create_autocmd({ "BufWritePost" }, {
--   pattern = { "*.ts" },
--   callback = function()
--     vim.lsp.buf.format({ async = true })
--   end,
-- })
--
-- remove trailing whitespaces and ^M chars
f.autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  callback = function(_)
    local save_cursor = vim.fn.getpos(".")
    vim.cmd([[%s/\s\+$//e]])
    vim.fn.setpos(".", save_cursor)
  end,
})

-- Fix conceallevel for json files
vim.api.nvim_create_autocmd({ "FileType" }, {
  group = augroup("json_conceal"),
  pattern = { "json", "jsonc", "json5" },
  callback = function()
    vim.opt_local.conceallevel = 0
  end,
})
