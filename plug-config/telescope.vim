if !exists('g:loaded_telescope') | finish | endif

nnoremap  <silent> ;f <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap  <silent> ;r <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <silent> \\ <cmd>Telescope buffers<cr>
nnoremap <silent> ;; <cmd>Telescope help_tags<cr>

lua << EOF
function telescope_buffer_dir()
  return vim.fn.expand('%:p:h')
end

local telescope = require('telescope')
local actions = require('telescope.actions')
local pickers = require ('telescope.pickers')
local action_state = require ('telescope.actions.state') 
local finders = require ('telescope.finders')

telescope.setup{
  defaults = {
    mappings = {
      n = {
        ["q"] = actions.close
      },
    },
  layout_config = {
      horizontal = { width = 0.20, height = 0.95, prompt_position = 'top' },
      vertical = { width = 0.95, height = 95, prompt_position = 'top'},
    },
  },
  pickers = {
    find_files = {
      theme = "dropdown",
    },
}
telescope.load_extension("fzf")
EOF

