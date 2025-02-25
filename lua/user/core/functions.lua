local M = {}

function M.remove_augroup(name)
  if vim.fn.exists("#" .. name) == 1 then
    vim.cmd("au! " .. name)
  end
end

-- get length of current word
function M.get_word_length()
  local word = vim.fn.expand("<cword>")
  return #word
end

function M.toggle_option(option)
  local value = not vim.api.nvim_get_option_value(option, {})
  vim.opt[option] = value
  vim.notify(option .. " set to " .. tostring(value))
end

function M.isempty(s)
  return s == nil or s == ""
end

function M.get_buf_option(opt)
  local status_ok, buf_option = pcall(vim.api.nvim_get_option_value, 0, opt)
  if not status_ok then
    return nil
  else
    return buf_option
  end
end

function M.smart_quit()
  local bufnr = vim.api.nvim_get_current_buf()
  local modified = vim.api.nvim_get_option_value("modified", { buf = bufnr })
  if modified then
    vim.ui.input({ prompt = "You have unsaved changes. Quit anyway? (y/n) " }, function(input)
      if input == "y" then
        vim.cmd("q!")
      end
    end)
  else
    vim.cmd("q!")
  end
end

function M.saveFile()
  -- Check if a buffer with a file is open
  if vim.fn.empty(vim.fn.expand("%:t")) == 1 then
    vim.notify("No file to save", vim.log.levels.WARN)
    return
  end

  local filename = vim.fn.expand("%:t") -- Get only the filename
  local success, err = pcall(function()
    vim.cmd("silent! write") -- Try to save the file without showing the default message
  end)

  if success then
    vim.notify(filename .. " Saved!") -- Show only the custom message if successful
  else
    vim.notify("Error: " .. err, vim.log.levels.ERROR) -- Show the error message if it fails
  end
end

---@param on_attach fun(client, buffer)
function M.on_attach(on_attach)
  vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
      local buffer = args.buf
      local client = vim.lsp.get_client_by_id(args.data.client_id)
      on_attach(client, buffer)
    end,
  })
end

M.cmd = function(name, command, desc)
  vim.api.nvim_create_user_command(name, command, desc)
end

M.autocmd = function(evt, opts)
  vim.api.nvim_create_autocmd(evt, opts)
end
-- function M.toggleInlayHints()
--   vim.lsp.inlay_hint.enable(0, not vim.lsp.inlay_hint.is_enabled())
-- end

return M
