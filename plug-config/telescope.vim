if !exists('g:loaded_telescope') | finish | endif

"  nnoremap  <silent> :f <cmd>lua require('telescope.builtin').find_files()<cr>
"  nnoremap  <silent> :r <cmd>lua require('telescope.builtin').live_grep()<cr>
"  nnoremap <silent> \\ <cmd>Telescope buffers<cr>
"  nnoremap <silent> ;; <cmd>Telescope help_tags<cr>

lua << EOF
function telescope_buffer_dir()
  return vim.fn.expand('%:p:h')
end

local telescope = require('telescope')
local actions = require('telescope.actions')
local pickers = require ('telescope.pickers')
local action_state = require ('telescope.actions.state') 
local finders = require ('telescope.finders')
local icons = require "user.icons"

telescope.setup{
  pickers = {

  live_grep = {
    theme = "dropdown",
  },
  grep_string = {
    theme = "dropdown",
  },
  find_files = {
    theme = "dropdown",
    previewer = false,
  },
  buffers = {
    theme = "dropdown",
    previewer = false,
    initial_mode = "normal",
  },
  planets = {
    show_pluto = true,
    show_moon = true,
  },
  colorscheme = {
    -- enable_preview = true,
  },
  lsp_references = {
    theme = "dropdown",
    initial_mode = "normal",
  },
  lsp_definitions = {
    theme = "dropdown",
    initial_mode = "normal",
  },
  lsp_declarations = {
    theme = "dropdown",
    initial_mode = "normal",
  },
  lsp_implementations = {
    theme = "dropdown",
    initial_mode = "normal",
  },
  }
  extesions = {
    coc = {
        theme = 'dropdown',
        prefer_locations = true, -- always use Telescope locations to preview definitions/declarations/implementations etc
    },
    media_files = {
      filetypes = {'png', 'webp', 'jpg', 'jpeg','mp4', 'webm', 'pdf'},
      find_cmd = "rg" -- find command (defaults to `fd`)
    },
    ["ui-select"] = {
      layout_strategy = "cursor",
      layout_config = { width = 0.4, height = 0.3 },
      on_complete = {
        function()
          vim.cmd("stopinsert")
        end
      }
    }
  },
    
}
telescope.load_extension('coc')
telescope.load_extension('harpoon')
EOF

