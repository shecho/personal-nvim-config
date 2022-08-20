require'nvim-treesitter.configs'.setup {
  ignore_install ={ "php","phpdoc" },
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

