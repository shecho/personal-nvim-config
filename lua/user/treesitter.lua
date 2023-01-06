local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end
configs.setup {
  ignore_install ={ "php","phpdoc","sql",'erlang' },
  ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  auto_install = true,
  highlight = {
    enable = true,              -- false will disable the whole extension
  },
  playground = {
    enable = true,
    disable = {},
    updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
    persist_queries = false -- Whether the query persists across vim sessions
  },
  autotag = {
    enable = true,
  },
  autopairs = {
    enable = true,
  },
  indent = {
    enable = true,
    disable = {"python", "css", "rust" },
  },
  refactor = {
    highlight_current_scope = { enable = false },
  },
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

}

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }

-- require "nvim-treesitter.configs".setup {
--   playground = {
--     enable = true,
--     disable = {},
--     updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
--     persist_queries = false -- Whether the query persists across vim sessions
--   },
-- }
--  ensure_installed = {
--     "tsx",
--     "json",
--     "html",
--     "scss"
--   },
-- }

-- require'nvim-treesitter.configs'.setup {
--   refactor = {
--     highlight_current_scope = { enable = false },
--   },
-- }

-- require'nvim-treesitter.configs'.setup {
--   refactor = {
--     smart_rename = {
--       enable = true,
--       keymaps = {
--         smart_rename = "grr",
--       },
--     },
--   },
-- }

