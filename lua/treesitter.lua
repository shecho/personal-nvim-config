require'nvim-treesitter.configs'.setup {
  ignore_install ={ "php","phpdoc","sql",'erlang' },
  ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
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
  auto_install = true,
  indent = {
    enable = true,
    disable = {},
  },
  refactor = {
    highlight_current_scope = { enable = false },
  },
  rainbow = {
  enable = true,
  -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
  extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
  max_file_lines = nil, -- Do not enable for files with more than n lines, int
  additional_vim_regex_highlighting = true,
  -- colors = {}, -- table of hex strings
  rainbow = {
    enable = true,
    extended_mode = false,
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
  }
  -- termcolors = {} -- table of colour name strings
}
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

